/**
 * Corrige as chaves HOME_* que ainda estavam com texto da Pizzaria Fellice.
 * Usa POST /traducoes que já faz UPSERT (atualiza se a chave existir).
 *
 * Uso: node fix-home-keys.js
 */

const API_URL = "https://tradudor-i8n-languages.onrender.com";
const SISTEMA = "website";

const entries = [
  // ─── HOME_ABOUT_LABEL ────────────────────────────────────────────────────
  { chave: "HOME_ABOUT_LABEL", idioma: "pt-BR", valor: "Quem somos" },
  { chave: "HOME_ABOUT_LABEL", idioma: "pt-PT", valor: "Quem somos" },
  { chave: "HOME_ABOUT_LABEL", idioma: "en-US", valor: "About us" },
  { chave: "HOME_ABOUT_LABEL", idioma: "it-IT", valor: "Chi siamo" },
  { chave: "HOME_ABOUT_LABEL", idioma: "es-ES", valor: "Quiénes somos" },
  { chave: "HOME_ABOUT_LABEL", idioma: "ar-MA", valor: "من نحن" },

  // ─── HOME_ABOUT_TITLE ────────────────────────────────────────────────────
  {
    chave: "HOME_ABOUT_TITLE",
    idioma: "pt-BR",
    valor: "Paixão por hambúrgueres artesanais",
  },
  {
    chave: "HOME_ABOUT_TITLE",
    idioma: "pt-PT",
    valor: "Paixão por hambúrgueres artesanais",
  },
  {
    chave: "HOME_ABOUT_TITLE",
    idioma: "en-US",
    valor: "Passion for artisan burgers",
  },
  {
    chave: "HOME_ABOUT_TITLE",
    idioma: "it-IT",
    valor: "Passione per gli hamburger artigianali",
  },
  {
    chave: "HOME_ABOUT_TITLE",
    idioma: "es-ES",
    valor: "Pasión por las hamburguesas artesanales",
  },
  { chave: "HOME_ABOUT_TITLE", idioma: "ar-MA", valor: "شغف بالبرغر الحرفي" },

  // ─── HOME_ABOUT_P1 ───────────────────────────────────────────────────────
  {
    chave: "HOME_ABOUT_P1",
    idioma: "pt-BR",
    valor:
      "Nascemos da paixão por hambúrgueres de verdade. Usamos apenas carnes frescas, pães artesanais quentinhos e ingredientes selecionados para criar experiências únicas a cada mordida.",
  },
  {
    chave: "HOME_ABOUT_P1",
    idioma: "pt-PT",
    valor:
      "Nascemos da paixão por hambúrgueres de verdade. Usamos apenas carnes frescas, pães artesanais quentinhos e ingredientes selecionados para criar experiências únicas a cada dentada.",
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

  // ─── HOME_ABOUT_P2 ───────────────────────────────────────────────────────
  {
    chave: "HOME_ABOUT_P2",
    idioma: "pt-BR",
    valor:
      "Além dos nossos smash burgers, temos opções para todos os gostos: duplos, vegetarianos, combos com batata frita e muito mais. Cada item do cardápio é preparado com o mesmo cuidado e dedicação.",
  },
  {
    chave: "HOME_ABOUT_P2",
    idioma: "pt-PT",
    valor:
      "Além dos nossos smash burgers, temos opções para todos os gostos: duplos, vegetarianos, combos com batata frita e muito mais. Cada item da ementa é preparado com o mesmo cuidado e dedicação.",
  },
  {
    chave: "HOME_ABOUT_P2",
    idioma: "en-US",
    valor:
      "Beyond our smash burgers, we have options for every taste: doubles, vegetarian, combos with fries and much more. Every menu item is prepared with the same care and dedication.",
  },
  {
    chave: "HOME_ABOUT_P2",
    idioma: "it-IT",
    valor:
      "Oltre ai nostri smash burger, abbiamo opzioni per tutti i gusti: doppi, vegetariani, combo con patatine e molto altro. Ogni voce del menu è preparata con la stessa cura e dedizione.",
  },
  {
    chave: "HOME_ABOUT_P2",
    idioma: "es-ES",
    valor:
      "Además de nuestras smash burgers, tenemos opciones para todos los gustos: dobles, vegetarianas, combos con papas fritas y mucho más. Cada elemento del menú se prepara con el mismo cuidado y dedicación.",
  },
  {
    chave: "HOME_ABOUT_P2",
    idioma: "ar-MA",
    valor:
      "إلى جانب سماش برغرنا، لدينا خيارات لجميع الأذواق: مزدوجة، نباتية، وجبات مع البطاطس المقلية وأكثر بكثير. كل عنصر في القائمة يُحضَّر بنفس العناية والتفاني.",
  },

  // ─── HOME_HERO_TITLE_1 ───────────────────────────────────────────────────
  { chave: "HOME_HERO_TITLE_1", idioma: "pt-BR", valor: "Hambúrgueres" },
  { chave: "HOME_HERO_TITLE_1", idioma: "pt-PT", valor: "Hambúrgueres" },
  { chave: "HOME_HERO_TITLE_1", idioma: "en-US", valor: "Artisan" },
  { chave: "HOME_HERO_TITLE_1", idioma: "it-IT", valor: "Hamburger" },
  { chave: "HOME_HERO_TITLE_1", idioma: "es-ES", valor: "Hamburguesas" },
  { chave: "HOME_HERO_TITLE_1", idioma: "ar-MA", valor: "برغر" },

  // ─── HOME_HERO_TITLE_2 ───────────────────────────────────────────────────
  { chave: "HOME_HERO_TITLE_2", idioma: "pt-BR", valor: "Artesanais" },
  { chave: "HOME_HERO_TITLE_2", idioma: "pt-PT", valor: "Artesanais" },
  { chave: "HOME_HERO_TITLE_2", idioma: "en-US", valor: "Burgers" },
  { chave: "HOME_HERO_TITLE_2", idioma: "it-IT", valor: "Artigianali" },
  { chave: "HOME_HERO_TITLE_2", idioma: "es-ES", valor: "Artesanales" },
  { chave: "HOME_HERO_TITLE_2", idioma: "ar-MA", valor: "حرفي" },

  // ─── HOME_HERO_DESC ──────────────────────────────────────────────────────
  {
    chave: "HOME_HERO_DESC",
    idioma: "pt-BR",
    valor:
      "Carne fresca, pão brioche quentinho e combinações que vão te surpreender. Do smash ao duplo, cada mordida é única.",
  },
  {
    chave: "HOME_HERO_DESC",
    idioma: "pt-PT",
    valor:
      "Carne fresca, pão brioche quentinho e combinações que vão surpreender-te. Do smash ao duplo, cada dentada é única.",
  },
  {
    chave: "HOME_HERO_DESC",
    idioma: "en-US",
    valor:
      "Fresh meat, warm brioche bun and combinations that will surprise you. From smash to double, every bite is unique.",
  },
  {
    chave: "HOME_HERO_DESC",
    idioma: "it-IT",
    valor:
      "Carne fresca, panino brioche caldo e combinazioni che ti sorprenderanno. Dallo smash al doppio, ogni morso è unico.",
  },
  {
    chave: "HOME_HERO_DESC",
    idioma: "es-ES",
    valor:
      "Carne fresca, pan brioche caliente y combinaciones que te sorprenderán. Del smash al doble, cada mordida es única.",
  },
  {
    chave: "HOME_HERO_DESC",
    idioma: "ar-MA",
    valor:
      "لحم طازج وخبز بريوش دافئ ومجموعات ستفاجئك. من السماش إلى المزدوج، كل لقمة فريدة.",
  },

  // ─── HOME_BTN_ORDER ──────────────────────────────────────────────────────
  { chave: "HOME_BTN_ORDER", idioma: "pt-BR", valor: "Fazer Pedido Agora" },
  { chave: "HOME_BTN_ORDER", idioma: "pt-PT", valor: "Fazer Pedido Agora" },
  { chave: "HOME_BTN_ORDER", idioma: "en-US", valor: "Order Now" },
  { chave: "HOME_BTN_ORDER", idioma: "it-IT", valor: "Ordina Ora" },
  { chave: "HOME_BTN_ORDER", idioma: "es-ES", valor: "Pedir Ahora" },
  { chave: "HOME_BTN_ORDER", idioma: "ar-MA", valor: "اطلب الآن" },

  // ─── HOME_BTN_MENU ───────────────────────────────────────────────────────
  { chave: "HOME_BTN_MENU", idioma: "pt-BR", valor: "Ver Cardápio Completo" },
  { chave: "HOME_BTN_MENU", idioma: "pt-PT", valor: "Ver Ementa Completa" },
  { chave: "HOME_BTN_MENU", idioma: "en-US", valor: "View Full Menu" },
  { chave: "HOME_BTN_MENU", idioma: "it-IT", valor: "Vedi il Menu Completo" },
  { chave: "HOME_BTN_MENU", idioma: "es-ES", valor: "Ver Menú Completo" },
  { chave: "HOME_BTN_MENU", idioma: "ar-MA", valor: "عرض القائمة الكاملة" },

  // ─── HOME_FEAT_1 ─────────────────────────────────────────────────────────
  { chave: "HOME_FEAT_1_TITLE", idioma: "pt-BR", valor: "Smash Burger" },
  { chave: "HOME_FEAT_1_TITLE", idioma: "pt-PT", valor: "Smash Burger" },
  { chave: "HOME_FEAT_1_TITLE", idioma: "en-US", valor: "Smash Burger" },
  { chave: "HOME_FEAT_1_TITLE", idioma: "it-IT", valor: "Smash Burger" },
  { chave: "HOME_FEAT_1_TITLE", idioma: "es-ES", valor: "Smash Burger" },
  { chave: "HOME_FEAT_1_TITLE", idioma: "ar-MA", valor: "سماش برغر" },

  {
    chave: "HOME_FEAT_1_DESC",
    idioma: "pt-BR",
    valor:
      "Blend de carne prensado na chapa, caramelizado por fora e suculento por dentro.",
  },
  {
    chave: "HOME_FEAT_1_DESC",
    idioma: "pt-PT",
    valor:
      "Blend de carne prensado na chapa, caramelizado por fora e suculento por dentro.",
  },
  {
    chave: "HOME_FEAT_1_DESC",
    idioma: "en-US",
    valor:
      "Meat blend pressed on the griddle, caramelized outside and juicy inside.",
  },
  {
    chave: "HOME_FEAT_1_DESC",
    idioma: "it-IT",
    valor:
      "Blend di carne pressato sulla piastra, caramellato fuori e succoso dentro.",
  },
  {
    chave: "HOME_FEAT_1_DESC",
    idioma: "es-ES",
    valor:
      "Mezcla de carne prensada en la plancha, caramelizada por fuera y jugosa por dentro.",
  },
  {
    chave: "HOME_FEAT_1_DESC",
    idioma: "ar-MA",
    valor: "خليط لحم مضغوط على الصفيحة، مكرمل من الخارج وعصير من الداخل.",
  },

  // ─── HOME_FEAT_2 ─────────────────────────────────────────────────────────
  { chave: "HOME_FEAT_2_TITLE", idioma: "pt-BR", valor: "Feito na Hora" },
  { chave: "HOME_FEAT_2_TITLE", idioma: "pt-PT", valor: "Feito na Hora" },
  { chave: "HOME_FEAT_2_TITLE", idioma: "en-US", valor: "Made Fresh" },
  { chave: "HOME_FEAT_2_TITLE", idioma: "it-IT", valor: "Fatto al Momento" },
  { chave: "HOME_FEAT_2_TITLE", idioma: "es-ES", valor: "Hecho al Momento" },
  { chave: "HOME_FEAT_2_TITLE", idioma: "ar-MA", valor: "مصنوع طازجاً" },

  {
    chave: "HOME_FEAT_2_DESC",
    idioma: "pt-BR",
    valor: "Cada pedido é preparado na hora. Sem pré-cozidos, sem congelados.",
  },
  {
    chave: "HOME_FEAT_2_DESC",
    idioma: "pt-PT",
    valor:
      "Cada pedido é preparado na hora. Sem pré-cozinhados, sem congelados.",
  },
  {
    chave: "HOME_FEAT_2_DESC",
    idioma: "en-US",
    valor: "Every order is made to order. No pre-cooked, no frozen.",
  },
  {
    chave: "HOME_FEAT_2_DESC",
    idioma: "it-IT",
    valor:
      "Ogni ordine viene preparato al momento. Niente precotto, niente surgelato.",
  },
  {
    chave: "HOME_FEAT_2_DESC",
    idioma: "es-ES",
    valor:
      "Cada pedido se prepara al momento. Sin precocinados, sin congelados.",
  },
  {
    chave: "HOME_FEAT_2_DESC",
    idioma: "ar-MA",
    valor: "كل طلب يُحضَّر في الحين. بدون طهي مسبق، بدون مجمد.",
  },

  // ─── HOME_FEAT_3 ─────────────────────────────────────────────────────────
  { chave: "HOME_FEAT_3_TITLE", idioma: "pt-BR", valor: "Delivery Rápido" },
  { chave: "HOME_FEAT_3_TITLE", idioma: "pt-PT", valor: "Entrega Rápida" },
  { chave: "HOME_FEAT_3_TITLE", idioma: "en-US", valor: "Fast Delivery" },
  { chave: "HOME_FEAT_3_TITLE", idioma: "it-IT", valor: "Consegna Rapida" },
  { chave: "HOME_FEAT_3_TITLE", idioma: "es-ES", valor: "Entrega Rápida" },
  { chave: "HOME_FEAT_3_TITLE", idioma: "ar-MA", valor: "توصيل سريع" },

  {
    chave: "HOME_FEAT_3_DESC",
    idioma: "pt-BR",
    valor: "Entregamos quentinho até você. Acompanhe seu pedido em tempo real.",
  },
  {
    chave: "HOME_FEAT_3_DESC",
    idioma: "pt-PT",
    valor: "Entregamos quentinho até si. Acompanhe o seu pedido em tempo real.",
  },
  {
    chave: "HOME_FEAT_3_DESC",
    idioma: "en-US",
    valor: "We deliver hot to your door. Track your order in real time.",
  },
  {
    chave: "HOME_FEAT_3_DESC",
    idioma: "it-IT",
    valor:
      "Consegniamo caldo a casa tua. Monitora il tuo ordine in tempo reale.",
  },
  {
    chave: "HOME_FEAT_3_DESC",
    idioma: "es-ES",
    valor:
      "Entregamos caliente hasta tu puerta. Sigue tu pedido en tiempo real.",
  },
  {
    chave: "HOME_FEAT_3_DESC",
    idioma: "ar-MA",
    valor: "نوصل ساخناً إلى بابك. تابع طلبك في الوقت الفعلي.",
  },

  // ─── FOOTER_COPYRIGHT ────────────────────────────────────────────────────
  {
    chave: "FOOTER_COPYRIGHT",
    idioma: "pt-BR",
    valor: "Hamburgueria © 2024 · Artesanal do início ao fim!",
  },
  {
    chave: "FOOTER_COPYRIGHT",
    idioma: "pt-PT",
    valor: "Hamburgueria © 2024 · Artesanal do início ao fim!",
  },
  {
    chave: "FOOTER_COPYRIGHT",
    idioma: "en-US",
    valor: "Hamburgueria © 2024 · Artisan from start to finish!",
  },
  {
    chave: "FOOTER_COPYRIGHT",
    idioma: "it-IT",
    valor: "Hamburgueria © 2024 · Artigianale dall'inizio alla fine!",
  },
  {
    chave: "FOOTER_COPYRIGHT",
    idioma: "es-ES",
    valor: "Hamburgueria © 2024 · ¡Artesanal de principio a fin!",
  },
  {
    chave: "FOOTER_COPYRIGHT",
    idioma: "ar-MA",
    valor: "Hamburgueria © 2024 · حرفي من البداية إلى النهاية!",
  },
];

async function main() {
  console.log(
    `Total: ${entries.length} entradas (${entries.length / 6} chaves × 6 idiomas)\n`,
  );

  let ok = 0;
  let errors = 0;

  for (const { chave, idioma, valor } of entries) {
    try {
      const res = await fetch(`${API_URL}/traducoes`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ chave, valor, sistema: SISTEMA, idioma }),
      });

      if (!res.ok) {
        const text = await res.text();
        console.error(`ERRO [${chave}][${idioma}]: ${res.status} ${text}`);
        errors++;
      } else {
        ok++;
        process.stdout.write(`\r✓ ${ok}/${entries.length} atualizadas...`);
      }
    } catch (err) {
      console.error(`\nFALHA [${chave}][${idioma}]: ${err.message}`);
      errors++;
    }
  }

  console.log(
    `\n\nConcluído! ✓ ${ok} inseridas/atualizadas, ✗ ${errors} erros.`,
  );
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
