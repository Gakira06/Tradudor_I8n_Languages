"use strict";

const repo = require("../repositories/traducoes.repository");

const I18N_DEBUG = process.env.I18N_DEBUG === "1";

function debugLog(...args) {
  if (I18N_DEBUG) {
    console.log("[I18N_DEBUG]", ...args);
  }
}

const PRODUCT_LOCALES = ["pt-BR", "pt-PT", "en-US", "it-IT", "es-ES", "ar-MA"];
const TRANSLATE_CODE_MAP = {
  "pt-BR": "pt-BR",
  "pt-PT": "pt-PT",
  "en-US": "en",
  "it-IT": "it",
  "es-ES": "es",
  "ar-MA": "ar",
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

async function translateText(text, fromLocale, toLocale) {
  if (!text) return "";
  if (fromLocale === toLocale) return text;

  const from = TRANSLATE_CODE_MAP[fromLocale] ?? fromLocale;
  const to = TRANSLATE_CODE_MAP[toLocale] ?? toLocale;
  debugLog("translateText:start", { fromLocale, toLocale, from, to, text });

  // Tenta LibreTranslate primeiro (se configurado)
  if (process.env.LIBRETRANSLATE_URL) {
    try {
      const libretranslateUrl = process.env.LIBRETRANSLATE_URL;
      const libretranslateKey = process.env.LIBRETRANSLATE_API_KEY;

      const body = {
        q: text,
        source_language: from,
        target_language: to,
      };

      if (libretranslateKey) {
        body.api_key = libretranslateKey;
      }

      const res = await fetch(libretranslateUrl, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(body),
        timeout: 10000,
      });

      if (res.ok) {
        const data = await res.json();
        const translated = data?.translatedText?.trim();
        debugLog("translateText:libretranslate", {
          from,
          to,
          text,
          translated,
          unchanged:
            String(translated || "").toLowerCase() ===
            String(text).trim().toLowerCase(),
        });
        if (
          translated &&
          translated.toLowerCase() !== String(text).trim().toLowerCase()
        ) {
          debugLog("translateText:provider_selected", {
            provider: "libretranslate",
            from,
            to,
            text,
            translated,
          });
          return translated;
        }
      }
    } catch (error) {
      console.warn(`LibreTranslate fallback to MyMemory: ${error.message}`);
    }
  }

  // Fallback para MyMemory (sempre disponível, testado e confiável)
  try {
    const res = await fetch(
      `https://api.mymemory.translated.net/get?q=${encodeURIComponent(text)}&langpair=${encodeURIComponent(from)}|${encodeURIComponent(to)}`,
    );
    if (!res.ok) return text;
    const data = await res.json();
    const translated = data?.responseData?.translatedText?.trim();
    debugLog("translateText:provider_selected", {
      provider: "mymemory",
      from,
      to,
      text,
      translated,
      match: data?.responseData?.match,
    });
    return translated || text;
  } catch (error) {
    console.warn(
      `MyMemory translation failed: ${error.message}. Returning original text.`,
    );
    return text;
  }
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
        : "";
      const translatedCategory = category
        ? await translateText(category, sourceLocale, locale)
        : "";

      debugLog("produto_auto:locale_result", {
        locale,
        productId: id,
        translatedName,
        translatedDescription,
        translatedCategory,
      });

      const nameRecord = await repo.inserir({
        chave: `PRODUCT_${id}_NAME`.toUpperCase(),
        valor: translatedName,
        codigoSistema: safeSystem,
        codigoIdioma: locale,
      });
      saved += 1;
      results.push(nameRecord);

      if (description && String(description).trim() !== "") {
        const descRecord = await repo.inserir({
          chave: `PRODUCT_${id}_DESC`.toUpperCase(),
          valor: translatedDescription,
          codigoSistema: safeSystem,
          codigoIdioma: locale,
        });
        saved += 1;
        results.push(descRecord);
      }

      if (category && String(category).trim() !== "") {
        const catRecord = await repo.inserir({
          chave: normalizeCategoryKey(category).toUpperCase(),
          valor: translatedCategory,
          codigoSistema: safeSystem,
          codigoIdioma: locale,
        });
        saved += 1;
        results.push(catRecord);
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
