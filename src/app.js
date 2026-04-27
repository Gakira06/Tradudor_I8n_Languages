"use strict";

const express = require("express");
const traducoesRoutes = require("./routes/traducoes.routes");
const errorHandler = require("./middlewares/errorHandler");

const app = express();

// ---------------------------------------------------------
// Middlewares globais
// ---------------------------------------------------------

// Parse de JSON — limita o tamanho para evitar payloads gigantes
app.use(express.json({ limit: "1mb" }));

// Cabeçalhos de segurança mínimos
app.use((_req, res, next) => {
  res.setHeader("X-Content-Type-Options", "nosniff");
  res.setHeader("X-Frame-Options", "DENY");
  res.setHeader("X-XSS-Protection", "1; mode=block");
  next();
});

// ---------------------------------------------------------
// Health-check — não precisa de autenticação
// ---------------------------------------------------------
app.get("/health", (_req, res) => {
  res.status(200).json({ status: "ok", timestamp: new Date().toISOString() });
});

// ---------------------------------------------------------
// Rotas da API
// ---------------------------------------------------------
app.use("/traducoes", traducoesRoutes);

// Rota não encontrada
app.use((_req, res) => {
  res.status(404).json({ erro: "Rota não encontrada." });
});

// ---------------------------------------------------------
// Tratamento de erros (deve ser o último middleware)
// ---------------------------------------------------------
app.use(errorHandler);

module.exports = app;
