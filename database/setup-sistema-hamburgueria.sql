-- =============================================================
-- Setup completo do sistema 'hamburgueria'
-- Passo 1: cria o sistema
-- Passo 2: copia TODAS as traduções do 'website' para 'hamburgueria'
-- Passo 3: sobrescreve as chaves HOME_* e FOOTER_* com texto hamburgueria
--
-- Idempotente: pode rodar múltiplas vezes sem duplicar
-- =============================================================


-- ─── 1. Registrar o sistema ──────────────────────────────────────────────────
INSERT INTO sistemas (codigo, nome, descricao)
VALUES ('hamburgueria', 'Hamburgueria', 'Frontend da hamburgueria artesanal')
ON CONFLICT (codigo) DO NOTHING;


-- ─── 2. Copiar traduções do 'website' → 'hamburgueria' ───────────────────────
-- Copia tudo do website como base; chaves já existentes são ignoradas.
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT t.chave, t.valor,
       (SELECT id FROM sistemas WHERE codigo = 'hamburgueria'),
       t.idioma_id
FROM   traducoes t
JOIN   sistemas  s ON s.id = t.sistema_id
WHERE  s.codigo = 'website'
ON CONFLICT ON CONSTRAINT uq_traducao DO NOTHING;


-- ─── 3. Sobrescrever chaves HOME_* e FOOTER_COPYRIGHT ────────────────────────
-- Estas chaves no 'website' têm texto da Pizzaria Fellice;
-- aqui forçamos os valores hamburgueria via DO UPDATE.

INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT t.chave, t.valor,
       (SELECT id FROM sistemas WHERE codigo = 'hamburgueria'),
       (SELECT id FROM idiomas  WHERE codigo = t.idioma)
FROM (VALUES

  -- HOME_ABOUT_LABEL
  ('HOME_ABOUT_LABEL', 'Quem somos',       'pt-BR'),
  ('HOME_ABOUT_LABEL', 'Quem somos',       'pt-PT'),
  ('HOME_ABOUT_LABEL', 'About us',         'en-US'),
  ('HOME_ABOUT_LABEL', 'Chi siamo',        'it-IT'),
  ('HOME_ABOUT_LABEL', 'Quiénes somos',   'es-ES'),
  ('HOME_ABOUT_LABEL', 'من نحن',          'ar-MA'),

  -- HOME_ABOUT_TITLE
  ('HOME_ABOUT_TITLE', 'Paixão por hambúrgueres artesanais',        'pt-BR'),
  ('HOME_ABOUT_TITLE', 'Paixão por hambúrgueres artesanais',        'pt-PT'),
  ('HOME_ABOUT_TITLE', 'Passion for artisan burgers',               'en-US'),
  ('HOME_ABOUT_TITLE', 'Passione per gli hamburger artigianali',    'it-IT'),
  ('HOME_ABOUT_TITLE', 'Pasión por las hamburguesas artesanales',   'es-ES'),
  ('HOME_ABOUT_TITLE', 'شغف بالبرغر الحرفي',                       'ar-MA'),

  -- HOME_ABOUT_P1
  ('HOME_ABOUT_P1', 'Nascemos da paixão por hambúrgueres de verdade. Usamos apenas carnes frescas, pães artesanais quentinhos e ingredientes selecionados para criar experiências únicas a cada mordida.', 'pt-BR'),
  ('HOME_ABOUT_P1', 'Nascemos da paixão por hambúrgueres de verdade. Usamos apenas carnes frescas, pães artesanais quentinhos e ingredientes selecionados para criar experiências únicas a cada dentada.', 'pt-PT'),
  ('HOME_ABOUT_P1', 'We were born from a passion for real burgers. We use only fresh meats, warm artisan buns and selected ingredients to create unique experiences with every bite.', 'en-US'),
  ('HOME_ABOUT_P1', 'Siamo nati dalla passione per gli hamburger veri. Utilizziamo solo carni fresche, panini artigianali caldi e ingredienti selezionati per creare esperienze uniche ad ogni morso.', 'it-IT'),
  ('HOME_ABOUT_P1', 'Nacimos de la pasión por las hamburguesas de verdad. Usamos solo carnes frescas, panes artesanales calientes e ingredientes seleccionados para crear experiencias únicas en cada mordida.', 'es-ES'),
  ('HOME_ABOUT_P1', 'وُلدنا من الشغف بالبرغر الحقيقي. نستخدم فقط اللحوم الطازجة والخبز الحرفي الدافئ والمكونات المختارة لخلق تجارب فريدة في كل لقمة.', 'ar-MA'),

  -- HOME_ABOUT_P2
  ('HOME_ABOUT_P2', 'Além dos nossos smash burgers, temos opções para todos os gostos: duplos, vegetarianos, combos com batata frita e muito mais. Cada item do cardápio é preparado com o mesmo cuidado e dedicação.', 'pt-BR'),
  ('HOME_ABOUT_P2', 'Além dos nossos smash burgers, temos opções para todos os gostos: duplos, vegetarianos, combos com batata frita e muito mais. Cada item da ementa é preparado com o mesmo cuidado e dedicação.', 'pt-PT'),
  ('HOME_ABOUT_P2', 'Beyond our smash burgers, we have options for every taste: doubles, vegetarian, combos with fries and much more. Every menu item is prepared with the same care and dedication.', 'en-US'),
  ('HOME_ABOUT_P2', 'Oltre ai nostri smash burger, abbiamo opzioni per tutti i gusti: doppi, vegetariani, combo con patatine e molto altro. Ogni voce del menu è preparata con la stessa cura e dedizione.', 'it-IT'),
  ('HOME_ABOUT_P2', 'Además de nuestras smash burgers, tenemos opciones para todos los gustos: dobles, vegetarianas, combos con papas fritas y mucho más. Cada elemento del menú se prepara con el mismo cuidado y dedicación.', 'es-ES'),
  ('HOME_ABOUT_P2', 'إلى جانب سماش برغرنا، لدينا خيارات لجميع الأذواق: مزدوجة، نباتية، وجبات مع البطاطس المقلية وأكثر بكثير. كل عنصر في القائمة يُحضَّر بنفس العناية والتفاني.', 'ar-MA'),

  -- HOME_HERO_TITLE_1
  ('HOME_HERO_TITLE_1', 'Hambúrgueres', 'pt-BR'),
  ('HOME_HERO_TITLE_1', 'Hambúrgueres', 'pt-PT'),
  ('HOME_HERO_TITLE_1', 'Artisan',      'en-US'),
  ('HOME_HERO_TITLE_1', 'Hamburger',    'it-IT'),
  ('HOME_HERO_TITLE_1', 'Hamburguesas', 'es-ES'),
  ('HOME_HERO_TITLE_1', 'برغر',        'ar-MA'),

  -- HOME_HERO_TITLE_2
  ('HOME_HERO_TITLE_2', 'Artesanais',   'pt-BR'),
  ('HOME_HERO_TITLE_2', 'Artesanais',   'pt-PT'),
  ('HOME_HERO_TITLE_2', 'Burgers',      'en-US'),
  ('HOME_HERO_TITLE_2', 'Artigianali',  'it-IT'),
  ('HOME_HERO_TITLE_2', 'Artesanales',  'es-ES'),
  ('HOME_HERO_TITLE_2', 'حرفي',        'ar-MA'),

  -- HOME_HERO_DESC
  ('HOME_HERO_DESC', 'Carne fresca, pão brioche quentinho e combinações que vão te surpreender. Do smash ao duplo, cada mordida é única.', 'pt-BR'),
  ('HOME_HERO_DESC', 'Carne fresca, pão brioche quentinho e combinações que vão surpreender-te. Do smash ao duplo, cada dentada é única.', 'pt-PT'),
  ('HOME_HERO_DESC', 'Fresh meat, warm brioche bun and combinations that will surprise you. From smash to double, every bite is unique.', 'en-US'),
  ('HOME_HERO_DESC', 'Carne fresca, panino brioche caldo e combinazioni che ti sorprenderanno. Dallo smash al doppio, ogni morso è unico.', 'it-IT'),
  ('HOME_HERO_DESC', 'Carne fresca, pan brioche caliente y combinaciones que te sorprenderán. Del smash al doble, cada mordida es única.', 'es-ES'),
  ('HOME_HERO_DESC', 'لحم طازج وخبز بريوش دافئ ومجموعات ستفاجئك. من السماش إلى المزدوج، كل لقمة فريدة.', 'ar-MA'),

  -- HOME_BTN_ORDER
  ('HOME_BTN_ORDER', 'Fazer Pedido Agora', 'pt-BR'),
  ('HOME_BTN_ORDER', 'Fazer Pedido Agora', 'pt-PT'),
  ('HOME_BTN_ORDER', 'Order Now',          'en-US'),
  ('HOME_BTN_ORDER', 'Ordina Ora',         'it-IT'),
  ('HOME_BTN_ORDER', 'Pedir Ahora',        'es-ES'),
  ('HOME_BTN_ORDER', 'اطلب الآن',         'ar-MA'),

  -- HOME_BTN_MENU
  ('HOME_BTN_MENU', 'Ver Cardápio Completo', 'pt-BR'),
  ('HOME_BTN_MENU', 'Ver Ementa Completa',   'pt-PT'),
  ('HOME_BTN_MENU', 'View Full Menu',        'en-US'),
  ('HOME_BTN_MENU', 'Vedi il Menu Completo', 'it-IT'),
  ('HOME_BTN_MENU', 'Ver Menú Completo',     'es-ES'),
  ('HOME_BTN_MENU', 'عرض القائمة الكاملة',  'ar-MA'),

  -- HOME_FEAT_1
  ('HOME_FEAT_1_TITLE', 'Smash Burger',  'pt-BR'),
  ('HOME_FEAT_1_TITLE', 'Smash Burger',  'pt-PT'),
  ('HOME_FEAT_1_TITLE', 'Smash Burger',  'en-US'),
  ('HOME_FEAT_1_TITLE', 'Smash Burger',  'it-IT'),
  ('HOME_FEAT_1_TITLE', 'Smash Burger',  'es-ES'),
  ('HOME_FEAT_1_TITLE', 'سماش برغر',   'ar-MA'),

  ('HOME_FEAT_1_DESC', 'Blend de carne prensado na chapa, caramelizado por fora e suculento por dentro.', 'pt-BR'),
  ('HOME_FEAT_1_DESC', 'Blend de carne prensado na chapa, caramelizado por fora e suculento por dentro.', 'pt-PT'),
  ('HOME_FEAT_1_DESC', 'Meat blend pressed on the griddle, caramelized outside and juicy inside.',        'en-US'),
  ('HOME_FEAT_1_DESC', 'Blend di carne pressato sulla piastra, caramellato fuori e succoso dentro.',       'it-IT'),
  ('HOME_FEAT_1_DESC', 'Mezcla de carne prensada en la plancha, caramelizada por fuera y jugosa por dentro.', 'es-ES'),
  ('HOME_FEAT_1_DESC', 'خليط لحم مضغوط على الصفيحة، مكرمل من الخارج وعصير من الداخل.',                  'ar-MA'),

  -- HOME_FEAT_2
  ('HOME_FEAT_2_TITLE', 'Feito na Hora',     'pt-BR'),
  ('HOME_FEAT_2_TITLE', 'Feito na Hora',     'pt-PT'),
  ('HOME_FEAT_2_TITLE', 'Made Fresh',        'en-US'),
  ('HOME_FEAT_2_TITLE', 'Fatto al Momento',  'it-IT'),
  ('HOME_FEAT_2_TITLE', 'Hecho al Momento',  'es-ES'),
  ('HOME_FEAT_2_TITLE', 'مصنوع طازجاً',    'ar-MA'),

  ('HOME_FEAT_2_DESC', 'Cada pedido é preparado na hora. Sem pré-cozidos, sem congelados.',            'pt-BR'),
  ('HOME_FEAT_2_DESC', 'Cada pedido é preparado na hora. Sem pré-cozinhados, sem congelados.',         'pt-PT'),
  ('HOME_FEAT_2_DESC', 'Every order is made to order. No pre-cooked, no frozen.',                      'en-US'),
  ('HOME_FEAT_2_DESC', 'Ogni ordine viene preparato al momento. Niente precotto, niente surgelato.',   'it-IT'),
  ('HOME_FEAT_2_DESC', 'Cada pedido se prepara al momento. Sin precocinados, sin congelados.',         'es-ES'),
  ('HOME_FEAT_2_DESC', 'كل طلب يُحضَّر في الحين. بدون طهي مسبق، بدون مجمد.',                        'ar-MA'),

  -- HOME_FEAT_3
  ('HOME_FEAT_3_TITLE', 'Delivery Rápido',   'pt-BR'),
  ('HOME_FEAT_3_TITLE', 'Entrega Rápida',    'pt-PT'),
  ('HOME_FEAT_3_TITLE', 'Fast Delivery',     'en-US'),
  ('HOME_FEAT_3_TITLE', 'Consegna Rapida',   'it-IT'),
  ('HOME_FEAT_3_TITLE', 'Entrega Rápida',    'es-ES'),
  ('HOME_FEAT_3_TITLE', 'توصيل سريع',       'ar-MA'),

  ('HOME_FEAT_3_DESC', 'Entregamos quentinho até você. Acompanhe seu pedido em tempo real.',           'pt-BR'),
  ('HOME_FEAT_3_DESC', 'Entregamos quentinho até si. Acompanhe o seu pedido em tempo real.',           'pt-PT'),
  ('HOME_FEAT_3_DESC', 'We deliver hot to your door. Track your order in real time.',                  'en-US'),
  ('HOME_FEAT_3_DESC', 'Consegniamo caldo a casa tua. Monitora il tuo ordine in tempo reale.',         'it-IT'),
  ('HOME_FEAT_3_DESC', 'Entregamos caliente hasta tu puerta. Sigue tu pedido en tiempo real.',         'es-ES'),
  ('HOME_FEAT_3_DESC', 'نوصل ساخناً إلى بابك. تابع طلبك في الوقت الفعلي.',                           'ar-MA'),

  -- FOOTER_COPYRIGHT
  ('FOOTER_COPYRIGHT', 'Hamburgueria © 2024 · Artesanal do início ao fim!',          'pt-BR'),
  ('FOOTER_COPYRIGHT', 'Hamburgueria © 2024 · Artesanal do início ao fim!',          'pt-PT'),
  ('FOOTER_COPYRIGHT', 'Hamburgueria © 2024 · Artisan from start to finish!',        'en-US'),
  ('FOOTER_COPYRIGHT', 'Hamburgueria © 2024 · Artigianale dall''inizio alla fine!',  'it-IT'),
  ('FOOTER_COPYRIGHT', 'Hamburgueria © 2024 · ¡Artesanal de principio a fin!',       'es-ES'),
  ('FOOTER_COPYRIGHT', 'Hamburgueria © 2024 · حرفي من البداية إلى النهاية!',         'ar-MA')

) AS t(chave, valor, idioma)
ON CONFLICT ON CONSTRAINT uq_traducao DO UPDATE SET valor = EXCLUDED.valor, atualizado_em = NOW();
