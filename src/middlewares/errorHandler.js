"use strict";

/**
 * Middleware de tratamento centralizado de erros.
 * Deve ser registrado APÓS todas as rotas no app.js.
 */
function errorHandler(err, req, res, _next) {
  // Erros do driver PostgreSQL
  if ((err.code && err.code.startsWith("2")) || err.code === "23505") {
    return res.status(409).json({
      erro: "Conflito de dados no banco.",
      detalhe: err.detail || err.message,
    });
  }

  const statusCode = err.statusCode || 500;
  const mensagem =
    statusCode === 500 ? "Erro interno do servidor." : err.message;

  if (statusCode === 500) {
    console.error("[ERRO]", err);
  }

  return res.status(statusCode).json({ erro: mensagem });
}

module.exports = errorHandler;
