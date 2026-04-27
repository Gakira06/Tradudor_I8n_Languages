"use strict";

const repo = require("../repositories/traducoes.repository");

// Idiomas escritos da direita para a esquerda
const RTL_LOCALES = new Set([
  "ar-MA",
  "ar-SA",
  "ar-EG",
  "he-IL",
  "fa-IR",
  "ur-PK",
]);

/**
 * GET /traducoes/:sistema/:idioma
 *
 * Retorna todas as traduções do sistema no idioma solicitado.
 * Aplica fallback para pt-BR quando uma chave não existir no idioma pedido.
 *
 * Resposta de sucesso:
 * {
 *   "idioma": "ar-MA",
 *   "direcao": "rtl",
 *   "traducoes": {
 *     "NAV_HOME": "الصفحة الرئيسية",
 *     "BTN_SEND": "إرسال"
 *   }
 * }
 */
async function listar(req, res, next) {
  try {
    const { sistema, idioma } = req.params;

    // Valida existência do sistema e do idioma
    const [sistemaObj, idiomaObj] = await Promise.all([
      repo.findSistema(sistema),
      repo.findIdioma(idioma),
    ]);

    if (!sistemaObj) {
      return res
        .status(404)
        .json({ erro: `Sistema '${sistema}' não encontrado ou inativo.` });
    }
    if (!idiomaObj) {
      return res
        .status(404)
        .json({ erro: `Idioma '${idioma}' não encontrado ou inativo.` });
    }

    // Busca traduções com lógica de fallback embutida no repositório
    const linhas = await repo.findComFallback(sistema, idioma);

    // Monta o objeto chave-valor final
    const traducoes = {};
    for (const linha of linhas) {
      traducoes[linha.chave] = linha.valor;
    }

    const direcao = RTL_LOCALES.has(idioma) ? "rtl" : idiomaObj.direcao;

    return res.status(200).json({
      idioma: idiomaObj.codigo,
      direcao,
      traducoes,
    });
  } catch (err) {
    next(err);
  }
}

/**
 * POST /traducoes
 *
 * Corpo esperado (application/json):
 * {
 *   "chave":   "BTN_CONFIRM",
 *   "valor":   "Confirmar",
 *   "sistema": "website",
 *   "idioma":  "pt-BR"
 * }
 *
 * Usa INSERT ... ON CONFLICT DO UPDATE, portanto serve tanto para
 * criar quanto para atualizar uma tradução existente.
 */
async function cadastrar(req, res, next) {
  try {
    const { chave, valor, sistema, idioma } = req.body;

    // Validação dos campos obrigatórios
    const camposFaltando = ["chave", "valor", "sistema", "idioma"].filter(
      (campo) => !req.body[campo] || String(req.body[campo]).trim() === "",
    );
    if (camposFaltando.length > 0) {
      return res.status(400).json({
        erro: "Campos obrigatórios ausentes ou vazios.",
        campos: camposFaltando,
      });
    }

    const registro = await repo.inserir({
      chave: chave.trim().toUpperCase(),
      valor: valor.trim(),
      codigoSistema: sistema.trim().toLowerCase(),
      codigoIdioma: idioma.trim(),
    });

    return res.status(201).json({
      mensagem: "Tradução cadastrada/atualizada com sucesso.",
      dado: registro,
    });
  } catch (err) {
    // Erros de negócio propagados pelo repositório (404)
    if (err.statusCode) {
      return res.status(err.statusCode).json({ erro: err.message });
    }
    next(err);
  }
}

module.exports = { listar, cadastrar };
