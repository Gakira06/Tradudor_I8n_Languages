"use strict";

const { Pool } = require("pg");

/**
 * Pool de conexões com o PostgreSQL.
 * A lib 'pg' respeita automaticamente as variáveis de ambiente padrão do Postgres
 * (PGHOST, PGPORT, PGUSER, PGPASSWORD, PGDATABASE), mas aqui mapeamos
 * explicitamente para variáveis com prefixo DB_ para evitar colisões.
 */
const pool = new Pool({
  host: process.env.DB_HOST || "localhost",
  port: parseInt(process.env.DB_PORT || "5432", 10),
  database: process.env.DB_NAME || "i18n_db",
  user: process.env.DB_USER || "postgres",
  password: process.env.DB_PASSWORD || "",
  // Tamanho máximo do pool — ajuste conforme a carga esperada
  max: parseInt(process.env.DB_POOL_MAX || "10", 10),
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 5000,
});

// Log de erro em conexões ociosas (não mata o processo)
pool.on("error", (err) => {
  console.error("[DB] Erro inesperado em cliente ocioso:", err.message);
});

/**
 * Executa uma query parametrizada de forma segura.
 * @param {string} text   - SQL com placeholders $1, $2, ...
 * @param {Array}  params - Valores para os placeholders
 * @returns {Promise<import('pg').QueryResult>}
 */
async function query(text, params) {
  const start = Date.now();
  const result = await pool.query(text, params);
  const duration = Date.now() - start;
  if (process.env.NODE_ENV !== "production") {
    console.debug(
      `[DB] query executada em ${duration}ms | rows: ${result.rowCount}`,
    );
  }
  return result;
}

/**
 * Verifica se o banco está acessível.
 * Útil para health-checks e startup.
 */
async function checkConnection() {
  const client = await pool.connect();
  try {
    await client.query("SELECT 1");
    console.log("[DB] Conexão com PostgreSQL estabelecida com sucesso.");
  } finally {
    client.release();
  }
}

module.exports = { query, pool, checkConnection };
