"use strict";

const repo = require("../repositories/traducoes.repository");

const I18N_DEBUG = process.env.I18N_DEBUG === "1";

function debugLog(...args) {
  if (I18N_DEBUG) {
    console.log("[I18N_DEBUG]", ...args);
  }
}

const PRODUCT_LOCALES = ["pt-BR", "pt-PT", "en-US", "it-IT", "es-ES", "ar-MA"];
const AI_TRANSLATION_MODEL =
  process.env.AI_TRANSLATION_MODEL || "gemini-2.0-flash";
const AI_TRANSLATION_BASE_URL = (
  process.env.AI_TRANSLATION_BASE_URL ||
  "https://generativelanguage.googleapis.com/v1beta/openai"
).replace(/\/$/, "");
const LOCALE_NAME_MAP = {
  "pt-BR": "Portuguese (Brazil)",
  "pt-PT": "Portuguese (Portugal)",
  "en-US": "English (US)",
  "it-IT": "Italian",
  "es-ES": "Spanish (Spain)",
  "ar-MA": "Arabic (Morocco)",
};

// Idiomas escritos da direita para a esquerda
const RTL_LOCALES = new Set([
  "ar-MA",
  "ar-SA",
  "ar-EG",
  "he-IL",
  "fa-IR",
  "ur-PK",
]);

function normalizeCategoryKey(cat) {
  return `CAT_${(cat ?? "GERAL")
    .toUpperCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/\s+/g, "_")
    .replace(/[^A-Z0-9_]/g, "")}`;
}

function normalizeAiTranslation(text) {
  return String(text ?? "")
    .trim()
    .replace(/^['"`]+|['"`]+$/g, "")
    .replace(/^Translation:\s*/i, "")
    .trim();
}

async function translateWithAI(text, fromLocale, toLocale) {
  const apiKey = process.env.AI_TRANSLATION_API_KEY;
  if (!apiKey) {
    return {
      text,
      translated: false,
      provider: "ai",
      reason: "missing_api_key",
    };
  }

  const fromName = LOCALE_NAME_MAP[fromLocale] ?? fromLocale;
  const toName = LOCALE_NAME_MAP[toLocale] ?? toLocale;
  const endpoint = `${AI_TRANSLATION_BASE_URL}/chat/completions`;

  debugLog("translateText:ai_request", {
    endpoint,
    model: AI_TRANSLATION_MODEL,
    fromLocale,
    toLocale,
    text,
  });

  try {
    const res = await fetch(endpoint, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${apiKey}`,
      },
      body: JSON.stringify({
        model: AI_TRANSLATION_MODEL,
        temperature: 0.1,
        messages: [
          {
            role: "system",
            content:
              "You are a professional restaurant menu translator. Translate accurately, keep culinary context, preserve brand names and proper nouns when appropriate, and return only the translated text.",
          },
          {
            role: "user",
            content: [
              `Translate from ${fromName} to ${toName}.`,
              "Return only the translation, with no quotes, labels, or explanation.",
              `Text: ${text}`,
            ].join("\n"),
          },
        ],
      }),
      timeout: 30000,
    });

    debugLog("translateText:ai_status", {
      model: AI_TRANSLATION_MODEL,
      fromLocale,
      toLocale,
      status: res.status,
      ok: res.ok,
    });

    if (!res.ok) {
      const responseText = await res.text();
      debugLog("translateText:ai_non_ok", {
        model: AI_TRANSLATION_MODEL,
        fromLocale,
        toLocale,
        status: res.status,
        body: responseText.slice(0, 500),
      });
      return {
        text,
        translated: false,
        provider: "ai",
        reason: "http_error",
        status: res.status,
      };
    }

    const data = await res.json();
    const translated = normalizeAiTranslation(
      data?.choices?.[0]?.message?.content,
    );
    const translatedSuccessfully =
      Boolean(translated) &&
      translated.toLowerCase() !== String(text).trim().toLowerCase();

    debugLog("translateText:provider_selected", {
      provider: "ai",
      model: AI_TRANSLATION_MODEL,
      fromLocale,
      toLocale,
      text,
      translated,
      translatedSuccessfully,
    });

    return {
      text: translated || text,
      translated: translatedSuccessfully,
      provider: "ai",
      reason: translatedSuccessfully ? "success" : "unchanged-or-empty",
      model: AI_TRANSLATION_MODEL,
    };
  } catch (error) {
    debugLog("translateText:ai_error", {
      model: AI_TRANSLATION_MODEL,
      fromLocale,
      toLocale,
      message: error.message,
    });
    return {
      text,
      translated: false,
      provider: "ai",
      reason: "network_error",
      error: error.message,
    };
  }
}

async function translateText(text, fromLocale, toLocale) {
  if (!text) {
    return { text: "", translated: false, provider: null, reason: "empty" };
  }
  if (fromLocale === toLocale) {
    return {
      text,
      translated: true,
      provider: "source",
      reason: "same-locale",
    };
  }

  debugLog("translateText:start", { fromLocale, toLocale, text });
  debugLog("translateText:providers", {
    aiEnabled: Boolean(process.env.AI_TRANSLATION_API_KEY),
    aiBaseUrl: AI_TRANSLATION_BASE_URL,
    aiModel: AI_TRANSLATION_MODEL,
  });

  return translateWithAI(text, fromLocale, toLocale);
}

async function saveTranslatedValue({
  key,
  locale,
  sourceLocale,
  sourceText,
  translationResult,
  safeSystem,
}) {
  if (!sourceText || String(sourceText).trim() === "") {
    return null;
  }

  if (locale === sourceLocale) {
    return repo.inserir({
      chave: key,
      valor: sourceText,
      codigoSistema: safeSystem,
      codigoIdioma: locale,
    });
  }

  if (translationResult?.translated) {
    return repo.inserir({
      chave: key,
      valor: translationResult.text,
      codigoSistema: safeSystem,
      codigoIdioma: locale,
    });
  }

  const existing = await repo.findByChaveSistemaEIdioma(
    key,
    safeSystem,
    locale,
  );
  if (existing && existing.valor && existing.valor !== sourceText) {
    debugLog("produto_auto:preserve_existing", {
      key,
      locale,
      provider: translationResult?.provider,
      reason: translationResult?.reason,
      preservedValue: existing.valor,
    });
    return existing;
  }

  debugLog("produto_auto:skip_overwrite", {
    key,
    locale,
    provider: translationResult?.provider,
    reason: translationResult?.reason,
    sourceText,
  });
  return null;
}

/**
 * GET /traducoes/:sistema/:idioma
 *
 * Retorna todas as traduções do sistema no idioma solicitado.
 * Aplica fallback para pt-BR quando uma chave não existir no idioma pedido.
 *
 * Resposta de sucesso:
 * {
 *   "idioma": "ar-MA",
 *   "direcao": "rtl",
 *   "traducoes": {
 *     "NAV_HOME": "الصفحة الرئيسية",
 *     "BTN_SEND": "إرسال"
 *   }
 * }
 */
async function listar(req, res, next) {
  try {
    const { sistema, idioma } = req.params;

    // Valida existência do sistema e do idioma
    const [sistemaObj, idiomaObj] = await Promise.all([
      repo.findSistema(sistema),
      repo.findIdioma(idioma),
    ]);

    if (!sistemaObj) {
      return res
        .status(404)
        .json({ erro: `Sistema '${sistema}' não encontrado ou inativo.` });
    }
    if (!idiomaObj) {
      return res
        .status(404)
        .json({ erro: `Idioma '${idioma}' não encontrado ou inativo.` });
    }

    // Busca traduções com lógica de fallback embutida no repositório
    const linhas = await repo.findComFallback(sistema, idioma);

    // Monta o objeto chave-valor final
    const traducoes = {};
    for (const linha of linhas) {
      traducoes[linha.chave] = linha.valor;
    }

    const direcao = RTL_LOCALES.has(idioma) ? "rtl" : idiomaObj.direcao;

    return res.status(200).json({
      idioma: idiomaObj.codigo,
      direcao,
      traducoes,
    });
  } catch (err) {
    next(err);
  }
}

/**
 * POST /traducoes
 *
 * Corpo esperado (application/json):
 * {
 *   "chave":   "BTN_CONFIRM",
 *   "valor":   "Confirmar",
 *   "sistema": "website",
 *   "idioma":  "pt-BR"
 * }
 *
 * Usa INSERT ... ON CONFLICT DO UPDATE, portanto serve tanto para
 * criar quanto para atualizar uma tradução existente.
 */
async function cadastrar(req, res, next) {
  try {
    const { chave, valor, sistema, idioma } = req.body;

    // Validação dos campos obrigatórios
    const camposFaltando = ["chave", "valor", "sistema", "idioma"].filter(
      (campo) => !req.body[campo] || String(req.body[campo]).trim() === "",
    );
    if (camposFaltando.length > 0) {
      return res.status(400).json({
        erro: "Campos obrigatórios ausentes ou vazios.",
        campos: camposFaltando,
      });
    }

    const registro = await repo.inserir({
      chave: chave.trim().toUpperCase(),
      valor: valor.trim(),
      codigoSistema: sistema.trim().toLowerCase(),
      codigoIdioma: idioma.trim(),
    });

    return res.status(201).json({
      mensagem: "Tradução cadastrada/atualizada com sucesso.",
      dado: registro,
    });
  } catch (err) {
    // Erros de negócio propagados pelo repositório (404)
    if (err.statusCode) {
      return res.status(err.statusCode).json({ erro: err.message });
    }
    next(err);
  }
}

/**
 * POST /traducoes/produto-auto
 *
 * Traduz e salva nome/descrição/categoria de produto para todos os idiomas.
 *
 * Body:
 * {
 *   "productId": "cmo...",
 *   "name": "Morango com nutella",
 *   "description": "...",
 *   "category": "Doce",
 *   "baseLocale": "pt-BR",
 *   "sistema": "website"
 * }
 */
async function cadastrarProdutoAuto(req, res, next) {
  try {
    const {
      productId,
      name,
      description,
      category,
      baseLocale = "pt-BR",
      sistema = "website",
    } = req.body;

    if (!productId || String(productId).trim() === "") {
      return res
        .status(400)
        .json({ erro: "Campo obrigatório ausente: productId" });
    }
    if (!name || String(name).trim() === "") {
      return res.status(400).json({ erro: "Campo obrigatório ausente: name" });
    }

    const id = String(productId).trim();
    const safeSystem = String(sistema).trim().toLowerCase();
    const sourceLocale = PRODUCT_LOCALES.includes(baseLocale)
      ? baseLocale
      : "pt-BR";

    debugLog("produto_auto:start", {
      productId: id,
      sourceLocale,
      sistema: safeSystem,
      hasDescription: Boolean(description),
      hasCategory: Boolean(category),
      name,
      description,
      category,
    });

    let saved = 0;
    const results = [];

    for (const locale of PRODUCT_LOCALES) {
      const translatedName = await translateText(name, sourceLocale, locale);
      const translatedDescription = description
        ? await translateText(description, sourceLocale, locale)
        : null;
      const translatedCategory = category
        ? await translateText(category, sourceLocale, locale)
        : null;

      debugLog("produto_auto:locale_result", {
        locale,
        productId: id,
        translatedName: translatedName?.text,
        translatedDescription: translatedDescription?.text,
        translatedCategory: translatedCategory?.text,
        translatedNameOk: translatedName?.translated,
        translatedDescriptionOk: translatedDescription?.translated,
        translatedCategoryOk: translatedCategory?.translated,
      });

      const nameRecord = await saveTranslatedValue({
        key: `PRODUCT_${id}_NAME`.toUpperCase(),
        locale,
        sourceLocale,
        sourceText: name,
        translationResult: translatedName,
        safeSystem,
      });
      if (nameRecord) {
        saved += 1;
        results.push(nameRecord);
      }

      if (description && String(description).trim() !== "") {
        const descRecord = await saveTranslatedValue({
          key: `PRODUCT_${id}_DESC`.toUpperCase(),
          locale,
          sourceLocale,
          sourceText: description,
          translationResult: translatedDescription,
          safeSystem,
        });
        if (descRecord) {
          saved += 1;
          results.push(descRecord);
        }
      }

      if (category && String(category).trim() !== "") {
        const catRecord = await saveTranslatedValue({
          key: normalizeCategoryKey(category).toUpperCase(),
          locale,
          sourceLocale,
          sourceText: category,
          translationResult: translatedCategory,
          safeSystem,
        });
        if (catRecord) {
          saved += 1;
          results.push(catRecord);
        }
      }
    }

    return res.status(201).json({
      mensagem: "Traduções do produto cadastradas/atualizadas com sucesso.",
      resumo: {
        productId: id,
        baseLocale: sourceLocale,
        idiomas: PRODUCT_LOCALES,
        totalSalvos: saved,
      },
      dados: results,
    });
  } catch (err) {
    debugLog("produto_auto:error", {
      message: err?.message,
      stack: err?.stack,
    });
    if (err.statusCode) {
      return res.status(err.statusCode).json({ erro: err.message });
    }
    next(err);
  }
}

module.exports = { listar, cadastrar, cadastrarProdutoAuto };
