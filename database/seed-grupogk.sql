-- =============================================================
-- I18n API — Traduções completas do sistema Grupo GK (painel financeiro)
-- Sistema: 'grupogk'  |  6 idiomas
-- Execute após schema.sql e seed.sql
-- =============================================================

-- Garante que o sistema 'grupogk' existe
INSERT INTO sistemas (codigo, nome, descricao)
VALUES ('grupogk', 'Grupo GK — Painel Financeiro', 'Painel financeiro consolidado do Grupo GK')
ON CONFLICT (codigo) DO NOTHING;

-- Garante que todos os idiomas existem
INSERT INTO idiomas (codigo, nome, direcao) VALUES
    ('en-US', 'English (United States)',    'ltr'),
    ('it-IT', 'Italiano',                  'ltr'),
    ('pt-PT', 'Português (Portugal)',       'ltr'),
    ('pt-BR', 'Português (Brasil)',         'ltr'),
    ('es-ES', 'Español (España)',           'ltr'),
    ('ar-MA', 'العربية المغربية (Darija)',  'rtl')
ON CONFLICT (codigo) DO NOTHING;

-- =============================================================
-- Inserção em lote via VALUES
-- Formato: (chave, codigo_idioma, valor)
-- =============================================================
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT t.chave, t.valor, s.id, i.id
FROM sistemas s
JOIN (VALUES

  -- ─── NAVEGAÇÃO (SIDEBAR) ────────────────────────────────────
  ('NAV_DASHBOARD',       'pt-BR', 'Dashboard'),
  ('NAV_DASHBOARD',       'pt-PT', 'Dashboard'),
  ('NAV_DASHBOARD',       'en-US', 'Dashboard'),
  ('NAV_DASHBOARD',       'it-IT', 'Dashboard'),
  ('NAV_DASHBOARD',       'es-ES', 'Panel'),
  ('NAV_DASHBOARD',       'ar-MA', 'لوحة التحكم'),

  ('NAV_LANCAMENTOS',     'pt-BR', 'Lançamentos'),
  ('NAV_LANCAMENTOS',     'pt-PT', 'Lançamentos'),
  ('NAV_LANCAMENTOS',     'en-US', 'Transactions'),
  ('NAV_LANCAMENTOS',     'it-IT', 'Movimenti'),
  ('NAV_LANCAMENTOS',     'es-ES', 'Movimientos'),
  ('NAV_LANCAMENTOS',     'ar-MA', 'المعاملات'),

  ('NAV_CALENDARIO',      'pt-BR', 'Calendário'),
  ('NAV_CALENDARIO',      'pt-PT', 'Calendário'),
  ('NAV_CALENDARIO',      'en-US', 'Calendar'),
  ('NAV_CALENDARIO',      'it-IT', 'Calendario'),
  ('NAV_CALENDARIO',      'es-ES', 'Calendario'),
  ('NAV_CALENDARIO',      'ar-MA', 'التقويم'),

  ('NAV_CONCILIACAO',     'pt-BR', 'Conciliação'),
  ('NAV_CONCILIACAO',     'pt-PT', 'Conciliação'),
  ('NAV_CONCILIACAO',     'en-US', 'Reconciliation'),
  ('NAV_CONCILIACAO',     'it-IT', 'Riconciliazione'),
  ('NAV_CONCILIACAO',     'es-ES', 'Conciliación'),
  ('NAV_CONCILIACAO',     'ar-MA', 'المطابقة'),

  ('NAV_BANCOS',          'pt-BR', 'Bancos'),
  ('NAV_BANCOS',          'pt-PT', 'Bancos'),
  ('NAV_BANCOS',          'en-US', 'Banks'),
  ('NAV_BANCOS',          'it-IT', 'Banche'),
  ('NAV_BANCOS',          'es-ES', 'Bancos'),
  ('NAV_BANCOS',          'ar-MA', 'البنوك'),

  ('NAV_RELATORIOS',      'pt-BR', 'Relatórios'),
  ('NAV_RELATORIOS',      'pt-PT', 'Relatórios'),
  ('NAV_RELATORIOS',      'en-US', 'Reports'),
  ('NAV_RELATORIOS',      'it-IT', 'Rapporti'),
  ('NAV_RELATORIOS',      'es-ES', 'Informes'),
  ('NAV_RELATORIOS',      'ar-MA', 'التقارير'),

  ('NAV_ANALYTICS',       'pt-BR', 'Analytics'),
  ('NAV_ANALYTICS',       'pt-PT', 'Analytics'),
  ('NAV_ANALYTICS',       'en-US', 'Analytics'),
  ('NAV_ANALYTICS',       'it-IT', 'Analisi'),
  ('NAV_ANALYTICS',       'es-ES', 'Analítica'),
  ('NAV_ANALYTICS',       'ar-MA', 'التحليلات'),

  ('NAV_SELFMACHINE',     'pt-BR', 'SelfMachine'),
  ('NAV_SELFMACHINE',     'pt-PT', 'SelfMachine'),
  ('NAV_SELFMACHINE',     'en-US', 'SelfMachine'),
  ('NAV_SELFMACHINE',     'it-IT', 'SelfMachine'),
  ('NAV_SELFMACHINE',     'es-ES', 'SelfMachine'),
  ('NAV_SELFMACHINE',     'ar-MA', 'SelfMachine'),

  ('NAV_CONFIGURACOES',   'pt-BR', 'Configurações'),
  ('NAV_CONFIGURACOES',   'pt-PT', 'Configurações'),
  ('NAV_CONFIGURACOES',   'en-US', 'Settings'),
  ('NAV_CONFIGURACOES',   'it-IT', 'Impostazioni'),
  ('NAV_CONFIGURACOES',   'es-ES', 'Configuración'),
  ('NAV_CONFIGURACOES',   'ar-MA', 'الإعدادات'),

  -- ─── SIDEBAR FOOTER ─────────────────────────────────────────
  ('SIDEBAR_FINANCEIRO',  'pt-BR', 'Financeiro'),
  ('SIDEBAR_FINANCEIRO',  'pt-PT', 'Financeiro'),
  ('SIDEBAR_FINANCEIRO',  'en-US', 'Finance'),
  ('SIDEBAR_FINANCEIRO',  'it-IT', 'Finanza'),
  ('SIDEBAR_FINANCEIRO',  'es-ES', 'Finanzas'),
  ('SIDEBAR_FINANCEIRO',  'ar-MA', 'المالية'),

  ('PERFIL_ADMIN',        'pt-BR', 'Administrador'),
  ('PERFIL_ADMIN',        'pt-PT', 'Administrador'),
  ('PERFIL_ADMIN',        'en-US', 'Administrator'),
  ('PERFIL_ADMIN',        'it-IT', 'Amministratore'),
  ('PERFIL_ADMIN',        'es-ES', 'Administrador'),
  ('PERFIL_ADMIN',        'ar-MA', 'مدير النظام'),

  ('PERFIL_CAIXA',        'pt-BR', 'Caixa'),
  ('PERFIL_CAIXA',        'pt-PT', 'Caixa'),
  ('PERFIL_CAIXA',        'en-US', 'Cashier'),
  ('PERFIL_CAIXA',        'it-IT', 'Cassiere'),
  ('PERFIL_CAIXA',        'es-ES', 'Cajero'),
  ('PERFIL_CAIXA',        'ar-MA', 'أمين الصندوق'),

  ('BTN_SAIR',            'pt-BR', 'Sair'),
  ('BTN_SAIR',            'pt-PT', 'Sair'),
  ('BTN_SAIR',            'en-US', 'Sign Out'),
  ('BTN_SAIR',            'it-IT', 'Esci'),
  ('BTN_SAIR',            'es-ES', 'Salir'),
  ('BTN_SAIR',            'ar-MA', 'خروج'),

  -- ─── LOGIN ──────────────────────────────────────────────────
  ('LOGIN_BRAND',         'pt-BR', 'Grupo GK'),
  ('LOGIN_BRAND',         'pt-PT', 'Grupo GK'),
  ('LOGIN_BRAND',         'en-US', 'Grupo GK'),
  ('LOGIN_BRAND',         'it-IT', 'Gruppo GK'),
  ('LOGIN_BRAND',         'es-ES', 'Grupo GK'),
  ('LOGIN_BRAND',         'ar-MA', 'مجموعة GK'),

  ('LOGIN_SUBTITLE',      'pt-BR', 'Sistema Financeiro Consolidado'),
  ('LOGIN_SUBTITLE',      'pt-PT', 'Sistema Financeiro Consolidado'),
  ('LOGIN_SUBTITLE',      'en-US', 'Consolidated Financial System'),
  ('LOGIN_SUBTITLE',      'it-IT', 'Sistema Finanziario Consolidato'),
  ('LOGIN_SUBTITLE',      'es-ES', 'Sistema Financiero Consolidado'),
  ('LOGIN_SUBTITLE',      'ar-MA', 'النظام المالي الموحد'),

  ('LOGIN_CARD_TITLE',    'pt-BR', 'Entrar na sua conta'),
  ('LOGIN_CARD_TITLE',    'pt-PT', 'Entrar na sua conta'),
  ('LOGIN_CARD_TITLE',    'en-US', 'Sign in to your account'),
  ('LOGIN_CARD_TITLE',    'it-IT', 'Accedi al tuo account'),
  ('LOGIN_CARD_TITLE',    'es-ES', 'Ingresar a su cuenta'),
  ('LOGIN_CARD_TITLE',    'ar-MA', 'الدخول إلى حسابك'),

  ('LOGIN_EMAIL_LABEL',   'pt-BR', 'E-mail'),
  ('LOGIN_EMAIL_LABEL',   'pt-PT', 'E-mail'),
  ('LOGIN_EMAIL_LABEL',   'en-US', 'E-mail'),
  ('LOGIN_EMAIL_LABEL',   'it-IT', 'E-mail'),
  ('LOGIN_EMAIL_LABEL',   'es-ES', 'Correo electrónico'),
  ('LOGIN_EMAIL_LABEL',   'ar-MA', 'البريد الإلكتروني'),

  ('LOGIN_SENHA_LABEL',   'pt-BR', 'Senha'),
  ('LOGIN_SENHA_LABEL',   'pt-PT', 'Palavra-passe'),
  ('LOGIN_SENHA_LABEL',   'en-US', 'Password'),
  ('LOGIN_SENHA_LABEL',   'it-IT', 'Password'),
  ('LOGIN_SENHA_LABEL',   'es-ES', 'Contraseña'),
  ('LOGIN_SENHA_LABEL',   'ar-MA', 'كلمة المرور'),

  ('LOGIN_BTN',           'pt-BR', 'Entrar'),
  ('LOGIN_BTN',           'pt-PT', 'Entrar'),
  ('LOGIN_BTN',           'en-US', 'Sign In'),
  ('LOGIN_BTN',           'it-IT', 'Accedi'),
  ('LOGIN_BTN',           'es-ES', 'Entrar'),
  ('LOGIN_BTN',           'ar-MA', 'دخول'),

  ('LOGIN_BTN_LOADING',   'pt-BR', 'Entrando…'),
  ('LOGIN_BTN_LOADING',   'pt-PT', 'A entrar…'),
  ('LOGIN_BTN_LOADING',   'en-US', 'Signing in…'),
  ('LOGIN_BTN_LOADING',   'it-IT', 'Accesso in corso…'),
  ('LOGIN_BTN_LOADING',   'es-ES', 'Entrando…'),
  ('LOGIN_BTN_LOADING',   'ar-MA', 'جارٍ الدخول…'),

  ('LOGIN_ERROR_DEFAULT', 'pt-BR', 'Credenciais inválidas. Tente novamente.'),
  ('LOGIN_ERROR_DEFAULT', 'pt-PT', 'Credenciais inválidas. Tente novamente.'),
  ('LOGIN_ERROR_DEFAULT', 'en-US', 'Invalid credentials. Please try again.'),
  ('LOGIN_ERROR_DEFAULT', 'it-IT', 'Credenziali non valide. Riprova.'),
  ('LOGIN_ERROR_DEFAULT', 'es-ES', 'Credenciales inválidas. Inténtelo de nuevo.'),
  ('LOGIN_ERROR_DEFAULT', 'ar-MA', 'بيانات اعتماد غير صالحة. حاول مرة أخرى.'),

  -- ─── HEADER ─────────────────────────────────────────────────
  ('HEADER_SALDO_CONSOLIDADO','pt-BR','Saldo Consolidado'),
  ('HEADER_SALDO_CONSOLIDADO','pt-PT','Saldo Consolidado'),
  ('HEADER_SALDO_CONSOLIDADO','en-US','Consolidated Balance'),
  ('HEADER_SALDO_CONSOLIDADO','it-IT','Saldo Consolidato'),
  ('HEADER_SALDO_CONSOLIDADO','es-ES','Saldo Consolidado'),
  ('HEADER_SALDO_CONSOLIDADO','ar-MA','الرصيد الموحد'),

  ('HEADER_SALDO_BANCO',  'pt-BR', 'Saldo'),
  ('HEADER_SALDO_BANCO',  'pt-PT', 'Saldo'),
  ('HEADER_SALDO_BANCO',  'en-US', 'Balance'),
  ('HEADER_SALDO_BANCO',  'it-IT', 'Saldo'),
  ('HEADER_SALDO_BANCO',  'es-ES', 'Saldo'),
  ('HEADER_SALDO_BANCO',  'ar-MA', 'رصيد'),

  ('HEADER_TODOS_BANCOS', 'pt-BR', 'Todos os Bancos'),
  ('HEADER_TODOS_BANCOS', 'pt-PT', 'Todos os Bancos'),
  ('HEADER_TODOS_BANCOS', 'en-US', 'All Banks'),
  ('HEADER_TODOS_BANCOS', 'it-IT', 'Tutte le Banche'),
  ('HEADER_TODOS_BANCOS', 'es-ES', 'Todos los Bancos'),
  ('HEADER_TODOS_BANCOS', 'ar-MA', 'جميع البنوك'),

  -- ─── DASHBOARD ──────────────────────────────────────────────
  ('DASH_TITLE',          'pt-BR', 'Dashboard Consolidado'),
  ('DASH_TITLE',          'pt-PT', 'Dashboard Consolidado'),
  ('DASH_TITLE',          'en-US', 'Consolidated Dashboard'),
  ('DASH_TITLE',          'it-IT', 'Dashboard Consolidato'),
  ('DASH_TITLE',          'es-ES', 'Panel Consolidado'),
  ('DASH_TITLE',          'ar-MA', 'لوحة التحكم الموحدة'),

  ('DASH_SUBTITLE',       'pt-BR', 'Visão geral financeira do Grupo GK'),
  ('DASH_SUBTITLE',       'pt-PT', 'Visão geral financeira do Grupo GK'),
  ('DASH_SUBTITLE',       'en-US', 'Financial overview of Grupo GK'),
  ('DASH_SUBTITLE',       'it-IT', 'Panoramica finanziaria del Gruppo GK'),
  ('DASH_SUBTITLE',       'es-ES', 'Resumen financiero del Grupo GK'),
  ('DASH_SUBTITLE',       'ar-MA', 'نظرة عامة على مالية مجموعة GK'),

  ('DASH_REFRESH',        'pt-BR', 'Atualizar'),
  ('DASH_REFRESH',        'pt-PT', 'Atualizar'),
  ('DASH_REFRESH',        'en-US', 'Refresh'),
  ('DASH_REFRESH',        'it-IT', 'Aggiorna'),
  ('DASH_REFRESH',        'es-ES', 'Actualizar'),
  ('DASH_REFRESH',        'ar-MA', 'تحديث'),

  ('DASH_TOTAL_ENTRADAS', 'pt-BR', 'Total Entradas'),
  ('DASH_TOTAL_ENTRADAS', 'pt-PT', 'Total Entradas'),
  ('DASH_TOTAL_ENTRADAS', 'en-US', 'Total Income'),
  ('DASH_TOTAL_ENTRADAS', 'it-IT', 'Totale Entrate'),
  ('DASH_TOTAL_ENTRADAS', 'es-ES', 'Total Ingresos'),
  ('DASH_TOTAL_ENTRADAS', 'ar-MA', 'إجمالي الإيرادات'),

  ('DASH_TOTAL_SAIDAS',   'pt-BR', 'Total Saídas'),
  ('DASH_TOTAL_SAIDAS',   'pt-PT', 'Total Saídas'),
  ('DASH_TOTAL_SAIDAS',   'en-US', 'Total Expenses'),
  ('DASH_TOTAL_SAIDAS',   'it-IT', 'Totale Uscite'),
  ('DASH_TOTAL_SAIDAS',   'es-ES', 'Total Gastos'),
  ('DASH_TOTAL_SAIDAS',   'ar-MA', 'إجمالي المصروفات'),

  ('DASH_SALDO_LIQUIDO',  'pt-BR', 'Saldo Líquido'),
  ('DASH_SALDO_LIQUIDO',  'pt-PT', 'Saldo Líquido'),
  ('DASH_SALDO_LIQUIDO',  'en-US', 'Net Balance'),
  ('DASH_SALDO_LIQUIDO',  'it-IT', 'Saldo Netto'),
  ('DASH_SALDO_LIQUIDO',  'es-ES', 'Saldo Neto'),
  ('DASH_SALDO_LIQUIDO',  'ar-MA', 'الرصيد الصافي'),

  ('DASH_SALDO_ATUAL',    'pt-BR', 'Saldo Atual em Caixa'),
  ('DASH_SALDO_ATUAL',    'pt-PT', 'Saldo Atual em Caixa'),
  ('DASH_SALDO_ATUAL',    'en-US', 'Current Cash Balance'),
  ('DASH_SALDO_ATUAL',    'it-IT', 'Saldo Attuale in Cassa'),
  ('DASH_SALDO_ATUAL',    'es-ES', 'Saldo Actual en Caja'),
  ('DASH_SALDO_ATUAL',    'ar-MA', 'الرصيد الحالي في الصندوق'),

  ('DASH_ENTRADAS_HOJE',  'pt-BR', 'Entradas Hoje'),
  ('DASH_ENTRADAS_HOJE',  'pt-PT', 'Entradas Hoje'),
  ('DASH_ENTRADAS_HOJE',  'en-US', 'Today''s Income'),
  ('DASH_ENTRADAS_HOJE',  'it-IT', 'Entrate Oggi'),
  ('DASH_ENTRADAS_HOJE',  'es-ES', 'Ingresos Hoy'),
  ('DASH_ENTRADAS_HOJE',  'ar-MA', 'إيرادات اليوم'),

  ('DASH_SAIDAS_HOJE',    'pt-BR', 'Saídas Hoje'),
  ('DASH_SAIDAS_HOJE',    'pt-PT', 'Saídas Hoje'),
  ('DASH_SAIDAS_HOJE',    'en-US', 'Today''s Expenses'),
  ('DASH_SAIDAS_HOJE',    'it-IT', 'Uscite Oggi'),
  ('DASH_SAIDAS_HOJE',    'es-ES', 'Gastos Hoy'),
  ('DASH_SAIDAS_HOJE',    'ar-MA', 'مصروفات اليوم'),

  ('DASH_SALDO_HOJE',     'pt-BR', 'Saldo do Dia'),
  ('DASH_SALDO_HOJE',     'pt-PT', 'Saldo do Dia'),
  ('DASH_SALDO_HOJE',     'en-US', 'Day Balance'),
  ('DASH_SALDO_HOJE',     'it-IT', 'Saldo del Giorno'),
  ('DASH_SALDO_HOJE',     'es-ES', 'Saldo del Día'),
  ('DASH_SALDO_HOJE',     'ar-MA', 'رصيد اليوم'),

  ('DASH_CARREGANDO',     'pt-BR', 'Carregando…'),
  ('DASH_CARREGANDO',     'pt-PT', 'A carregar…'),
  ('DASH_CARREGANDO',     'en-US', 'Loading…'),
  ('DASH_CARREGANDO',     'it-IT', 'Caricamento…'),
  ('DASH_CARREGANDO',     'es-ES', 'Cargando…'),
  ('DASH_CARREGANDO',     'ar-MA', 'جارٍ التحميل…'),

  -- ─── BOTÕES GLOBAIS ─────────────────────────────────────────
  ('BTN_CONFIRM',         'pt-BR', 'Confirmar'),
  ('BTN_CONFIRM',         'pt-PT', 'Confirmar'),
  ('BTN_CONFIRM',         'en-US', 'Confirm'),
  ('BTN_CONFIRM',         'it-IT', 'Conferma'),
  ('BTN_CONFIRM',         'es-ES', 'Confirmar'),
  ('BTN_CONFIRM',         'ar-MA', 'تأكيد'),

  ('BTN_CANCEL',          'pt-BR', 'Cancelar'),
  ('BTN_CANCEL',          'pt-PT', 'Cancelar'),
  ('BTN_CANCEL',          'en-US', 'Cancel'),
  ('BTN_CANCEL',          'it-IT', 'Annulla'),
  ('BTN_CANCEL',          'es-ES', 'Cancelar'),
  ('BTN_CANCEL',          'ar-MA', 'إلغاء'),

  ('BTN_SAVE',            'pt-BR', 'Salvar'),
  ('BTN_SAVE',            'pt-PT', 'Guardar'),
  ('BTN_SAVE',            'en-US', 'Save'),
  ('BTN_SAVE',            'it-IT', 'Salva'),
  ('BTN_SAVE',            'es-ES', 'Guardar'),
  ('BTN_SAVE',            'ar-MA', 'حفظ'),

  ('BTN_DELETE',          'pt-BR', 'Excluir'),
  ('BTN_DELETE',          'pt-PT', 'Eliminar'),
  ('BTN_DELETE',          'en-US', 'Delete'),
  ('BTN_DELETE',          'it-IT', 'Elimina'),
  ('BTN_DELETE',          'es-ES', 'Eliminar'),
  ('BTN_DELETE',          'ar-MA', 'حذف'),

  ('BTN_EDIT',            'pt-BR', 'Editar'),
  ('BTN_EDIT',            'pt-PT', 'Editar'),
  ('BTN_EDIT',            'en-US', 'Edit'),
  ('BTN_EDIT',            'it-IT', 'Modifica'),
  ('BTN_EDIT',            'es-ES', 'Editar'),
  ('BTN_EDIT',            'ar-MA', 'تعديل'),

  ('BTN_ADD',             'pt-BR', 'Adicionar'),
  ('BTN_ADD',             'pt-PT', 'Adicionar'),
  ('BTN_ADD',             'en-US', 'Add'),
  ('BTN_ADD',             'it-IT', 'Aggiungi'),
  ('BTN_ADD',             'es-ES', 'Agregar'),
  ('BTN_ADD',             'ar-MA', 'إضافة'),

  ('BTN_SEARCH',          'pt-BR', 'Buscar'),
  ('BTN_SEARCH',          'pt-PT', 'Pesquisar'),
  ('BTN_SEARCH',          'en-US', 'Search'),
  ('BTN_SEARCH',          'it-IT', 'Cerca'),
  ('BTN_SEARCH',          'es-ES', 'Buscar'),
  ('BTN_SEARCH',          'ar-MA', 'بحث'),

  ('BTN_FILTER',          'pt-BR', 'Filtrar'),
  ('BTN_FILTER',          'pt-PT', 'Filtrar'),
  ('BTN_FILTER',          'en-US', 'Filter'),
  ('BTN_FILTER',          'it-IT', 'Filtra'),
  ('BTN_FILTER',          'es-ES', 'Filtrar'),
  ('BTN_FILTER',          'ar-MA', 'تصفية'),

  ('BTN_EXPORT',          'pt-BR', 'Exportar'),
  ('BTN_EXPORT',          'pt-PT', 'Exportar'),
  ('BTN_EXPORT',          'en-US', 'Export'),
  ('BTN_EXPORT',          'it-IT', 'Esporta'),
  ('BTN_EXPORT',          'es-ES', 'Exportar'),
  ('BTN_EXPORT',          'ar-MA', 'تصدير'),

  ('BTN_CLOSE',           'pt-BR', 'Fechar'),
  ('BTN_CLOSE',           'pt-PT', 'Fechar'),
  ('BTN_CLOSE',           'en-US', 'Close'),
  ('BTN_CLOSE',           'it-IT', 'Chiudi'),
  ('BTN_CLOSE',           'es-ES', 'Cerrar'),
  ('BTN_CLOSE',           'ar-MA', 'إغلاق'),

  ('BTN_BACK',            'pt-BR', '← Voltar'),
  ('BTN_BACK',            'pt-PT', '← Voltar'),
  ('BTN_BACK',            'en-US', '← Back'),
  ('BTN_BACK',            'it-IT', '← Indietro'),
  ('BTN_BACK',            'es-ES', '← Volver'),
  ('BTN_BACK',            'ar-MA', '→ رجوع'),

  ('BTN_NOVO_LANCAMENTO', 'pt-BR', 'Novo Lançamento'),
  ('BTN_NOVO_LANCAMENTO', 'pt-PT', 'Novo Lançamento'),
  ('BTN_NOVO_LANCAMENTO', 'en-US', 'New Transaction'),
  ('BTN_NOVO_LANCAMENTO', 'it-IT', 'Nuovo Movimento'),
  ('BTN_NOVO_LANCAMENTO', 'es-ES', 'Nuevo Movimiento'),
  ('BTN_NOVO_LANCAMENTO', 'ar-MA', 'معاملة جديدة'),

  -- ─── STATUS ─────────────────────────────────────────────────
  ('STATUS_REALIZADO',    'pt-BR', 'Realizado'),
  ('STATUS_REALIZADO',    'pt-PT', 'Realizado'),
  ('STATUS_REALIZADO',    'en-US', 'Completed'),
  ('STATUS_REALIZADO',    'it-IT', 'Completato'),
  ('STATUS_REALIZADO',    'es-ES', 'Realizado'),
  ('STATUS_REALIZADO',    'ar-MA', 'مكتمل'),

  ('STATUS_PREVISTO',     'pt-BR', 'Previsto'),
  ('STATUS_PREVISTO',     'pt-PT', 'Previsto'),
  ('STATUS_PREVISTO',     'en-US', 'Planned'),
  ('STATUS_PREVISTO',     'it-IT', 'Previsto'),
  ('STATUS_PREVISTO',     'es-ES', 'Previsto'),
  ('STATUS_PREVISTO',     'ar-MA', 'مخطط'),

  -- ─── TIPOS DE MOVIMENTO ─────────────────────────────────────
  ('TIPO_ENTRADA',        'pt-BR', 'Entrada'),
  ('TIPO_ENTRADA',        'pt-PT', 'Entrada'),
  ('TIPO_ENTRADA',        'en-US', 'Income'),
  ('TIPO_ENTRADA',        'it-IT', 'Entrata'),
  ('TIPO_ENTRADA',        'es-ES', 'Ingreso'),
  ('TIPO_ENTRADA',        'ar-MA', 'إيراد'),

  ('TIPO_SAIDA',          'pt-BR', 'Saída'),
  ('TIPO_SAIDA',          'pt-PT', 'Saída'),
  ('TIPO_SAIDA',          'en-US', 'Expense'),
  ('TIPO_SAIDA',          'it-IT', 'Uscita'),
  ('TIPO_SAIDA',          'es-ES', 'Gasto'),
  ('TIPO_SAIDA',          'ar-MA', 'مصروف'),

  ('TIPO_TRANSFERENCIA',  'pt-BR', 'Transferência'),
  ('TIPO_TRANSFERENCIA',  'pt-PT', 'Transferência'),
  ('TIPO_TRANSFERENCIA',  'en-US', 'Transfer'),
  ('TIPO_TRANSFERENCIA',  'it-IT', 'Trasferimento'),
  ('TIPO_TRANSFERENCIA',  'es-ES', 'Transferencia'),
  ('TIPO_TRANSFERENCIA',  'ar-MA', 'تحويل'),

  ('TIPO_AJUSTE_SALDO',   'pt-BR', 'Ajuste de Saldo'),
  ('TIPO_AJUSTE_SALDO',   'pt-PT', 'Ajuste de Saldo'),
  ('TIPO_AJUSTE_SALDO',   'en-US', 'Balance Adjustment'),
  ('TIPO_AJUSTE_SALDO',   'it-IT', 'Rettifica Saldo'),
  ('TIPO_AJUSTE_SALDO',   'es-ES', 'Ajuste de Saldo'),
  ('TIPO_AJUSTE_SALDO',   'ar-MA', 'تعديل الرصيد'),

  -- ─── CATEGORIAS ─────────────────────────────────────────────
  ('CAT_PEDIDO',          'pt-BR', 'Pedido'),
  ('CAT_PEDIDO',          'pt-PT', 'Pedido'),
  ('CAT_PEDIDO',          'en-US', 'Order'),
  ('CAT_PEDIDO',          'it-IT', 'Ordine'),
  ('CAT_PEDIDO',          'es-ES', 'Pedido'),
  ('CAT_PEDIDO',          'ar-MA', 'طلب'),

  ('CAT_COMISSAO',        'pt-BR', 'Comissão'),
  ('CAT_COMISSAO',        'pt-PT', 'Comissão'),
  ('CAT_COMISSAO',        'en-US', 'Commission'),
  ('CAT_COMISSAO',        'it-IT', 'Commissione'),
  ('CAT_COMISSAO',        'es-ES', 'Comisión'),
  ('CAT_COMISSAO',        'ar-MA', 'عمولة'),

  ('CAT_BOLETO',          'pt-BR', 'Boleto'),
  ('CAT_BOLETO',          'pt-PT', 'Boleto'),
  ('CAT_BOLETO',          'en-US', 'Bill/Slip'),
  ('CAT_BOLETO',          'it-IT', 'Bollettino'),
  ('CAT_BOLETO',          'es-ES', 'Boleta'),
  ('CAT_BOLETO',          'ar-MA', 'فاتورة'),

  ('CAT_FORNECEDOR',      'pt-BR', 'Fornecedor'),
  ('CAT_FORNECEDOR',      'pt-PT', 'Fornecedor'),
  ('CAT_FORNECEDOR',      'en-US', 'Supplier'),
  ('CAT_FORNECEDOR',      'it-IT', 'Fornitore'),
  ('CAT_FORNECEDOR',      'es-ES', 'Proveedor'),
  ('CAT_FORNECEDOR',      'ar-MA', 'مورّد'),

  ('CAT_CUSTO_FIXO',      'pt-BR', 'Custo Fixo'),
  ('CAT_CUSTO_FIXO',      'pt-PT', 'Custo Fixo'),
  ('CAT_CUSTO_FIXO',      'en-US', 'Fixed Cost'),
  ('CAT_CUSTO_FIXO',      'it-IT', 'Costo Fisso'),
  ('CAT_CUSTO_FIXO',      'es-ES', 'Costo Fijo'),
  ('CAT_CUSTO_FIXO',      'ar-MA', 'تكلفة ثابتة'),

  ('CAT_INVESTIMENTO',    'pt-BR', 'Investimento'),
  ('CAT_INVESTIMENTO',    'pt-PT', 'Investimento'),
  ('CAT_INVESTIMENTO',    'en-US', 'Investment'),
  ('CAT_INVESTIMENTO',    'it-IT', 'Investimento'),
  ('CAT_INVESTIMENTO',    'es-ES', 'Inversión'),
  ('CAT_INVESTIMENTO',    'ar-MA', 'استثمار'),

  -- ─── LANÇAMENTOS PAGE ───────────────────────────────────────
  ('LANC_TITLE',          'pt-BR', 'Lançamentos'),
  ('LANC_TITLE',          'pt-PT', 'Lançamentos'),
  ('LANC_TITLE',          'en-US', 'Transactions'),
  ('LANC_TITLE',          'it-IT', 'Movimenti'),
  ('LANC_TITLE',          'es-ES', 'Movimientos'),
  ('LANC_TITLE',          'ar-MA', 'المعاملات'),

  ('LANC_FILTROS',        'pt-BR', 'Filtros'),
  ('LANC_FILTROS',        'pt-PT', 'Filtros'),
  ('LANC_FILTROS',        'en-US', 'Filters'),
  ('LANC_FILTROS',        'it-IT', 'Filtri'),
  ('LANC_FILTROS',        'es-ES', 'Filtros'),
  ('LANC_FILTROS',        'ar-MA', 'الفلاتر'),

  ('LANC_EMPRESA',        'pt-BR', 'Empresa'),
  ('LANC_EMPRESA',        'pt-PT', 'Empresa'),
  ('LANC_EMPRESA',        'en-US', 'Company'),
  ('LANC_EMPRESA',        'it-IT', 'Azienda'),
  ('LANC_EMPRESA',        'es-ES', 'Empresa'),
  ('LANC_EMPRESA',        'ar-MA', 'الشركة'),

  ('LANC_CONTA',          'pt-BR', 'Conta'),
  ('LANC_CONTA',          'pt-PT', 'Conta'),
  ('LANC_CONTA',          'en-US', 'Account'),
  ('LANC_CONTA',          'it-IT', 'Conto'),
  ('LANC_CONTA',          'es-ES', 'Cuenta'),
  ('LANC_CONTA',          'ar-MA', 'الحساب'),

  ('LANC_DATA_INICIO',    'pt-BR', 'Data Início'),
  ('LANC_DATA_INICIO',    'pt-PT', 'Data Início'),
  ('LANC_DATA_INICIO',    'en-US', 'Start Date'),
  ('LANC_DATA_INICIO',    'it-IT', 'Data Inizio'),
  ('LANC_DATA_INICIO',    'es-ES', 'Fecha Inicio'),
  ('LANC_DATA_INICIO',    'ar-MA', 'تاريخ البداية'),

  ('LANC_DATA_FIM',       'pt-BR', 'Data Fim'),
  ('LANC_DATA_FIM',       'pt-PT', 'Data Fim'),
  ('LANC_DATA_FIM',       'en-US', 'End Date'),
  ('LANC_DATA_FIM',       'it-IT', 'Data Fine'),
  ('LANC_DATA_FIM',       'es-ES', 'Fecha Fin'),
  ('LANC_DATA_FIM',       'ar-MA', 'تاريخ النهاية'),

  ('LANC_DESCRICAO',      'pt-BR', 'Descrição'),
  ('LANC_DESCRICAO',      'pt-PT', 'Descrição'),
  ('LANC_DESCRICAO',      'en-US', 'Description'),
  ('LANC_DESCRICAO',      'it-IT', 'Descrizione'),
  ('LANC_DESCRICAO',      'es-ES', 'Descripción'),
  ('LANC_DESCRICAO',      'ar-MA', 'الوصف'),

  ('LANC_VALOR',          'pt-BR', 'Valor'),
  ('LANC_VALOR',          'pt-PT', 'Valor'),
  ('LANC_VALOR',          'en-US', 'Amount'),
  ('LANC_VALOR',          'it-IT', 'Importo'),
  ('LANC_VALOR',          'es-ES', 'Monto'),
  ('LANC_VALOR',          'ar-MA', 'المبلغ'),

  ('LANC_DATA',           'pt-BR', 'Data'),
  ('LANC_DATA',           'pt-PT', 'Data'),
  ('LANC_DATA',           'en-US', 'Date'),
  ('LANC_DATA',           'it-IT', 'Data'),
  ('LANC_DATA',           'es-ES', 'Fecha'),
  ('LANC_DATA',           'ar-MA', 'التاريخ'),

  ('LANC_TIPO',           'pt-BR', 'Tipo'),
  ('LANC_TIPO',           'pt-PT', 'Tipo'),
  ('LANC_TIPO',           'en-US', 'Type'),
  ('LANC_TIPO',           'it-IT', 'Tipo'),
  ('LANC_TIPO',           'es-ES', 'Tipo'),
  ('LANC_TIPO',           'ar-MA', 'النوع'),

  ('LANC_STATUS',         'pt-BR', 'Status'),
  ('LANC_STATUS',         'pt-PT', 'Estado'),
  ('LANC_STATUS',         'en-US', 'Status'),
  ('LANC_STATUS',         'it-IT', 'Stato'),
  ('LANC_STATUS',         'es-ES', 'Estado'),
  ('LANC_STATUS',         'ar-MA', 'الحالة'),

  ('LANC_TODOS',          'pt-BR', 'Todos'),
  ('LANC_TODOS',          'pt-PT', 'Todos'),
  ('LANC_TODOS',          'en-US', 'All'),
  ('LANC_TODOS',          'it-IT', 'Tutti'),
  ('LANC_TODOS',          'es-ES', 'Todos'),
  ('LANC_TODOS',          'ar-MA', 'الكل'),

  ('LANC_NENHUM',         'pt-BR', 'Nenhum lançamento encontrado.'),
  ('LANC_NENHUM',         'pt-PT', 'Nenhum lançamento encontrado.'),
  ('LANC_NENHUM',         'en-US', 'No transactions found.'),
  ('LANC_NENHUM',         'it-IT', 'Nessun movimento trovato.'),
  ('LANC_NENHUM',         'es-ES', 'No se encontraron movimientos.'),
  ('LANC_NENHUM',         'ar-MA', 'لا توجد معاملات.'),

  -- ─── CONFIGURAÇÕES ──────────────────────────────────────────
  ('CONFIG_TITLE',        'pt-BR', 'Configurações'),
  ('CONFIG_TITLE',        'pt-PT', 'Configurações'),
  ('CONFIG_TITLE',        'en-US', 'Settings'),
  ('CONFIG_TITLE',        'it-IT', 'Impostazioni'),
  ('CONFIG_TITLE',        'es-ES', 'Configuración'),
  ('CONFIG_TITLE',        'ar-MA', 'الإعدادات'),

  ('CONFIG_IDIOMA',       'pt-BR', 'Idioma'),
  ('CONFIG_IDIOMA',       'pt-PT', 'Idioma'),
  ('CONFIG_IDIOMA',       'en-US', 'Language'),
  ('CONFIG_IDIOMA',       'it-IT', 'Lingua'),
  ('CONFIG_IDIOMA',       'es-ES', 'Idioma'),
  ('CONFIG_IDIOMA',       'ar-MA', 'اللغة'),

  ('CONFIG_TEMA',         'pt-BR', 'Tema'),
  ('CONFIG_TEMA',         'pt-PT', 'Tema'),
  ('CONFIG_TEMA',         'en-US', 'Theme'),
  ('CONFIG_TEMA',         'it-IT', 'Tema'),
  ('CONFIG_TEMA',         'es-ES', 'Tema'),
  ('CONFIG_TEMA',         'ar-MA', 'السمة'),

  ('CONFIG_TEMA_CLARO',   'pt-BR', 'Claro'),
  ('CONFIG_TEMA_CLARO',   'pt-PT', 'Claro'),
  ('CONFIG_TEMA_CLARO',   'en-US', 'Light'),
  ('CONFIG_TEMA_CLARO',   'it-IT', 'Chiaro'),
  ('CONFIG_TEMA_CLARO',   'es-ES', 'Claro'),
  ('CONFIG_TEMA_CLARO',   'ar-MA', 'فاتح'),

  ('CONFIG_TEMA_ESCURO',  'pt-BR', 'Escuro'),
  ('CONFIG_TEMA_ESCURO',  'pt-PT', 'Escuro'),
  ('CONFIG_TEMA_ESCURO',  'en-US', 'Dark'),
  ('CONFIG_TEMA_ESCURO',  'it-IT', 'Scuro'),
  ('CONFIG_TEMA_ESCURO',  'es-ES', 'Oscuro'),
  ('CONFIG_TEMA_ESCURO',  'ar-MA', 'داكن'),

  -- ─── RELATÓRIOS ─────────────────────────────────────────────
  ('REL_TITLE',           'pt-BR', 'Relatórios'),
  ('REL_TITLE',           'pt-PT', 'Relatórios'),
  ('REL_TITLE',           'en-US', 'Reports'),
  ('REL_TITLE',           'it-IT', 'Rapporti'),
  ('REL_TITLE',           'es-ES', 'Informes'),
  ('REL_TITLE',           'ar-MA', 'التقارير'),

  -- ─── CONCILIAÇÃO ────────────────────────────────────────────
  ('CONC_TITLE',          'pt-BR', 'Conciliação Bancária'),
  ('CONC_TITLE',          'pt-PT', 'Conciliação Bancária'),
  ('CONC_TITLE',          'en-US', 'Bank Reconciliation'),
  ('CONC_TITLE',          'it-IT', 'Riconciliazione Bancaria'),
  ('CONC_TITLE',          'es-ES', 'Conciliación Bancaria'),
  ('CONC_TITLE',          'ar-MA', 'المطابقة المصرفية'),

  ('CONC_PENDENTES',      'pt-BR', 'Pendentes de Conciliação'),
  ('CONC_PENDENTES',      'pt-PT', 'Pendentes de Conciliação'),
  ('CONC_PENDENTES',      'en-US', 'Pending Reconciliation'),
  ('CONC_PENDENTES',      'it-IT', 'In attesa di Riconciliazione'),
  ('CONC_PENDENTES',      'es-ES', 'Pendientes de Conciliación'),
  ('CONC_PENDENTES',      'ar-MA', 'في انتظار المطابقة'),

  ('CONC_CONCILIADOS',    'pt-BR', 'Conciliados'),
  ('CONC_CONCILIADOS',    'pt-PT', 'Conciliados'),
  ('CONC_CONCILIADOS',    'en-US', 'Reconciled'),
  ('CONC_CONCILIADOS',    'it-IT', 'Riconciliati'),
  ('CONC_CONCILIADOS',    'es-ES', 'Conciliados'),
  ('CONC_CONCILIADOS',    'ar-MA', 'مطابَق'),

  -- ─── BANCOS PAGE ────────────────────────────────────────────
  ('BANCOS_TITLE',        'pt-BR', 'Contas Bancárias'),
  ('BANCOS_TITLE',        'pt-PT', 'Contas Bancárias'),
  ('BANCOS_TITLE',        'en-US', 'Bank Accounts'),
  ('BANCOS_TITLE',        'it-IT', 'Conti Bancari'),
  ('BANCOS_TITLE',        'es-ES', 'Cuentas Bancarias'),
  ('BANCOS_TITLE',        'ar-MA', 'الحسابات البنكية'),

  ('BANCOS_SALDO_ATUAL',  'pt-BR', 'Saldo Atual'),
  ('BANCOS_SALDO_ATUAL',  'pt-PT', 'Saldo Atual'),
  ('BANCOS_SALDO_ATUAL',  'en-US', 'Current Balance'),
  ('BANCOS_SALDO_ATUAL',  'it-IT', 'Saldo Attuale'),
  ('BANCOS_SALDO_ATUAL',  'es-ES', 'Saldo Actual'),
  ('BANCOS_SALDO_ATUAL',  'ar-MA', 'الرصيد الحالي'),

  -- ─── CALENDARIO ─────────────────────────────────────────────
  ('CAL_TITLE',           'pt-BR', 'Calendário Financeiro'),
  ('CAL_TITLE',           'pt-PT', 'Calendário Financeiro'),
  ('CAL_TITLE',           'en-US', 'Financial Calendar'),
  ('CAL_TITLE',           'it-IT', 'Calendario Finanziario'),
  ('CAL_TITLE',           'es-ES', 'Calendario Financiero'),
  ('CAL_TITLE',           'ar-MA', 'التقويم المالي'),

  -- ─── ERROS / MENSAGENS ──────────────────────────────────────
  ('MSG_ERRO_GENERICO',   'pt-BR', 'Ocorreu um erro. Tente novamente.'),
  ('MSG_ERRO_GENERICO',   'pt-PT', 'Ocorreu um erro. Tente novamente.'),
  ('MSG_ERRO_GENERICO',   'en-US', 'An error occurred. Please try again.'),
  ('MSG_ERRO_GENERICO',   'it-IT', 'Si è verificato un errore. Riprova.'),
  ('MSG_ERRO_GENERICO',   'es-ES', 'Ha ocurrido un error. Inténtelo de nuevo.'),
  ('MSG_ERRO_GENERICO',   'ar-MA', 'حدث خطأ. حاول مرة أخرى.'),

  ('MSG_SEM_DADOS',       'pt-BR', 'Sem dados para exibir.'),
  ('MSG_SEM_DADOS',       'pt-PT', 'Sem dados para mostrar.'),
  ('MSG_SEM_DADOS',       'en-US', 'No data to display.'),
  ('MSG_SEM_DADOS',       'it-IT', 'Nessun dato da visualizzare.'),
  ('MSG_SEM_DADOS',       'es-ES', 'Sin datos para mostrar.'),
  ('MSG_SEM_DADOS',       'ar-MA', 'لا توجد بيانات للعرض.')

) AS t(chave, codigo_idioma, valor) ON TRUE
JOIN idiomas i ON i.codigo = t.codigo_idioma
WHERE s.codigo = 'grupogk'
ON CONFLICT (chave, sistema_id, idioma_id) DO UPDATE SET valor = EXCLUDED.valor;
