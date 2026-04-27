/**
 * Busca os produtos da API do backend e insere traduções de:
 *  - Categorias: CAT_{NOME_NORMALIZADO}
 *  - Nomes: PRODUCT_{id}_NAME
 *  - Descrições: PRODUCT_{id}_DESC
 *
 * Uso: node seed-products-translations.js
 *
 * Requer que o backend esteja online.
 */

const BACKEND_URL =
  process.env.BACKEND_URL || "https://exemplopizzariabackend.onrender.com/api";
const I18N_URL = "https://tradudor-i8n-languages.onrender.com";
const SISTEMA = "website";

// Traduções automáticas de categorias comuns (ajuste conforme suas categorias)
const CATEGORY_TRANSLATIONS = {
  Geral: {
    "pt-BR": "Geral",
    "pt-PT": "Geral",
    "en-US": "General",
    "it-IT": "Generale",
    "es-ES": "General",
    "ar-MA": "عام",
  },
  Pizzas: {
    "pt-BR": "Pizzas",
    "pt-PT": "Pizzas",
    "en-US": "Pizzas",
    "it-IT": "Pizze",
    "es-ES": "Pizzas",
    "ar-MA": "بيتزا",
  },
  Bebidas: {
    "pt-BR": "Bebidas",
    "pt-PT": "Bebidas",
    "en-US": "Drinks",
    "it-IT": "Bevande",
    "es-ES": "Bebidas",
    "ar-MA": "مشروبات",
  },
  Porções: {
    "pt-BR": "Porções",
    "pt-PT": "Porções",
    "en-US": "Sides",
    "it-IT": "Contorni",
    "es-ES": "Porciones",
    "ar-MA": "مقبلات",
  },
  Sobremesas: {
    "pt-BR": "Sobremesas",
    "pt-PT": "Sobremesas",
    "en-US": "Desserts",
    "it-IT": "Dessert",
    "es-ES": "Postres",
    "ar-MA": "حلويات",
  },
  Petiscos: {
    "pt-BR": "Petiscos",
    "pt-PT": "Petiscos",
    "en-US": "Snacks",
    "it-IT": "Stuzzichini",
    "es-ES": "Aperitivos",
    "ar-MA": "وجبات خفيفة",
  },
  Beirutes: {
    "pt-BR": "Beirutes",
    "pt-PT": "Beirutes",
    "en-US": "Sandwiches",
    "it-IT": "Panini",
    "es-ES": "Sándwiches",
    "ar-MA": "سندويشات",
  },
  Promoções: {
    "pt-BR": "Promoções",
    "pt-PT": "Promoções",
    "en-US": "Specials",
    "it-IT": "Offerte",
    "es-ES": "Promociones",
    "ar-MA": "عروض",
  },
};

function normalizeCategoryKey(cat) {
  return `CAT_${(cat ?? "GERAL")
    .toUpperCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/\s+/g, "_")
    .replace(/[^A-Z0-9_]/g, "")}`;
}

async function post(chave, valor, idioma) {
  const res = await fetch(`${I18N_URL}/traducoes`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ chave, valor, sistema: SISTEMA, idioma }),
  });
  if (!res.ok) {
    const text = await res.text();
    throw new Error(`${res.status}: ${text}`);
  }
}

async function main() {
  // 1. Buscar produtos
  console.log(`Buscando produtos em ${BACKEND_URL}/products ...`);
  const res = await fetch(`${BACKEND_URL}/products`);
  if (!res.ok) throw new Error(`Backend retornou ${res.status}`);
  const body = await res.json();
  const products = body.data ?? body;

  console.log(`Total de produtos: ${products.length}`);

  const categories = [...new Set(products.map((p) => p.category ?? "Geral"))];
  console.log(`Categorias encontradas: ${categories.join(", ")}`);

  let ok = 0;
  let errors = 0;

  // 2. Inserir traduções de categorias
  console.log("\n--- Inserindo categorias ---");
  for (const cat of categories) {
    const key = normalizeCategoryKey(cat);
    const translations = CATEGORY_TRANSLATIONS[cat];

    if (!translations) {
      // Sem tradução definida: insere o mesmo nome em todos os idiomas
      const langs = ["pt-BR", "pt-PT", "en-US", "it-IT", "es-ES", "ar-MA"];
      for (const lang of langs) {
        try {
          await post(key, cat, lang);
          ok++;
        } catch (e) {
          console.error(`ERRO ${key}[${lang}]: ${e.message}`);
          errors++;
        }
      }
    } else {
      for (const [lang, val] of Object.entries(translations)) {
        try {
          await post(key, val, lang);
          ok++;
        } catch (e) {
          console.error(`ERRO ${key}[${lang}]: ${e.message}`);
          errors++;
        }
      }
    }
    console.log(`  ✓ ${key} (${cat})`);
  }

  // 3. Inserir traduções de nomes e descrições (só pt-BR como base)
  //    Para outros idiomas, adicione traduções manualmente depois no painel
  //    ou expanda este script com um serviço de tradução automática.
  console.log("\n--- Inserindo nomes e descrições dos produtos (pt-BR) ---");
  const LANGS = ["pt-BR", "pt-PT"]; // idiomas que usam o mesmo texto

  for (const product of products) {
    if (product.isCrust) continue; // bordas não precisam de tradução de nome

    for (const lang of LANGS) {
      // Nome
      try {
        await post(`PRODUCT_${product.id}_NAME`, product.name, lang);
        ok++;
      } catch (e) {
        console.error(`ERRO PRODUCT_${product.id}_NAME[${lang}]: ${e.message}`);
        errors++;
      }

      // Descrição
      if (product.description) {
        try {
          await post(`PRODUCT_${product.id}_DESC`, product.description, lang);
          ok++;
        } catch (e) {
          console.error(
            `ERRO PRODUCT_${product.id}_DESC[${lang}]: ${e.message}`,
          );
          errors++;
        }
      }
    }

    process.stdout.write(`\r  ✓ ${product.name.slice(0, 30).padEnd(30)}`);
  }

  // Chaves extra que faltavam
  console.log("\n\n--- Inserindo chaves de interface que faltavam ---");
  const extra = [
    {
      chave: "FIRST_HALF_SELECTED_MSG",
      "pt-BR": "Primeira metade selecionada:",
      "pt-PT": "Primeira metade selecionada:",
      "en-US": "First half selected:",
      "it-IT": "Prima metà selezionata:",
      "es-ES": "Primera mitad seleccionada:",
      "ar-MA": "تم اختيار النصف الأول:",
    },
    {
      chave: "FIRST_HALF_CHOOSE_NEXT",
      "pt-BR": "Escolha a próxima pizza para completar.",
      "pt-PT": "Escolha a próxima pizza para completar.",
      "en-US": "Choose the next pizza to complete.",
      "it-IT": "Scegli la prossima pizza per completare.",
      "es-ES": "Elige la próxima pizza para completar.",
      "ar-MA": "اختر البيتزا التالية لإكمال الطلب.",
    },
  ];

  for (const entry of extra) {
    const { chave, ...langs } = entry;
    for (const [lang, val] of Object.entries(langs)) {
      try {
        await post(chave, val, lang);
        ok++;
      } catch (e) {
        console.error(`ERRO ${chave}[${lang}]: ${e.message}`);
        errors++;
      }
    }
    console.log(`  ✓ ${entry.chave}`);
  }

  console.log(`\n\nConcluído! ✓ ${ok} inseridas, ✗ ${errors} erros.`);
  console.log("\nNota: Para inglês/italiano/espanhol/árabe dos produtos,");
  console.log(
    "edite as traduções no painel admin do tradutor ou expanda este script.",
  );
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
