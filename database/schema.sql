-- =============================================================
-- I18n API — Schema do Banco de Dados
-- PostgreSQL com suporte completo a UTF-8 (incluindo árabe RTL)
-- =============================================================

-- Garante que o banco usa UTF-8
-- (configurado no nível do cluster/banco; este comentário é um lembrete)
-- CREATE DATABASE i18n_db WITH ENCODING 'UTF8' LC_COLLATE='en_US.UTF-8' LC_CTYPE='en_US.UTF-8';

-- Extensão para geração de UUIDs
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ---------------------------------------------------------
-- 1. TABELA: sistemas
--    Representa cada sistema/contexto que consome traduções
--    Ex: 'website', 'app-mobile', 'painel-admin'
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS sistemas (
    id          UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
    codigo      VARCHAR(50) NOT NULL UNIQUE,   -- slug único: 'website', 'app-mobile'
    nome        VARCHAR(100) NOT NULL,
    descricao   TEXT,
    ativo       BOOLEAN     NOT NULL DEFAULT TRUE,
    criado_em   TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    atualizado_em TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ---------------------------------------------------------
-- 2. TABELA: idiomas
--    Registro canônico de cada locale suportado
--    O campo 'direcao' controla RTL/LTR no frontend
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS idiomas (
    id          UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
    codigo      VARCHAR(10) NOT NULL UNIQUE,   -- BCP-47: 'pt-BR', 'ar-MA'
    nome        VARCHAR(100) NOT NULL,
    direcao     VARCHAR(3)  NOT NULL DEFAULT 'ltr' CHECK (direcao IN ('ltr', 'rtl')),
    ativo       BOOLEAN     NOT NULL DEFAULT TRUE,
    criado_em   TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ---------------------------------------------------------
-- 3. TABELA: traducoes
--    Relaciona chave de tradução + sistema + idioma → valor
--    O campo 'valor' é TEXT para suportar qualquer comprimento
--    e qualquer script Unicode (árabe, CJK, etc.)
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS traducoes (
    id          UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
    chave       VARCHAR(200) NOT NULL,         -- ex: 'BTN_CONFIRM', 'NAV_HOME'
    valor       TEXT        NOT NULL,          -- texto traduzido (UTF-8 full)
    sistema_id  UUID        NOT NULL REFERENCES sistemas(id)  ON DELETE CASCADE,
    idioma_id   UUID        NOT NULL REFERENCES idiomas(id)   ON DELETE RESTRICT,
    criado_em   TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    atualizado_em TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    -- Garante unicidade: uma chave por sistema+idioma
    CONSTRAINT uq_traducao UNIQUE (chave, sistema_id, idioma_id)
);

-- ---------------------------------------------------------
-- Índices para performance nas consultas mais comuns
-- ---------------------------------------------------------
CREATE INDEX IF NOT EXISTS idx_traducoes_sistema_idioma
    ON traducoes (sistema_id, idioma_id);

CREATE INDEX IF NOT EXISTS idx_traducoes_chave
    ON traducoes (chave);

CREATE INDEX IF NOT EXISTS idx_sistemas_codigo
    ON sistemas (codigo);

CREATE INDEX IF NOT EXISTS idx_idiomas_codigo
    ON idiomas (codigo);

-- ---------------------------------------------------------
-- Trigger: atualiza 'atualizado_em' automaticamente
-- ---------------------------------------------------------
CREATE OR REPLACE FUNCTION fn_set_atualizado_em()
RETURNS TRIGGER AS $$
BEGIN
    NEW.atualizado_em = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_sistemas_atualizado_em
    BEFORE UPDATE ON sistemas
    FOR EACH ROW EXECUTE FUNCTION fn_set_atualizado_em();

CREATE OR REPLACE TRIGGER trg_traducoes_atualizado_em
    BEFORE UPDATE ON traducoes
    FOR EACH ROW EXECUTE FUNCTION fn_set_atualizado_em();
