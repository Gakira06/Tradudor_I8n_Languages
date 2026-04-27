/**
 * Lê o seed-website.sql, extrai todos os pares (chave, idioma, valor)
 * e insere via POST na API de tradução em produção.
 *
 * Uso: node seed-via-api.js
 */

const fs = require("fs");
const path = require("path");

const API_URL = "https://tradudor-i8n-languages.onrender.com";
const SISTEMA = "website";
const SQL_FILE = path.join(__dirname, "database", "seed-website.sql");

async function main() {
  const sql = fs.readFileSync(SQL_FILE, "utf8");

  // Extrai os blocos de VALUES: ('CHAVE', 'idioma', 'valor')
  // Suporta valores com aspas simples escapadas como ''
  const valuesBlockMatch = sql.match(/JOIN \(VALUES([\s\S]+?)\) AS t/);
  if (!valuesBlockMatch) {
    console.error("Não encontrei o bloco VALUES no SQL.");
    process.exit(1);
  }

  const valuesBlock = valuesBlockMatch[1];

  // Regex para extrair cada linha de VALUES
  // Captura: ('CHAVE', 'IDIOMA', 'VALOR')  onde VALOR pode conter ''
  const rowRegex =
    /\(\s*'([^']+)'\s*,\s*'([^']+)'\s*,\s*'((?:[^']|'')*)'\s*\)/g;

  const entries = [];
  let match;
  while ((match = rowRegex.exec(valuesBlock)) !== null) {
    const chave = match[1];
    const idioma = match[2];
    const valor = match[3].replace(/''/g, "'"); // unescape SQL ''
    entries.push({ chave, idioma, valor });
  }

  console.log(`Total de traduções encontradas: ${entries.length}`);

  let ok = 0;
  let errors = 0;

  for (const { chave, idioma, valor } of entries) {
    try {
      const res = await fetch(`${API_URL}/traducoes`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ chave, valor, sistema: SISTEMA, idioma }),
      });

      if (!res.ok) {
        const text = await res.text();
        console.error(`ERRO [${chave}][${idioma}]: ${res.status} ${text}`);
        errors++;
      } else {
        ok++;
        process.stdout.write(`\r✓ ${ok}/${entries.length} inseridas...`);
      }
    } catch (err) {
      console.error(`\nFALHA [${chave}][${idioma}]: ${err.message}`);
      errors++;
    }
  }

  console.log(`\n\nConcluído! ✓ ${ok} inseridas, ✗ ${errors} erros.`);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
