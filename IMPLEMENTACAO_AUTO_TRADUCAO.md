# Auto-Tradução de Produtos — Guia de Implementação

## 📋 Resumo

Implementamos um endpoint POST `/traducoes/produto-auto` que auto-traduz nome, descrição e categoria de produtos para os 6 idiomas suportados (pt-BR, pt-PT, en-US, it-IT, es-ES, ar-MA).

## 🔧 Como Funciona

### Backend (Tradutor API)

**Arquivo:** `tradutor/src/controllers/traducoes.controller.js`

**Função:** `catalogarProdutoAuto(req, res, next)`

**Endpoint:** `POST /traducoes/produto-auto`

**Payload:**

```json
{
  "productId": "cmo3itxfd000bet1wfzo492jp",
  "name": "Morango com nutella",
  "description": "Deliciosa pizza com morangos e nutella",
  "category": "Doce",
  "baseLocale": "pt-BR",
  "sistema": "website"
}
```

**Fluxo:**

1. Para cada um dos 6 idiomas, traduz nome/descrição usando **MyMemory** (padrão) ou **LibreTranslate** (se configurado)
2. Salva cada tradução no banco de dados via `repo.inserir()`
3. Retorna `{ success: true, resumo: {...}, dados: [...] }`

### Frontend Integration

**Arquivo:** `frontend/src/pages/AdminProductsPage.jsx`

**Fluxo:**

1. Admin cria/edita produto com modal
2. Seleciona idioma base ("pt-BR", "en-US", etc)
3. Clica "Salvar" → frontend faz POST para `/traducoes/produto-auto`
4. Servidor traduz e salva automaticamente
5. `refreshTranslations()` invalida cache local
6. UI atualiza imediatamente com novas traduções

## 🌍 Idiomas Suportados

| Código | Idioma               | Código Tradução |
| ------ | -------------------- | --------------- |
| pt-BR  | Português (Brasil)   | pt-BR           |
| pt-PT  | Português (Portugal) | pt-PT           |
| en-US  | Inglês (EUA)         | en              |
| it-IT  | Italiano             | it              |
| es-ES  | Espanhol             | es              |
| ar-MA  | Árabe (Marrocos)     | ar              |

## ⚙️ Configuração

### Opção 1: MyMemory (Padrão - Recomendado)

Nenhuma configuração necessária. O servidor usa automaticamente **MyMemory API** (gratuita, testada e confiável).

```bash
# Nenhuma variável de ambiente necessária
npm start
```

### Opção 2: LibreTranslate (Self-Hosted)

Se você quer instalar LibreTranslate localmente (melhor controle, sem rate-limits):

**1. Instalar com Docker:**

```bash
docker run -d \
  --name libretranslate \
  -p 5000:5000 \
  libretranslate/libretranslate:latest
```

**2. Configurar env var no `.env`:**

```env
LIBRETRANSLATE_URL=http://localhost:5000/translate
# LIBRETRANSLATE_API_KEY=sua_chave_opcional (se usar com autenticação)
```

**3. Reiniciar servidor:**

```bash
npm start
```

O servidor tentará LibreTranslate primeiro; se falhar, cai automaticamente para MyMemory.

## 🧪 Testando

### Via cURL

```bash
curl -X POST https://tradudor-i8n-languages.onrender.com/traducoes/produto-auto \
  -H "Content-Type: application/json" \
  -d '{
    "productId": "test-prod-001",
    "name": "Pizza Margherita",
    "description": "Clássica pizza italiana",
    "category": "Salgada",
    "baseLocale": "pt-BR",
    "sistema": "website"
  }'
```

### Via Frontend

1. Abra `AdminProductsPage` (Admin → Produtos)
2. Clique "Novo Produto"
3. Preencha nome, descrição, categoria
4. Selecione idioma base (ex: pt-BR)
5. Clique "Salvar"
6. Vá para `CardapioPage` e trocando de idioma → produto aparece traduzido

### Via Node.js (Script de Teste)

```javascript
const I18N_URL = "https://tradudor-i8n-languages.onrender.com";

fetch(`${I18N_URL}/traducoes/produto-auto`, {
  method: "POST",
  headers: { "Content-Type": "application/json" },
  body: JSON.stringify({
    productId: "pizza-margherita-001",
    name: "Pizza Margherita",
    description: "Classic Italian pizza",
    category: "Savory",
    baseLocale: "en-US",
    sistema: "website",
  }),
})
  .then((r) => r.json())
  .then((d) => console.log("Resultado:", d))
  .catch((e) => console.error("Erro:", e));
```

## 🚀 Deploy

### Production (Render/Heroku)

1. **Backend (Tradutor):**

   ```bash
   git push origin main
   # Render auto-deploya (via webhook)
   ```

2. **Frontend:**

   ```bash
   npm run build
   git push origin main
   # Vercel auto-deploya
   ```

3. **Variáveis de Ambiente (opcional):**
   - Se usar LibreTranslate self-hosted, adicione `LIBRETRANSLATE_URL` no painel da plataforma

## 📊 Resposta do Servidor

**Sucesso (201):**

```json
{
  "mensagem": "Traduções do produto cadastradas/atualizadas com sucesso.",
  "resumo": {
    "productId": "cmo3itxfd000bet1wfzo492jp",
    "baseLocale": "pt-BR",
    "idiomas": ["pt-BR", "pt-PT", "en-US", "it-IT", "es-ES", "ar-MA"],
    "totalSalvos": 12
  },
  "dados": [...]
}
```

**Erro (400):**

```json
{
  "erro": "Campo obrigatório ausente: productId"
}
```

## 🔄 Fluxo Completo

```
1. Admin abre AdminProductsPage
   ↓
2. Clica "Novo Produto" → abre modal
   ↓
3. Preenche: nome="Pizza Margherita", desc="...", category="Salgada"
   ↓
4. Seleciona baseLocale="pt-BR"
   ↓
5. Clica "Salvar" → saveProductTranslations() chama POST /traducoes/produto-auto
   ↓
6. Backend:
   a) Traduz nome para en, it, es, ar (mantém pt-BR e pt-PT original)
   b) Salva cada chave PRODUCT_{id}_NAME em cada idioma
   c) Retorna 201 com resumo
   ↓
7. Frontend:
   a) Mostra toast "✓ Produto salvo com sucesso"
   b) Chama refreshTranslations() → invalida cache i18n
   c) Se modal aberta, atualiza lista de produtos
   ↓
8. Cliente acessa CardapioPage → produto aparece em todas as 6 linguagens
```

## ⚠️ Notas Importantes

1. **Chaves normalizadas em UPPERCASE:** O banco de dados armazena `PRODUCT_CMO3ITXFD000BET1WFZO492JP_NAME` (uppercase). Frontend lê fallback (lowercase → uppercase).

2. **Timeout 10s:** Se tradução demorar >10s, retorna texto original (fallback seguro).

3. **Idioma base:** Se não especificar `baseLocale`, assume `pt-BR`.

4. **Categoria:** Se produto não tem categoria, cria chave `CAT_GERAL_*` para cada idioma.

5. **MyMemory rate-limit:** ~10 req/s por IP. Para alto volume, use LibreTranslate self-hosted.

## 📝 Próximas Passos

- [x] Implementar endpoint `/traducoes/produto-auto`
- [x] Integrar MyMemory + LibreTranslate fallback
- [ ] Deploy para produção (Render)
- [ ] Executar SQL de novas chaves no banco (KitchenPage, AdminMesasPage)
- [ ] Testar fluxo completo end-to-end

---

**Última atualização:** 28 de Abril de 2026
