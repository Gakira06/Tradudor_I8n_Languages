-- =============================================================
-- Seed: Admin Panel keys para sistema 'exemplohamburgueria'
-- Gerado para frontendHamburgueria/src/pages/AdminPanelPage.jsx
-- =============================================================

-- ADMIN_PANEL_TITLE_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_TITLE_EXEMPLOHAMBURGUERIA', 'Painel Admin', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_TITLE_EXEMPLOHAMBURGUERIA', 'Admin Panel', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_TITLE_EXEMPLOHAMBURGUERIA', 'Pannello Admin', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_TITLE_EXEMPLOHAMBURGUERIA', 'Painel Admin', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_TITLE_EXEMPLOHAMBURGUERIA', 'Panel de Administración', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_TITLE_EXEMPLOHAMBURGUERIA', 'لوحة الإدارة', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_SUBTITLE_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_SUBTITLE_EXEMPLOHAMBURGUERIA', 'Visão operacional para equipe da Hamburgueria.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_SUBTITLE_EXEMPLOHAMBURGUERIA', 'Operational overview for the Hamburgueria team.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_SUBTITLE_EXEMPLOHAMBURGUERIA', 'Panoramica operativa per il team dell''Hamburgueria.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_SUBTITLE_EXEMPLOHAMBURGUERIA', 'Visão operacional para equipa da Hamburgueria.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_SUBTITLE_EXEMPLOHAMBURGUERIA', 'Visión operativa para el equipo de la Hamburguesería.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_SUBTITLE_EXEMPLOHAMBURGUERIA', 'نظرة تشغيلية لفريق المطعم.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_BACK_HOME_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_BACK_HOME_EXEMPLOHAMBURGUERIA', '← Início', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_BACK_HOME_EXEMPLOHAMBURGUERIA', '← Home', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_BACK_HOME_EXEMPLOHAMBURGUERIA', '← Home', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_BACK_HOME_EXEMPLOHAMBURGUERIA', '← Início', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_BACK_HOME_EXEMPLOHAMBURGUERIA', '← Inicio', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_BACK_HOME_EXEMPLOHAMBURGUERIA', '← الرئيسية', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_OVERDUE_COUNT_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_OVERDUE_COUNT_EXEMPLOHAMBURGUERIA', '{{count}} pedidos em atraso', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_OVERDUE_COUNT_EXEMPLOHAMBURGUERIA', '{{count}} overdue orders', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_OVERDUE_COUNT_EXEMPLOHAMBURGUERIA', '{{count}} ordini in ritardo', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_OVERDUE_COUNT_EXEMPLOHAMBURGUERIA', '{{count}} pedidos em atraso', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_OVERDUE_COUNT_EXEMPLOHAMBURGUERIA', '{{count}} pedidos atrasados', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_OVERDUE_COUNT_EXEMPLOHAMBURGUERIA', '{{count}} طلبات متأخرة', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_NO_DELAYS_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_NO_DELAYS_EXEMPLOHAMBURGUERIA', 'Sem atrasos', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_NO_DELAYS_EXEMPLOHAMBURGUERIA', 'No delays', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_NO_DELAYS_EXEMPLOHAMBURGUERIA', 'Nessun ritardo', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_NO_DELAYS_EXEMPLOHAMBURGUERIA', 'Sem atrasos', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_NO_DELAYS_EXEMPLOHAMBURGUERIA', 'Sin retrasos', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_NO_DELAYS_EXEMPLOHAMBURGUERIA', 'لا تأخيرات', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_ALERTS_COUNT_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_ALERTS_COUNT_EXEMPLOHAMBURGUERIA', '{{count}} alertas', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_ALERTS_COUNT_EXEMPLOHAMBURGUERIA', '{{count}} alerts', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_ALERTS_COUNT_EXEMPLOHAMBURGUERIA', '{{count}} avvisi', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_ALERTS_COUNT_EXEMPLOHAMBURGUERIA', '{{count}} alertas', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_ALERTS_COUNT_EXEMPLOHAMBURGUERIA', '{{count}} alertas', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_ALERTS_COUNT_EXEMPLOHAMBURGUERIA', '{{count}} تنبيهات', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_DESKTOP_ON_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_ON_EXEMPLOHAMBURGUERIA', 'Notificações ativas', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_ON_EXEMPLOHAMBURGUERIA', 'Notifications active', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_ON_EXEMPLOHAMBURGUERIA', 'Notifiche attive', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_ON_EXEMPLOHAMBURGUERIA', 'Notificações ativas', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_ON_EXEMPLOHAMBURGUERIA', 'Notificaciones activas', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_ON_EXEMPLOHAMBURGUERIA', 'الإشعارات نشطة', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_DESKTOP_OFF_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_OFF_EXEMPLOHAMBURGUERIA', 'Notificações inativas', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_OFF_EXEMPLOHAMBURGUERIA', 'Notifications off', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_OFF_EXEMPLOHAMBURGUERIA', 'Notifiche disattivate', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_OFF_EXEMPLOHAMBURGUERIA', 'Notificações inativas', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_OFF_EXEMPLOHAMBURGUERIA', 'Notificaciones inactivas', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_OFF_EXEMPLOHAMBURGUERIA', 'الإشعارات غير نشطة', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_CARD_PRODUCTS_TITLE_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_PRODUCTS_TITLE_EXEMPLOHAMBURGUERIA', 'Gerenciar Produtos', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_PRODUCTS_TITLE_EXEMPLOHAMBURGUERIA', 'Manage Products', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_PRODUCTS_TITLE_EXEMPLOHAMBURGUERIA', 'Gestisci Prodotti', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_PRODUCTS_TITLE_EXEMPLOHAMBURGUERIA', 'Gerir Produtos', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_PRODUCTS_TITLE_EXEMPLOHAMBURGUERIA', 'Gestionar Productos', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_PRODUCTS_TITLE_EXEMPLOHAMBURGUERIA', 'إدارة المنتجات', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_CARD_PRODUCTS_DESC_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_PRODUCTS_DESC_EXEMPLOHAMBURGUERIA', 'Cadastrar, editar e desativar itens do cardápio', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_PRODUCTS_DESC_EXEMPLOHAMBURGUERIA', 'Add, edit and disable menu items', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_PRODUCTS_DESC_EXEMPLOHAMBURGUERIA', 'Aggiungere, modificare e disattivare elementi del menù', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_PRODUCTS_DESC_EXEMPLOHAMBURGUERIA', 'Adicionar, editar e desativar itens da ementa', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_PRODUCTS_DESC_EXEMPLOHAMBURGUERIA', 'Crear, editar y desactivar elementos del menú', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_PRODUCTS_DESC_EXEMPLOHAMBURGUERIA', 'إضافة وتعديل وتعطيل عناصر القائمة', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_CARD_SALES_TITLE_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_SALES_TITLE_EXEMPLOHAMBURGUERIA', 'Análise de Vendas', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_SALES_TITLE_EXEMPLOHAMBURGUERIA', 'Sales Analysis', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_SALES_TITLE_EXEMPLOHAMBURGUERIA', 'Analisi Vendite', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_SALES_TITLE_EXEMPLOHAMBURGUERIA', 'Análise de Vendas', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_SALES_TITLE_EXEMPLOHAMBURGUERIA', 'Análisis de Ventas', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_SALES_TITLE_EXEMPLOHAMBURGUERIA', 'تحليل المبيعات', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_CARD_SALES_DESC_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_SALES_DESC_EXEMPLOHAMBURGUERIA', 'Receita, ticket médio e itens mais vendidos', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_SALES_DESC_EXEMPLOHAMBURGUERIA', 'Revenue, average ticket and best-selling items', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_SALES_DESC_EXEMPLOHAMBURGUERIA', 'Ricavi, scontrino medio e articoli più venduti', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_SALES_DESC_EXEMPLOHAMBURGUERIA', 'Receita, ticket médio e itens mais vendidos', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_SALES_DESC_EXEMPLOHAMBURGUERIA', 'Ingresos, ticket medio y artículos más vendidos', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_SALES_DESC_EXEMPLOHAMBURGUERIA', 'الإيرادات، متوسط الفاتورة والعناصر الأكثر مبيعاً', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_CARD_KITCHEN_TITLE_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_KITCHEN_TITLE_EXEMPLOHAMBURGUERIA', 'Painel da Cozinha', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_KITCHEN_TITLE_EXEMPLOHAMBURGUERIA', 'Kitchen Panel', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_KITCHEN_TITLE_EXEMPLOHAMBURGUERIA', 'Pannello Cucina', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_KITCHEN_TITLE_EXEMPLOHAMBURGUERIA', 'Painel da Cozinha', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_KITCHEN_TITLE_EXEMPLOHAMBURGUERIA', 'Panel de Cocina', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_KITCHEN_TITLE_EXEMPLOHAMBURGUERIA', 'لوحة المطبخ', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_CARD_KITCHEN_DESC_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_KITCHEN_DESC_EXEMPLOHAMBURGUERIA', 'Ver pedidos ativos e avançar status', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_KITCHEN_DESC_EXEMPLOHAMBURGUERIA', 'View active orders and advance status', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_KITCHEN_DESC_EXEMPLOHAMBURGUERIA', 'Visualizza ordini attivi e avanza stato', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_KITCHEN_DESC_EXEMPLOHAMBURGUERIA', 'Ver pedidos ativos e avançar estado', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_KITCHEN_DESC_EXEMPLOHAMBURGUERIA', 'Ver pedidos activos y avanzar estado', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_KITCHEN_DESC_EXEMPLOHAMBURGUERIA', 'عرض الطلبات النشطة وتقديم الحالة', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_CARD_HISTORY_TITLE_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_HISTORY_TITLE_EXEMPLOHAMBURGUERIA', 'Histórico de Pedidos', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_HISTORY_TITLE_EXEMPLOHAMBURGUERIA', 'Order History', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_HISTORY_TITLE_EXEMPLOHAMBURGUERIA', 'Storico Ordini', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_HISTORY_TITLE_EXEMPLOHAMBURGUERIA', 'Histórico de Pedidos', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_HISTORY_TITLE_EXEMPLOHAMBURGUERIA', 'Historial de Pedidos', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_HISTORY_TITLE_EXEMPLOHAMBURGUERIA', 'سجل الطلبات', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_CARD_HISTORY_DESC_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_HISTORY_DESC_EXEMPLOHAMBURGUERIA', 'Todos os pedidos, cancelamentos e estornos', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_HISTORY_DESC_EXEMPLOHAMBURGUERIA', 'All orders, cancellations and refunds', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_HISTORY_DESC_EXEMPLOHAMBURGUERIA', 'Tutti gli ordini, cancellazioni e rimborsi', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_HISTORY_DESC_EXEMPLOHAMBURGUERIA', 'Todos os pedidos, cancelamentos e estornos', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_HISTORY_DESC_EXEMPLOHAMBURGUERIA', 'Todos los pedidos, cancelaciones y devoluciones', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_HISTORY_DESC_EXEMPLOHAMBURGUERIA', 'جميع الطلبات والإلغاءات والمبالغ المستردة', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_CARD_USERS_TITLE_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_USERS_TITLE_EXEMPLOHAMBURGUERIA', 'Criar Usuário', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_USERS_TITLE_EXEMPLOHAMBURGUERIA', 'Create User', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_USERS_TITLE_EXEMPLOHAMBURGUERIA', 'Crea Utente', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_USERS_TITLE_EXEMPLOHAMBURGUERIA', 'Criar Utilizador', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_USERS_TITLE_EXEMPLOHAMBURGUERIA', 'Crear Usuario', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_USERS_TITLE_EXEMPLOHAMBURGUERIA', 'إنشاء مستخدم', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_CARD_USERS_DESC_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_USERS_DESC_EXEMPLOHAMBURGUERIA', 'Cadastrar motoboy, cozinha, funcionário ou admin', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_USERS_DESC_EXEMPLOHAMBURGUERIA', 'Register delivery, kitchen, staff or admin', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_USERS_DESC_EXEMPLOHAMBURGUERIA', 'Registrare fattorino, cucina, dipendente o admin', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_USERS_DESC_EXEMPLOHAMBURGUERIA', 'Registar estafeta, cozinha, funcionário ou admin', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_USERS_DESC_EXEMPLOHAMBURGUERIA', 'Registrar repartidor, cocina, empleado o admin', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_USERS_DESC_EXEMPLOHAMBURGUERIA', 'تسجيل مندوب توصيل، مطبخ، موظف أو مسؤول', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_CARD_TABLES_TITLE_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_TABLES_TITLE_EXEMPLOHAMBURGUERIA', 'Mesas', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_TABLES_TITLE_EXEMPLOHAMBURGUERIA', 'Tables', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_TABLES_TITLE_EXEMPLOHAMBURGUERIA', 'Tavoli', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_TABLES_TITLE_EXEMPLOHAMBURGUERIA', 'Mesas', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_TABLES_TITLE_EXEMPLOHAMBURGUERIA', 'Mesas', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_TABLES_TITLE_EXEMPLOHAMBURGUERIA', 'الطاولات', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_CARD_TABLES_DESC_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_TABLES_DESC_EXEMPLOHAMBURGUERIA', 'Cadastrar mesas, maquininhas e gerar QR codes', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_TABLES_DESC_EXEMPLOHAMBURGUERIA', 'Register tables, card readers and generate QR codes', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_TABLES_DESC_EXEMPLOHAMBURGUERIA', 'Registrare tavoli, lettori di carte e generare QR code', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_TABLES_DESC_EXEMPLOHAMBURGUERIA', 'Registar mesas, terminais e gerar QR codes', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_TABLES_DESC_EXEMPLOHAMBURGUERIA', 'Registrar mesas, lectores de tarjetas y generar códigos QR', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_CARD_TABLES_DESC_EXEMPLOHAMBURGUERIA', 'تسجيل الطاولات وأجهزة القراءة وإنشاء رموز QR', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_LOADING_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_LOADING_EXEMPLOHAMBURGUERIA', 'Carregando dados...', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_LOADING_EXEMPLOHAMBURGUERIA', 'Loading data...', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_LOADING_EXEMPLOHAMBURGUERIA', 'Caricamento dati...', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_LOADING_EXEMPLOHAMBURGUERIA', 'A carregar dados...', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_LOADING_EXEMPLOHAMBURGUERIA', 'Cargando datos...', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_LOADING_EXEMPLOHAMBURGUERIA', 'جارٍ تحميل البيانات...', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_LOAD_ERROR_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_LOAD_ERROR_EXEMPLOHAMBURGUERIA', 'Falha ao carregar dados do painel.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_LOAD_ERROR_EXEMPLOHAMBURGUERIA', 'Failed to load panel data.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_LOAD_ERROR_EXEMPLOHAMBURGUERIA', 'Impossibile caricare i dati del pannello.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_LOAD_ERROR_EXEMPLOHAMBURGUERIA', 'Falha ao carregar dados do painel.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_LOAD_ERROR_EXEMPLOHAMBURGUERIA', 'Error al cargar los datos del panel.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_LOAD_ERROR_EXEMPLOHAMBURGUERIA', 'فشل تحميل بيانات اللوحة.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_PRIORITY_QUEUE_TITLE_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_PRIORITY_QUEUE_TITLE_EXEMPLOHAMBURGUERIA', 'Fila Prioritária', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_PRIORITY_QUEUE_TITLE_EXEMPLOHAMBURGUERIA', 'Priority Queue', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_PRIORITY_QUEUE_TITLE_EXEMPLOHAMBURGUERIA', 'Coda Prioritaria', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_PRIORITY_QUEUE_TITLE_EXEMPLOHAMBURGUERIA', 'Fila Prioritária', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_PRIORITY_QUEUE_TITLE_EXEMPLOHAMBURGUERIA', 'Cola Prioritaria', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_PRIORITY_QUEUE_TITLE_EXEMPLOHAMBURGUERIA', 'قائمة الأولويات', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_DESKTOP_BUTTON_ON_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_BUTTON_ON_EXEMPLOHAMBURGUERIA', 'ligado', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_BUTTON_ON_EXEMPLOHAMBURGUERIA', 'on', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_BUTTON_ON_EXEMPLOHAMBURGUERIA', 'attivo', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_BUTTON_ON_EXEMPLOHAMBURGUERIA', 'ligado', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_BUTTON_ON_EXEMPLOHAMBURGUERIA', 'activado', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_BUTTON_ON_EXEMPLOHAMBURGUERIA', 'مفعّل', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_DESKTOP_BUTTON_OFF_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_BUTTON_OFF_EXEMPLOHAMBURGUERIA', 'desligado', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_BUTTON_OFF_EXEMPLOHAMBURGUERIA', 'off', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_BUTTON_OFF_EXEMPLOHAMBURGUERIA', 'disattivo', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_BUTTON_OFF_EXEMPLOHAMBURGUERIA', 'desligado', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_BUTTON_OFF_EXEMPLOHAMBURGUERIA', 'desactivado', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_DESKTOP_BUTTON_OFF_EXEMPLOHAMBURGUERIA', 'معطّل', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_MARK_ALERTS_READ_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_MARK_ALERTS_READ_EXEMPLOHAMBURGUERIA', 'Limpar alertas', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_MARK_ALERTS_READ_EXEMPLOHAMBURGUERIA', 'Clear alerts', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_MARK_ALERTS_READ_EXEMPLOHAMBURGUERIA', 'Cancella avvisi', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_MARK_ALERTS_READ_EXEMPLOHAMBURGUERIA', 'Limpar alertas', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_MARK_ALERTS_READ_EXEMPLOHAMBURGUERIA', 'Limpiar alertas', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_MARK_ALERTS_READ_EXEMPLOHAMBURGUERIA', 'مسح التنبيهات', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_NO_ORDERS_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_NO_ORDERS_EXEMPLOHAMBURGUERIA', 'Sem pedidos ativos no momento.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_NO_ORDERS_EXEMPLOHAMBURGUERIA', 'No active orders at the moment.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_NO_ORDERS_EXEMPLOHAMBURGUERIA', 'Nessun ordine attivo al momento.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_NO_ORDERS_EXEMPLOHAMBURGUERIA', 'Sem pedidos ativos de momento.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_NO_ORDERS_EXEMPLOHAMBURGUERIA', 'Sin pedidos activos en este momento.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_NO_ORDERS_EXEMPLOHAMBURGUERIA', 'لا توجد طلبات نشطة في الوقت الحالي.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_PENDING_PAYMENTS_TITLE_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_PENDING_PAYMENTS_TITLE_EXEMPLOHAMBURGUERIA', 'Pagamentos Pendentes', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_PENDING_PAYMENTS_TITLE_EXEMPLOHAMBURGUERIA', 'Pending Payments', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_PENDING_PAYMENTS_TITLE_EXEMPLOHAMBURGUERIA', 'Pagamenti in Sospeso', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_PENDING_PAYMENTS_TITLE_EXEMPLOHAMBURGUERIA', 'Pagamentos Pendentes', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_PENDING_PAYMENTS_TITLE_EXEMPLOHAMBURGUERIA', 'Pagos Pendientes', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_PENDING_PAYMENTS_TITLE_EXEMPLOHAMBURGUERIA', 'المدفوعات المعلقة', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_MESA_LABEL_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_MESA_LABEL_EXEMPLOHAMBURGUERIA', 'Mesa', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_MESA_LABEL_EXEMPLOHAMBURGUERIA', 'Table', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_MESA_LABEL_EXEMPLOHAMBURGUERIA', 'Tavolo', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_MESA_LABEL_EXEMPLOHAMBURGUERIA', 'Mesa', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_MESA_LABEL_EXEMPLOHAMBURGUERIA', 'Mesa', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_MESA_LABEL_EXEMPLOHAMBURGUERIA', 'طاولة', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;

-- ADMIN_PANEL_NO_PENDING_PAYMENTS_EXEMPLOHAMBURGUERIA
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_NO_PENDING_PAYMENTS_EXEMPLOHAMBURGUERIA', 'Nenhuma mesa com pagamento pendente.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-BR'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_NO_PENDING_PAYMENTS_EXEMPLOHAMBURGUERIA', 'No tables with pending payment.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'en-US'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_NO_PENDING_PAYMENTS_EXEMPLOHAMBURGUERIA', 'Nessun tavolo con pagamento in sospeso.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'it-IT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_NO_PENDING_PAYMENTS_EXEMPLOHAMBURGUERIA', 'Nenhuma mesa com pagamento pendente.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'pt-PT'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_NO_PENDING_PAYMENTS_EXEMPLOHAMBURGUERIA', 'Ninguna mesa con pago pendiente.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'es-ES'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT 'ADMIN_PANEL_NO_PENDING_PAYMENTS_EXEMPLOHAMBURGUERIA', 'لا توجد طاولات بمدفوعات معلقة.', s.id, i.id FROM sistemas s, idiomas i WHERE s.codigo = 'exemplohamburgueria' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
