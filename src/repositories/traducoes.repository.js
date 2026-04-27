"use strict";

const db = require("../config/database");

// ---------------------------------------------------------
// Constante: idioma padrão de fallback
// ---------------------------------------------------------
const FALLBACK_LOCALE = "pt-BR";

/**
 * Busca todas as traduções de um sistema+idioma.
 * Retorna Array<{ chave, valor }>.
 */
async function findBySistemaEIdioma(codigoSistema, codigoIdioma) {
  const sql = `
    SELECT t.chave, t.valor
    FROM   traducoes   t
    JOIN   sistemas    s ON s.id = t.sistema_id
    JOIN   idiomas     i ON i.id = t.idioma_id
    WHERE  s.codigo = $1
      AND  i.codigo = $2
      AND  s.ativo  = TRUE
      AND  i.ativo  = TRUE
    ORDER BY t.chave
  `;
  const { rows } = await db.query(sql, [codigoSistema, codigoIdioma]);
  return rows;
}

/**
 * Busca os metadados do idioma (direcao, etc.).
 * Retorna o objeto ou null se não encontrado/inativo.
 */
async function findIdioma(codigo) {
  const sql = `
    SELECT id, codigo, nome, direcao
    FROM   idiomas
    WHERE  codigo = $1
      AND  ativo  = TRUE
  `;
  const { rows } = await db.query(sql, [codigo]);
  return rows[0] || null;
}

/**
 * Busca o sistema pelo código.
 * Retorna o objeto ou null se não encontrado/inativo.
 */
async function findSistema(codigo) {
  const sql = `
    SELECT id, codigo, nome
    FROM   sistemas
    WHERE  codigo = $1
      AND  ativo  = TRUE
  `;
  const { rows } = await db.query(sql, [codigo]);
  return rows[0] || null;
}

/**
 * Lógica de Fallback:
 *   1. Busca todas as chaves do idioma solicitado.
 *   2. Busca todas as chaves do idioma de fallback (pt-BR).
 *   3. Para cada chave do fallback que NÃO existe no idioma principal,
 *      inclui o valor do fallback — sinalizando a origem.
 *
 * Retorna Array<{ chave, valor, fallback: boolean }>.
 */
async function findComFallback(codigoSistema, codigoIdioma) {
  const [principais, reservas] = await Promise.all([
    findBySistemaEIdioma(codigoSistema, codigoIdioma),
    findBySistemaEIdioma(codigoSistema, FALLBACK_LOCALE),
  ]);

  // Mapa das chaves já encontradas no idioma principal
  const mapPrincipais = new Map(principais.map((r) => [r.chave, r.valor]));

  // Começa com todas as traduções do idioma principal
  const resultado = principais.map((r) => ({
    chave: r.chave,
    valor: r.valor,
    fallback: false,
  }));

  // Complementa com chaves do fallback que ainda não existem
  for (const r of reservas) {
    if (!mapPrincipais.has(r.chave)) {
      resultado.push({ chave: r.chave, valor: r.valor, fallback: true });
    }
  }

  return resultado.sort((a, b) => a.chave.localeCompare(b.chave));
}

/**
 * Insere uma nova tradução.
 * Lança erro se sistema ou idioma não existirem.
 */
async function inserir({ chave, valor, codigoSistema, codigoIdioma }) {
  // Valida sistema e idioma em paralelo
  const [sistema, idioma] = await Promise.all([
    findSistema(codigoSistema),
    findIdioma(codigoIdioma),
  ]);

  if (!sistema) {
    const err = new Error(
      `Sistema '${codigoSistema}' não encontrado ou inativo.`,
    );
    err.statusCode = 404;
    throw err;
  }
  if (!idioma) {
    const err = new Error(
      `Idioma '${codigoIdioma}' não encontrado ou inativo.`,
    );
    err.statusCode = 404;
    throw err;
  }

  const sql = `
    INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
    VALUES ($1, $2, $3, $4)
    ON CONFLICT (chave, sistema_id, idioma_id)
      DO UPDATE SET valor = EXCLUDED.valor, atualizado_em = NOW()
    RETURNING id, chave, valor, criado_em, atualizado_em
  `;
  const { rows } = await db.query(sql, [chave, valor, sistema.id, idioma.id]);
  return { ...rows[0], sistema: sistema.codigo, idioma: idioma.codigo };
}

module.exports = {
  findBySistemaEIdioma,
  findIdioma,
  findSistema,
  findComFallback,
  inserir,
  FALLBACK_LOCALE,
};
