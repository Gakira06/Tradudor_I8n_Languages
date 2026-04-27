-- =============================================================
-- I18n API — Dados Iniciais (Seed)
-- =============================================================

-- ---------------------------------------------------------
-- Idiomas suportados
-- ---------------------------------------------------------
INSERT INTO idiomas (codigo, nome, direcao) VALUES
    ('en-US', 'English (United States)',    'ltr'),
    ('it-IT', 'Italiano',                  'ltr'),
    ('pt-PT', 'Português (Portugal)',       'ltr'),
    ('pt-BR', 'Português (Brasil)',         'ltr'),
    ('es-ES', 'Español (España)',           'ltr'),
    ('ar-MA', 'العربية المغربية (Darija)',  'rtl')
ON CONFLICT (codigo) DO NOTHING;

-- ---------------------------------------------------------
-- Sistemas de exemplo
-- ---------------------------------------------------------
INSERT INTO sistemas (codigo, nome, descricao) VALUES
    ('website',       'Website Principal',    'Portal público da aplicação'),
    ('app-mobile',    'Aplicativo Mobile',    'App iOS e Android'),
    ('painel-admin',  'Painel Administrativo','Backoffice interno')
ON CONFLICT (codigo) DO NOTHING;

-- ---------------------------------------------------------
-- Traduções de exemplo para o sistema 'website'
-- ---------------------------------------------------------
WITH
    s AS (SELECT id FROM sistemas WHERE codigo = 'website'),
    -- Inglês
    en AS (SELECT id FROM idiomas WHERE codigo = 'en-US'),
    -- Italiano
    it AS (SELECT id FROM idiomas WHERE codigo = 'it-IT'),
    -- Português PT
    ptpt AS (SELECT id FROM idiomas WHERE codigo = 'pt-PT'),
    -- Português BR (idioma padrão de fallback)
    ptbr AS (SELECT id FROM idiomas WHERE codigo = 'pt-BR'),
    -- Espanhol
    es AS (SELECT id FROM idiomas WHERE codigo = 'es-ES')
    -- Árabe Marroquino — sem traduções propositalmente para demonstrar o fallback
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id) VALUES
    -- en-US
    ('NAV_HOME',    'Home',         (SELECT id FROM s), (SELECT id FROM en)),
    ('BTN_CONFIRM', 'Confirm',      (SELECT id FROM s), (SELECT id FROM en)),
    ('BTN_CANCEL',  'Cancel',       (SELECT id FROM s), (SELECT id FROM en)),
    ('BTN_SEND',    'Send',         (SELECT id FROM s), (SELECT id FROM en)),
    ('WELCOME',     'Welcome',      (SELECT id FROM s), (SELECT id FROM en)),
    -- it-IT
    ('NAV_HOME',    'Home',         (SELECT id FROM s), (SELECT id FROM it)),
    ('BTN_CONFIRM', 'Conferma',     (SELECT id FROM s), (SELECT id FROM it)),
    ('BTN_CANCEL',  'Annulla',      (SELECT id FROM s), (SELECT id FROM it)),
    ('BTN_SEND',    'Invia',        (SELECT id FROM s), (SELECT id FROM it)),
    ('WELCOME',     'Benvenuto',    (SELECT id FROM s), (SELECT id FROM it)),
    -- pt-PT
    ('NAV_HOME',    'Início',       (SELECT id FROM s), (SELECT id FROM ptpt)),
    ('BTN_CONFIRM', 'Confirmar',    (SELECT id FROM s), (SELECT id FROM ptpt)),
    ('BTN_CANCEL',  'Cancelar',     (SELECT id FROM s), (SELECT id FROM ptpt)),
    ('BTN_SEND',    'Enviar',       (SELECT id FROM s), (SELECT id FROM ptpt)),
    ('WELCOME',     'Bem-vindo',    (SELECT id FROM s), (SELECT id FROM ptpt)),
    -- pt-BR (idioma padrão de fallback)
    ('NAV_HOME',    'Início',       (SELECT id FROM s), (SELECT id FROM ptbr)),
    ('BTN_CONFIRM', 'Confirmar',    (SELECT id FROM s), (SELECT id FROM ptbr)),
    ('BTN_CANCEL',  'Cancelar',     (SELECT id FROM s), (SELECT id FROM ptbr)),
    ('BTN_SEND',    'Enviar',       (SELECT id FROM s), (SELECT id FROM ptbr)),
    ('WELCOME',     'Bem-vindo',    (SELECT id FROM s), (SELECT id FROM ptbr)),
    -- es-ES
    ('NAV_HOME',    'Inicio',       (SELECT id FROM s), (SELECT id FROM es)),
    ('BTN_CONFIRM', 'Confirmar',    (SELECT id FROM s), (SELECT id FROM es)),
    ('BTN_CANCEL',  'Cancelar',     (SELECT id FROM s), (SELECT id FROM es)),
    ('BTN_SEND',    'Enviar',       (SELECT id FROM s), (SELECT id FROM es)),
    ('WELCOME',     'Bienvenido',   (SELECT id FROM s), (SELECT id FROM es))
    -- ar-MA: sem traduções — o fallback para pt-BR será acionado na API
ON CONFLICT (chave, sistema_id, idioma_id) DO NOTHING;

-- Apenas duas chaves em árabe para demonstrar coexistência com fallback parcial
INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT
    'NAV_HOME',
    'الصفحة الرئيسية',
    s.id,
    i.id
FROM sistemas s, idiomas i
WHERE s.codigo = 'website' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO NOTHING;

INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT
    'BTN_SEND',
    'إرسال',
    s.id,
    i.id
FROM sistemas s, idiomas i
WHERE s.codigo = 'website' AND i.codigo = 'ar-MA'
ON CONFLICT (chave, sistema_id, idioma_id) DO NOTHING;
