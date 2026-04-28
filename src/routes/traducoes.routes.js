"use strict";

const { Router } = require("express");
const controller = require("../controllers/traducoes.controller");

const router = Router();

/**
 * POST /traducoes
 * Cadastra ou atualiza uma tradução.
 */
router.post("/", controller.cadastrar);

/**
 * POST /traducoes/produto-auto
 * Traduz e salva nome/descrição/categoria do produto para todos os idiomas.
 */
router.post("/produto-auto", controller.cadastrarProdutoAuto);

/**
 * GET /traducoes/:sistema/:idioma
 * Retorna todas as traduções de um sistema no idioma solicitado,
 * com fallback automático para pt-BR quando necessário.
 *
 * Exemplos:
 *   GET /traducoes/website/pt-BR
 *   GET /traducoes/website/ar-MA
 */
router.get("/:sistema/:idioma", controller.listar);

module.exports = router;
