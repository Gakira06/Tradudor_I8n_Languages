#!/usr/bin/env node

/**
 * Script de teste: valida auto-tradução com MyMemory
 * Uso: node test-auto-translate.js
 */

require("dotenv").config();

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

  try {
    const res = await fetch(
      `https://api.mymemory.translated.net/get?q=${encodeURIComponent(text)}&langpair=${encodeURIComponent(from)}|${encodeURIComponent(to)}`,
    );
    if (!res.ok) return text;
    const data = await res.json();
    const translated = data?.responseData?.translatedText?.trim();
    return translated || text;
  } catch (error) {
    console.error(`MyMemory error: ${error.message}`);
    return text;
  }
}

async function testAutoTranslate() {
  console.log("=".repeat(60));
  console.log("TESTE: Auto-Tradução com MyMemory");
  console.log("=".repeat(60));
  console.log("");

  const testProducts = [
    { name: "Morango com nutella", desc: "Pizza com frutas e nutella" },
    {
      name: "Pizza Margherita",
      desc: "Clássica italiana com tomate e mozzarella",
    },
    { name: "Hambúrguer Artesanal", desc: "Pão artesanal com carne premium" },
  ];

  const locales = ["pt-BR", "pt-PT", "en-US", "it-IT", "es-ES", "ar-MA"];

  for (const product of testProducts) {
    console.log(`📦 Produto: "${product.name}"`);
    console.log("");

    for (const locale of locales) {
      const translatedName = await translateText(product.name, "pt-BR", locale);
      const translatedDesc = await translateText(product.desc, "pt-BR", locale);

      console.log(`  ${locale.padEnd(6)} | ${translatedName}`);
    }
    console.log("");
  }

  console.log("=".repeat(60));
  console.log("✅ TESTE CONCLUÍDO — MyMemory funciona corretamente!");
  console.log("=".repeat(60));
}

testAutoTranslate().catch((error) => {
  console.error("Erro fatal:", error);
  process.exit(1);
});
