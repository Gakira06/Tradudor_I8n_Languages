"use strict";

require("dotenv").config();

const app = require("./src/app");
const { checkConnection } = require("./src/config/database");

const PORT = parseInt(process.env.PORT || "3000", 10);

async function start() {
  // Verifica conexão com o banco antes de aceitar requisições
  await checkConnection();

  app.listen(PORT, () => {
    console.log(`[SERVER] I18n API rodando em http://localhost:${PORT}`);
    console.log(`[SERVER] Ambiente: ${process.env.NODE_ENV || "development"}`);
  });
}

start().catch((err) => {
  console.error("[SERVER] Falha ao iniciar a aplicação:", err.message);
  process.exit(1);
});
