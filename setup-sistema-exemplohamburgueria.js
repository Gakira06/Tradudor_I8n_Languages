/**
 * Cria o sistema 'exemplohamburgueria' no servidor i18n:
 *   1. Copia TODAS as chaves do sistema 'website' para 'exemplohamburgueria'
 *   2. Sobrescreve as chaves que tinham texto da Pizzaria Fellice
 *
 * Uso: node setup-sistema-exemplohamburgueria.js
 */

const BASE_URL = "https://tradudor-i8n-languages.onrender.com";
const SISTEMA_ORIGEM = "website";
const SISTEMA_DESTINO = "exemplohamburgueria";
const LOCALES = ["pt-BR", "en-US", "it-IT", "pt-PT", "es-ES", "ar-MA"];

// Chaves específicas da hamburgueria que sobrescrevem o texto da pizzaria
const OVERRIDES = [
  // ADMIN_PRODUCTS_SUBTITLE
  {
    chave: "ADMIN_PRODUCTS_SUBTITLE",
    idioma: "pt-BR",
    valor: "Gerencie o cardápio da Hamburgueria",
  },
  {
    chave: "ADMIN_PRODUCTS_SUBTITLE",
    idioma: "en-US",
    valor: "Manage the Hamburgueria menu",
  },
  {
    chave: "ADMIN_PRODUCTS_SUBTITLE",
    idioma: "it-IT",
    valor: "Gestisci il menu dell'Hamburgueria",
  },
  {
    chave: "ADMIN_PRODUCTS_SUBTITLE",
    idioma: "pt-PT",
    valor: "Gerir a ementa da Hamburgueria",
  },
  {
    chave: "ADMIN_PRODUCTS_SUBTITLE",
    idioma: "es-ES",
    valor: "Gestionar el menú de la Hamburguesería",
  },
  {
    chave: "ADMIN_PRODUCTS_SUBTITLE",
    idioma: "ar-MA",
    valor: "إدارة قائمة المطعم",
  },

  // APP_BRAND_NAME
  { chave: "APP_BRAND_NAME", idioma: "pt-BR", valor: "Hamburgueria" },
  { chave: "APP_BRAND_NAME", idioma: "en-US", valor: "Hamburgueria" },
  { chave: "APP_BRAND_NAME", idioma: "it-IT", valor: "Hamburgueria" },
  { chave: "APP_BRAND_NAME", idioma: "pt-PT", valor: "Hamburgueria" },
  { chave: "APP_BRAND_NAME", idioma: "es-ES", valor: "Hamburguería" },
  { chave: "APP_BRAND_NAME", idioma: "ar-MA", valor: "مطعم البرغر" },

  // HOME_ABOUT_P1
  {
    chave: "HOME_ABOUT_P1",
    idioma: "pt-BR",
    valor:
      "Nascemos da paixão por hambúrgueres de verdade. Usamos apenas carnes frescas, pães artesanais quentinhos e ingredientes selecionados para criar experiências únicas a cada mordida.",
  },
  {
    chave: "HOME_ABOUT_P1",
    idioma: "en-US",
    valor:
      "We were born from a passion for real burgers. We use only fresh meats, warm artisan buns and selected ingredients to create unique experiences with every bite.",
  },
  {
    chave: "HOME_ABOUT_P1",
    idioma: "it-IT",
    valor:
      "Siamo nati dalla passione per gli hamburger veri. Utilizziamo solo carni fresche, panini artigianali caldi e ingredienti selezionati per creare esperienze uniche ad ogni morso.",
  },
  {
    chave: "HOME_ABOUT_P1",
    idioma: "pt-PT",
    valor:
      "Nascemos da paixão por hambúrgueres de verdade. Usamos apenas carnes frescas, pães artesanais quentinhos e ingredientes selecionados para criar experiências únicas a cada dentada.",
  },
  {
    chave: "HOME_ABOUT_P1",
    idioma: "es-ES",
    valor:
      "Nacimos de la pasión por las hamburguesas de verdad. Usamos solo carnes frescas, panes artesanales calientes e ingredientes seleccionados para crear experiencias únicas en cada mordida.",
  },
  {
    chave: "HOME_ABOUT_P1",
    idioma: "ar-MA",
    valor:
      "وُلدنا من الشغف بالبرغر الحقيقي. نستخدم فقط اللحوم الطازجة والخبز الحرفي الدافئ والمكونات المختارة لخلق تجارب فريدة في كل لقمة.",
  },

  // HOME_ABOUT_P3
  {
    chave: "HOME_ABOUT_P3",
    idioma: "pt-BR",
    valor:
      "Descubra por que somos a escolha certa para quem busca um hambúrguer de verdade — artesanal, saboroso e feito com cuidado. Visite-nos ou faça seu pedido online.",
  },
  {
    chave: "HOME_ABOUT_P3",
    idioma: "en-US",
    valor:
      "Discover why we are the right choice for those who want a real burger — artisanal, flavorful, and made with care. Visit us or order online.",
  },
  {
    chave: "HOME_ABOUT_P3",
    idioma: "it-IT",
    valor:
      "Scopri perché siamo la scelta giusta per chi cerca un vero hamburger artigianale, saporito e fatto con cura. Vieni a trovarci o ordina online.",
  },
  {
    chave: "HOME_ABOUT_P3",
    idioma: "pt-PT",
    valor:
      "Descubra por que somos a escolha certa para quem procura um hambúrguer a sério — artesanal, saboroso e feito com cuidado. Visite-nos ou faça o seu pedido online.",
  },
  {
    chave: "HOME_ABOUT_P3",
    idioma: "es-ES",
    valor:
      "Descubre por qué somos la elección correcta para quienes buscan una hamburguesa de verdad — artesanal, sabrosa y hecha con cuidado. Visítanos u ordena en línea.",
  },
  {
    chave: "HOME_ABOUT_P3",
    idioma: "ar-MA",
    valor:
      "اكتشف لماذا نحن الخيار الصحيح لمن يبحث عن برغر حقيقي — حرفي، لذيذ ومصنوع بعناية. زرنا أو اطلب عبر الإنترنت.",
  },

  // ADMIN_PANEL_SUBTITLE
  {
    chave: "ADMIN_PANEL_SUBTITLE",
    idioma: "pt-BR",
    valor: "Visão operacional para equipe da Hamburgueria.",
  },
  {
    chave: "ADMIN_PANEL_SUBTITLE",
    idioma: "en-US",
    valor: "Operational overview for the Hamburgueria team.",
  },
  {
    chave: "ADMIN_PANEL_SUBTITLE",
    idioma: "it-IT",
    valor: "Panoramica operativa per il team dell'Hamburgueria.",
  },
  {
    chave: "ADMIN_PANEL_SUBTITLE",
    idioma: "pt-PT",
    valor: "Visão operacional para equipa da Hamburgueria.",
  },
  {
    chave: "ADMIN_PANEL_SUBTITLE",
    idioma: "es-ES",
    valor: "Visión operativa para el equipo de la Hamburguesería.",
  },
  {
    chave: "ADMIN_PANEL_SUBTITLE",
    idioma: "ar-MA",
    valor: "نظرة تشغيلية لفريق المطعم.",
  },
];

async function upsert({ chave, valor, idioma }) {
  const res = await fetch(`${BASE_URL}/traducoes`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ chave, valor, sistema: SISTEMA_DESTINO, idioma }),
  });
  const json = await res.json().catch(() => ({}));
  if (!res.ok) {
    console.error(`  ❌ [${idioma}] ${chave}: ${JSON.stringify(json)}`);
    return false;
  }
  return true;
}

async function fetchLocale(locale) {
  const res = await fetch(`${BASE_URL}/traducoes/${SISTEMA_ORIGEM}/${locale}`);
  const json = await res.json();
  return json?.traducoes ?? {};
}

(async () => {
  console.log(`\n═══ Setup sistema '${SISTEMA_DESTINO}' ═══\n`);

  // ── Passo 1: copiar todas as chaves do website ──────────────────────────────
  let totalCopied = 0;
  let totalFailed = 0;

  for (const locale of LOCALES) {
    process.stdout.write(`Buscando ${SISTEMA_ORIGEM}/${locale}... `);
    const translations = await fetchLocale(locale);
    const entries = Object.entries(translations);
    console.log(`${entries.length} chaves`);

    for (const [chave, valor] of entries) {
      const ok = await upsert({ chave, valor, idioma: locale });
      if (ok) totalCopied++;
      else totalFailed++;
    }
    console.log(`  ✓ ${locale} copiado\n`);
  }

  console.log(`\nCópia concluída: ${totalCopied} ✅  ${totalFailed} ❌\n`);

  // ── Passo 2: aplicar overrides hamburgueria ─────────────────────────────────
  console.log(`Aplicando ${OVERRIDES.length} overrides hamburgueria...\n`);
  for (const item of OVERRIDES) {
    const ok = await upsert(item);
    console.log(`${ok ? "✅" : "❌"} [${item.idioma}] ${item.chave}`);
  }

  console.log("\n═══ Concluído! ═══\n");
})();
