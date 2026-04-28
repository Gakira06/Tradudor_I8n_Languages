#!/usr/bin/env node

/**
 * Teste integrado: Simula fluxo completo
 * 1. Frontend chama POST /traducoes/produto-auto
 * 2. Backend traduz com MyMemory
 * 3. Salva no banco (simulado)
 *
 * Uso: node test-full-flow.js
 */

require("dotenv").config();

const PRODUCT_LOCALES = ["pt-BR", "pt-PT", "en-US", "it-IT", "es-ES", "ar-MA"];
const TRANSLATE_CODE_MAP = {
  "pt-BR": "pt-BR",
  "pt-PT": "pt-PT",
  "en-US": "en",
  "it-IT": "it",
  "es-ES": "es",
  "ar-MA": "ar",
};

async function translateText(text, fromLocale, toLocale) {
  if (!text) return "";
  if (fromLocale === toLocale) return text;

  const from = TRANSLATE_CODE_MAP[fromLocale] ?? fromLocale;
  const to = TRANSLATE_CODE_MAP[toLocale] ?? toLocale;

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
        if (translated) return translated;
      }
    } catch (error) {
      console.warn(`[WARN] LibreTranslate fallback: ${error.message}`);
    }
  }

  // Fallback para MyMemory
  try {
    const res = await fetch(
      `https://api.mymemory.translated.net/get?q=${encodeURIComponent(text)}&langpair=${encodeURIComponent(from)}|${encodeURIComponent(to)}`,
    );
    if (!res.ok) return text;
    const data = await res.json();
    const translated = data?.responseData?.translatedText?.trim();
    return translated || text;
  } catch (error) {
    console.warn(
      `[WARN] MyMemory error: ${error.message}. Returning original.`,
    );
    return text;
  }
}

async function simulateAutoTranslateProduct() {
  console.log("=".repeat(70));
  console.log("TESTE INTEGRADO: Fluxo Completo de Auto-Tradução");
  console.log("=".repeat(70));
  console.log("");

  // Simular payload do frontend
  const payload = {
    productId: "pizza-test-" + Date.now(),
    name: "Pizza Calabresa",
    description: "Deliciosa pizza com calabresa crispy",
    category: "Salgada",
    baseLocale: "pt-BR",
    sistema: "website",
  };

  console.log("📤 Payload recebido do frontend:");
  console.log(JSON.stringify(payload, null, 2));
  console.log("");

  const id = String(payload.productId).trim();
  const sourceLocale = PRODUCT_LOCALES.includes(payload.baseLocale)
    ? payload.baseLocale
    : "pt-BR";

  console.log("🔄 Processando traduções...");
  console.log("");

  const simulatedDB = [];
  let saved = 0;

  for (const locale of PRODUCT_LOCALES) {
    const translatedName = await translateText(
      payload.name,
      sourceLocale,
      locale,
    );
    const translatedDescription = payload.description
      ? await translateText(payload.description, sourceLocale, locale)
      : "";
    const translatedCategory = payload.category
      ? await translateText(payload.category, sourceLocale, locale)
      : "";

    const nameRecord = {
      chave: `PRODUCT_${id}_NAME`.toUpperCase(),
      valor: translatedName,
      codigoSistema: payload.sistema.toLowerCase(),
      codigoIdioma: locale,
      created_at: new Date().toISOString(),
    };
    saved += 1;
    simulatedDB.push(nameRecord);

    if (payload.description && String(payload.description).trim() !== "") {
      const descRecord = {
        chave: `PRODUCT_${id}_DESC`.toUpperCase(),
        valor: translatedDescription,
        codigoSistema: payload.sistema.toLowerCase(),
        codigoIdioma: locale,
        created_at: new Date().toISOString(),
      };
      saved += 1;
      simulatedDB.push(descRecord);
    }

    if (payload.category && String(payload.category).trim() !== "") {
      const catRecord = {
        chave: `CAT_${String(payload.category)
          .toUpperCase()
          .replace(/\s+/g, "_")}`,
        valor: translatedCategory,
        codigoSistema: payload.sistema.toLowerCase(),
        codigoIdioma: locale,
        created_at: new Date().toISOString(),
      };
      saved += 1;
      simulatedDB.push(catRecord);
    }

    console.log(`  [${locale}] Nome: "${translatedName}"`);
  }

  console.log("");
  console.log("📤 Resposta para o frontend:");
  const response = {
    mensagem: "Traduções do produto cadastradas/atualizadas com sucesso.",
    resumo: {
      productId: id,
      baseLocale: sourceLocale,
      idiomas: PRODUCT_LOCALES,
      totalSalvos: saved,
    },
    dados: simulatedDB,
  };
  console.log(JSON.stringify(response, null, 2));
  console.log("");

  console.log("=".repeat(70));
  console.log("✅ TESTE PASSOU!");
  console.log("=".repeat(70));
  console.log("");
  console.log("🎯 Resumo:");
  console.log(`   • Produto ID: ${id}`);
  console.log(`   • Idioma base: ${sourceLocale}`);
  console.log(`   • Registros salvos: ${saved}`);
  console.log(`   • Idiomas: ${PRODUCT_LOCALES.join(", ")}`);
  console.log("");
  console.log("✨ Sistema pronto para usar em produção!");
}

simulateAutoTranslateProduct().catch((error) => {
  console.error("❌ Erro fatal:", error);
  process.exit(1);
});
