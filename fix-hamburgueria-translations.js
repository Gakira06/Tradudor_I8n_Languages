/**
 * Atualiza as chaves que ainda referenciam "Pizzaria Fellice"
 * para o contexto da Hamburgueria.
 *
 * Uso: node fix-hamburgueria-translations.js
 */

const BASE_URL = "https://tradudor-i8n-languages.onrender.com";
const SISTEMA = "website";

const updates = [
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
      "Somos uma hamburgueria artesanal apaixonada por criar experiências gastronômicas únicas. Usamos apenas ingredientes frescos e selecionados, combinando receitas exclusivas para montar hambúrgueres que encantam a cada mordida. Seja no conforto do nosso salão ou através do delivery, garantimos qualidade e sabor em cada pedido.",
  },
  {
    chave: "HOME_ABOUT_P1",
    idioma: "en-US",
    valor:
      "We are an artisanal burger restaurant passionate about creating unique gastronomic experiences. We use only fresh, handpicked ingredients combined with exclusive recipes to craft burgers that delight with every bite. Whether in our cozy dining room or through delivery, we guarantee quality and flavor in every order.",
  },
  {
    chave: "HOME_ABOUT_P1",
    idioma: "it-IT",
    valor:
      "Siamo un hamburger artigianale appassionato di creare esperienze gastronomiche uniche. Utilizziamo solo ingredienti freschi e selezionati, combinando ricette esclusive per creare hamburger che incantano ad ogni morso. Sia nel comfort della nostra sala o tramite la consegna, garantiamo qualità e sapore in ogni ordine.",
  },
  {
    chave: "HOME_ABOUT_P1",
    idioma: "pt-PT",
    valor:
      "Somos uma hamburgueria artesanal apaixonada por criar experiências gastronómicas únicas. Utilizamos apenas ingredientes frescos e seleccionados, combinando receitas exclusivas para criar hambúrgueres que encantam a cada dentada. Seja no conforto da nossa sala ou através do serviço de entrega, garantimos qualidade e sabor em cada pedido.",
  },
  {
    chave: "HOME_ABOUT_P1",
    idioma: "es-ES",
    valor:
      "Somos una hamburguesería artesanal apasionada por crear experiencias gastronómicas únicas. Usamos solo ingredientes frescos y seleccionados, combinando recetas exclusivas para preparar hamburguesas que deleitan con cada bocado. Ya sea en nuestro acogedor salón o mediante delivery, garantizamos calidad y sabor en cada pedido.",
  },
  {
    chave: "HOME_ABOUT_P1",
    idioma: "ar-MA",
    valor:
      "نحن مطعم برغر حرفي شغوف بخلق تجارب طعام فريدة. نستخدم فقط المكونات الطازجة والمختارة بعناية لنصنع برغر يُبهج في كل قضمة. سواء في قاعة طعامنا أو عبر خدمة التوصيل، نضمن الجودة والنكهة في كل طلب.",
  },

  // HOME_ABOUT_P3
  {
    chave: "HOME_ABOUT_P3",
    idioma: "pt-BR",
    valor:
      "Descubra por que somos a escolha certa para quem busca um hambúrguer de verdade — artesanal, saboroso e feito com cuidado. Visite-nos ou faça seu pedido online e saboreie o melhor da nossa cozinha.",
  },
  {
    chave: "HOME_ABOUT_P3",
    idioma: "en-US",
    valor:
      "Discover why we are the right choice for those who want a real burger — artisanal, flavorful, and made with care. Visit us or order online and enjoy the best of our kitchen.",
  },
  {
    chave: "HOME_ABOUT_P3",
    idioma: "it-IT",
    valor:
      "Scopri perché siamo la scelta giusta per chi cerca un vero hamburger artigianale, saporito e fatto con cura. Vieni a trovarci o ordina online e assapora il meglio della nostra cucina.",
  },
  {
    chave: "HOME_ABOUT_P3",
    idioma: "pt-PT",
    valor:
      "Descubra por que somos a escolha certa para quem procura um hambúrguer a sério — artesanal, saboroso e feito com cuidado. Visite-nos ou faça o seu pedido online e saboreie o melhor da nossa cozinha.",
  },
  {
    chave: "HOME_ABOUT_P3",
    idioma: "es-ES",
    valor:
      "Descubre por qué somos la elección correcta para quienes buscan una hamburguesa de verdad — artesanal, sabrosa y hecha con cuidado. Visítanos u ordena en línea y disfruta lo mejor de nuestra cocina.",
  },
  {
    chave: "HOME_ABOUT_P3",
    idioma: "ar-MA",
    valor:
      "اكتشف لماذا نحن الخيار الصحيح لمن يبحث عن برغر حقيقي — حرفي، لذيذ ومصنوع بعناية. زرنا أو اطلب عبر الإنترنت واستمتع بأفضل ما في مطبخنا.",
  },
];

async function upsert({ chave, valor, idioma }) {
  const res = await fetch(`${BASE_URL}/traducoes`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ chave, valor, sistema: SISTEMA, idioma }),
  });
  const json = await res.json().catch(() => ({}));
  if (!res.ok) {
    console.error(`❌ [${idioma}] ${chave}: ${JSON.stringify(json)}`);
  } else {
    console.log(`✅ [${idioma}] ${chave}`);
  }
}

(async () => {
  console.log(`Atualizando ${updates.length} traduções em ${BASE_URL}...\n`);
  for (const item of updates) {
    await upsert(item);
  }
  console.log("\nConcluído!");
})();
