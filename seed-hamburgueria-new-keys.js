/**
 * Insere via API as chaves novas do frontendHamburgueria que ainda
 * não estavam no banco de traduções.
 *
 * Uso: node seed-hamburgueria-new-keys.js
 */

const API_URL = "https://tradudor-i8n-languages.onrender.com";
const SISTEMA = "website";

const entries = [
  // ─── HOME ─────────────────────────────────────────────────────────────────
  {
    chave: "HOME_TAGLINE",
    idioma: "pt-BR",
    valor: "Feito na hora · Ingredientes premium",
  },
  {
    chave: "HOME_TAGLINE",
    idioma: "pt-PT",
    valor: "Feito na hora · Ingredientes premium",
  },
  {
    chave: "HOME_TAGLINE",
    idioma: "en-US",
    valor: "Made fresh · Premium ingredients",
  },
  {
    chave: "HOME_TAGLINE",
    idioma: "it-IT",
    valor: "Fatto al momento · Ingredienti premium",
  },
  {
    chave: "HOME_TAGLINE",
    idioma: "es-ES",
    valor: "Hecho al momento · Ingredientes premium",
  },
  {
    chave: "HOME_TAGLINE",
    idioma: "ar-MA",
    valor: "مصنوع طازج · مكونات ممتازة",
  },

  // ─── CLIENT DASHBOARD ─────────────────────────────────────────────────────
  { chave: "CLIENT_DASHBOARD_ITEM", idioma: "pt-BR", valor: "Item" },
  { chave: "CLIENT_DASHBOARD_ITEM", idioma: "pt-PT", valor: "Item" },
  { chave: "CLIENT_DASHBOARD_ITEM", idioma: "en-US", valor: "Item" },
  { chave: "CLIENT_DASHBOARD_ITEM", idioma: "it-IT", valor: "Articolo" },
  { chave: "CLIENT_DASHBOARD_ITEM", idioma: "es-ES", valor: "Artículo" },
  { chave: "CLIENT_DASHBOARD_ITEM", idioma: "ar-MA", valor: "عنصر" },

  // ─── ADMIN HISTORY ────────────────────────────────────────────────────────
  { chave: "ADMIN_HISTORY_ITEM", idioma: "pt-BR", valor: "Item" },
  { chave: "ADMIN_HISTORY_ITEM", idioma: "pt-PT", valor: "Item" },
  { chave: "ADMIN_HISTORY_ITEM", idioma: "en-US", valor: "Item" },
  { chave: "ADMIN_HISTORY_ITEM", idioma: "it-IT", valor: "Articolo" },
  { chave: "ADMIN_HISTORY_ITEM", idioma: "es-ES", valor: "Artículo" },
  { chave: "ADMIN_HISTORY_ITEM", idioma: "ar-MA", valor: "عنصر" },

  // ─── ADMIN PRODUCTS ───────────────────────────────────────────────────────
  { chave: "ADMIN_PRODUCTS_STOCK", idioma: "pt-BR", valor: "Estoque" },
  { chave: "ADMIN_PRODUCTS_STOCK", idioma: "pt-PT", valor: "Stock" },
  { chave: "ADMIN_PRODUCTS_STOCK", idioma: "en-US", valor: "Stock" },
  { chave: "ADMIN_PRODUCTS_STOCK", idioma: "it-IT", valor: "Scorte" },
  { chave: "ADMIN_PRODUCTS_STOCK", idioma: "es-ES", valor: "Stock" },
  { chave: "ADMIN_PRODUCTS_STOCK", idioma: "ar-MA", valor: "المخزون" },

  {
    chave: "ADMIN_PRODUCTS_BASE_LANGUAGE",
    idioma: "pt-BR",
    valor: "Idioma base",
  },
  {
    chave: "ADMIN_PRODUCTS_BASE_LANGUAGE",
    idioma: "pt-PT",
    valor: "Idioma base",
  },
  {
    chave: "ADMIN_PRODUCTS_BASE_LANGUAGE",
    idioma: "en-US",
    valor: "Base language",
  },
  {
    chave: "ADMIN_PRODUCTS_BASE_LANGUAGE",
    idioma: "it-IT",
    valor: "Lingua base",
  },
  {
    chave: "ADMIN_PRODUCTS_BASE_LANGUAGE",
    idioma: "es-ES",
    valor: "Idioma base",
  },
  {
    chave: "ADMIN_PRODUCTS_BASE_LANGUAGE",
    idioma: "ar-MA",
    valor: "اللغة الأساسية",
  },

  {
    chave: "ADMIN_PRODUCTS_REAPPLY_TRANSLATION",
    idioma: "pt-BR",
    valor: "Reaplicar tradução",
  },
  {
    chave: "ADMIN_PRODUCTS_REAPPLY_TRANSLATION",
    idioma: "pt-PT",
    valor: "Reaplicar tradução",
  },
  {
    chave: "ADMIN_PRODUCTS_REAPPLY_TRANSLATION",
    idioma: "en-US",
    valor: "Reapply translation",
  },
  {
    chave: "ADMIN_PRODUCTS_REAPPLY_TRANSLATION",
    idioma: "it-IT",
    valor: "Riapplica traduzione",
  },
  {
    chave: "ADMIN_PRODUCTS_REAPPLY_TRANSLATION",
    idioma: "es-ES",
    valor: "Reaplicar traducción",
  },
  {
    chave: "ADMIN_PRODUCTS_REAPPLY_TRANSLATION",
    idioma: "ar-MA",
    valor: "إعادة تطبيق الترجمة",
  },

  {
    chave: "ADMIN_PRODUCTS_REAPPLY_TRANSLATION_LOADING",
    idioma: "pt-BR",
    valor: "Reaplicando...",
  },
  {
    chave: "ADMIN_PRODUCTS_REAPPLY_TRANSLATION_LOADING",
    idioma: "pt-PT",
    valor: "Reaplicando...",
  },
  {
    chave: "ADMIN_PRODUCTS_REAPPLY_TRANSLATION_LOADING",
    idioma: "en-US",
    valor: "Reapplying...",
  },
  {
    chave: "ADMIN_PRODUCTS_REAPPLY_TRANSLATION_LOADING",
    idioma: "it-IT",
    valor: "Riapplicando...",
  },
  {
    chave: "ADMIN_PRODUCTS_REAPPLY_TRANSLATION_LOADING",
    idioma: "es-ES",
    valor: "Reaplicando...",
  },
  {
    chave: "ADMIN_PRODUCTS_REAPPLY_TRANSLATION_LOADING",
    idioma: "ar-MA",
    valor: "جاري إعادة التطبيق...",
  },

  // ─── ADMIN MESAS ──────────────────────────────────────────────────────────
  { chave: "ADMIN_MESAS_CANCEL", idioma: "pt-BR", valor: "Cancelar" },
  { chave: "ADMIN_MESAS_CANCEL", idioma: "pt-PT", valor: "Cancelar" },
  { chave: "ADMIN_MESAS_CANCEL", idioma: "en-US", valor: "Cancel" },
  { chave: "ADMIN_MESAS_CANCEL", idioma: "it-IT", valor: "Annulla" },
  { chave: "ADMIN_MESAS_CANCEL", idioma: "es-ES", valor: "Cancelar" },
  { chave: "ADMIN_MESAS_CANCEL", idioma: "ar-MA", valor: "إلغاء" },

  {
    chave: "ADMIN_MESAS_CREATED",
    idioma: "pt-BR",
    valor: "Mesa criada com sucesso!",
  },
  {
    chave: "ADMIN_MESAS_CREATED",
    idioma: "pt-PT",
    valor: "Mesa criada com sucesso!",
  },
  {
    chave: "ADMIN_MESAS_CREATED",
    idioma: "en-US",
    valor: "Table created successfully!",
  },
  {
    chave: "ADMIN_MESAS_CREATED",
    idioma: "it-IT",
    valor: "Tavolo creato con successo!",
  },
  {
    chave: "ADMIN_MESAS_CREATED",
    idioma: "es-ES",
    valor: "¡Mesa creada con éxito!",
  },
  {
    chave: "ADMIN_MESAS_CREATED",
    idioma: "ar-MA",
    valor: "تم إنشاء الطاولة بنجاح!",
  },

  { chave: "ADMIN_MESAS_EDIT_BUTTON", idioma: "pt-BR", valor: "Editar" },
  { chave: "ADMIN_MESAS_EDIT_BUTTON", idioma: "pt-PT", valor: "Editar" },
  { chave: "ADMIN_MESAS_EDIT_BUTTON", idioma: "en-US", valor: "Edit" },
  { chave: "ADMIN_MESAS_EDIT_BUTTON", idioma: "it-IT", valor: "Modifica" },
  { chave: "ADMIN_MESAS_EDIT_BUTTON", idioma: "es-ES", valor: "Editar" },
  { chave: "ADMIN_MESAS_EDIT_BUTTON", idioma: "ar-MA", valor: "تعديل" },

  {
    chave: "ADMIN_MESAS_ERROR_NAME",
    idioma: "pt-BR",
    valor: "O nome da mesa é obrigatório.",
  },
  {
    chave: "ADMIN_MESAS_ERROR_NAME",
    idioma: "pt-PT",
    valor: "O nome da mesa é obrigatório.",
  },
  {
    chave: "ADMIN_MESAS_ERROR_NAME",
    idioma: "en-US",
    valor: "Table name is required.",
  },
  {
    chave: "ADMIN_MESAS_ERROR_NAME",
    idioma: "it-IT",
    valor: "Il nome del tavolo è obbligatorio.",
  },
  {
    chave: "ADMIN_MESAS_ERROR_NAME",
    idioma: "es-ES",
    valor: "El nombre de la mesa es obligatorio.",
  },
  {
    chave: "ADMIN_MESAS_ERROR_NAME",
    idioma: "ar-MA",
    valor: "اسم الطاولة مطلوب.",
  },

  {
    chave: "ADMIN_MESAS_ERROR_NUMBER",
    idioma: "pt-BR",
    valor: "O número da mesa é obrigatório.",
  },
  {
    chave: "ADMIN_MESAS_ERROR_NUMBER",
    idioma: "pt-PT",
    valor: "O número da mesa é obrigatório.",
  },
  {
    chave: "ADMIN_MESAS_ERROR_NUMBER",
    idioma: "en-US",
    valor: "Table number is required.",
  },
  {
    chave: "ADMIN_MESAS_ERROR_NUMBER",
    idioma: "it-IT",
    valor: "Il numero del tavolo è obbligatorio.",
  },
  {
    chave: "ADMIN_MESAS_ERROR_NUMBER",
    idioma: "es-ES",
    valor: "El número de la mesa es obligatorio.",
  },
  {
    chave: "ADMIN_MESAS_ERROR_NUMBER",
    idioma: "ar-MA",
    valor: "رقم الطاولة مطلوب.",
  },

  {
    chave: "ADMIN_MESAS_ERROR_SAVE",
    idioma: "pt-BR",
    valor: "Erro ao salvar mesa.",
  },
  {
    chave: "ADMIN_MESAS_ERROR_SAVE",
    idioma: "pt-PT",
    valor: "Erro ao guardar mesa.",
  },
  {
    chave: "ADMIN_MESAS_ERROR_SAVE",
    idioma: "en-US",
    valor: "Error saving table.",
  },
  {
    chave: "ADMIN_MESAS_ERROR_SAVE",
    idioma: "it-IT",
    valor: "Errore durante il salvataggio del tavolo.",
  },
  {
    chave: "ADMIN_MESAS_ERROR_SAVE",
    idioma: "es-ES",
    valor: "Error al guardar mesa.",
  },
  {
    chave: "ADMIN_MESAS_ERROR_SAVE",
    idioma: "ar-MA",
    valor: "خطأ في حفظ الطاولة.",
  },

  {
    chave: "ADMIN_MESAS_FORM_NAME_LABEL",
    idioma: "pt-BR",
    valor: "Nome da mesa",
  },
  {
    chave: "ADMIN_MESAS_FORM_NAME_LABEL",
    idioma: "pt-PT",
    valor: "Nome da mesa",
  },
  {
    chave: "ADMIN_MESAS_FORM_NAME_LABEL",
    idioma: "en-US",
    valor: "Table name",
  },
  {
    chave: "ADMIN_MESAS_FORM_NAME_LABEL",
    idioma: "it-IT",
    valor: "Nome del tavolo",
  },
  {
    chave: "ADMIN_MESAS_FORM_NAME_LABEL",
    idioma: "es-ES",
    valor: "Nombre de la mesa",
  },
  {
    chave: "ADMIN_MESAS_FORM_NAME_LABEL",
    idioma: "ar-MA",
    valor: "اسم الطاولة",
  },

  {
    chave: "ADMIN_MESAS_FORM_NAME_PH",
    idioma: "pt-BR",
    valor: "Ex: Mesa do canto",
  },
  {
    chave: "ADMIN_MESAS_FORM_NAME_PH",
    idioma: "pt-PT",
    valor: "Ex: Mesa do canto",
  },
  {
    chave: "ADMIN_MESAS_FORM_NAME_PH",
    idioma: "en-US",
    valor: "E.g.: Corner table",
  },
  {
    chave: "ADMIN_MESAS_FORM_NAME_PH",
    idioma: "it-IT",
    valor: "Es: Tavolo d'angolo",
  },
  {
    chave: "ADMIN_MESAS_FORM_NAME_PH",
    idioma: "es-ES",
    valor: "Ej: Mesa del rincón",
  },
  {
    chave: "ADMIN_MESAS_FORM_NAME_PH",
    idioma: "ar-MA",
    valor: "مثال: طاولة الزاوية",
  },

  {
    chave: "ADMIN_MESAS_FORM_NUMBER_LABEL",
    idioma: "pt-BR",
    valor: "Número da mesa",
  },
  {
    chave: "ADMIN_MESAS_FORM_NUMBER_LABEL",
    idioma: "pt-PT",
    valor: "Número da mesa",
  },
  {
    chave: "ADMIN_MESAS_FORM_NUMBER_LABEL",
    idioma: "en-US",
    valor: "Table number",
  },
  {
    chave: "ADMIN_MESAS_FORM_NUMBER_LABEL",
    idioma: "it-IT",
    valor: "Numero del tavolo",
  },
  {
    chave: "ADMIN_MESAS_FORM_NUMBER_LABEL",
    idioma: "es-ES",
    valor: "Número de mesa",
  },
  {
    chave: "ADMIN_MESAS_FORM_NUMBER_LABEL",
    idioma: "ar-MA",
    valor: "رقم الطاولة",
  },

  {
    chave: "ADMIN_MESAS_FORM_TITLE_EDIT",
    idioma: "pt-BR",
    valor: "Editar mesa",
  },
  {
    chave: "ADMIN_MESAS_FORM_TITLE_EDIT",
    idioma: "pt-PT",
    valor: "Editar mesa",
  },
  {
    chave: "ADMIN_MESAS_FORM_TITLE_EDIT",
    idioma: "en-US",
    valor: "Edit table",
  },
  {
    chave: "ADMIN_MESAS_FORM_TITLE_EDIT",
    idioma: "it-IT",
    valor: "Modifica tavolo",
  },
  {
    chave: "ADMIN_MESAS_FORM_TITLE_EDIT",
    idioma: "es-ES",
    valor: "Editar mesa",
  },
  {
    chave: "ADMIN_MESAS_FORM_TITLE_EDIT",
    idioma: "ar-MA",
    valor: "تعديل الطاولة",
  },

  { chave: "ADMIN_MESAS_FORM_TITLE_NEW", idioma: "pt-BR", valor: "Nova mesa" },
  { chave: "ADMIN_MESAS_FORM_TITLE_NEW", idioma: "pt-PT", valor: "Nova mesa" },
  { chave: "ADMIN_MESAS_FORM_TITLE_NEW", idioma: "en-US", valor: "New table" },
  {
    chave: "ADMIN_MESAS_FORM_TITLE_NEW",
    idioma: "it-IT",
    valor: "Nuovo tavolo",
  },
  { chave: "ADMIN_MESAS_FORM_TITLE_NEW", idioma: "es-ES", valor: "Nueva mesa" },
  {
    chave: "ADMIN_MESAS_FORM_TITLE_NEW",
    idioma: "ar-MA",
    valor: "طاولة جديدة",
  },

  { chave: "ADMIN_MESAS_INACTIVE", idioma: "pt-BR", valor: "Inativa" },
  { chave: "ADMIN_MESAS_INACTIVE", idioma: "pt-PT", valor: "Inativa" },
  { chave: "ADMIN_MESAS_INACTIVE", idioma: "en-US", valor: "Inactive" },
  { chave: "ADMIN_MESAS_INACTIVE", idioma: "it-IT", valor: "Inattivo" },
  { chave: "ADMIN_MESAS_INACTIVE", idioma: "es-ES", valor: "Inactiva" },
  { chave: "ADMIN_MESAS_INACTIVE", idioma: "ar-MA", valor: "غير نشطة" },

  {
    chave: "ADMIN_MESAS_NEW_QR_BUTTON",
    idioma: "pt-BR",
    valor: "Novo QR Code",
  },
  {
    chave: "ADMIN_MESAS_NEW_QR_BUTTON",
    idioma: "pt-PT",
    valor: "Novo QR Code",
  },
  { chave: "ADMIN_MESAS_NEW_QR_BUTTON", idioma: "en-US", valor: "New QR Code" },
  {
    chave: "ADMIN_MESAS_NEW_QR_BUTTON",
    idioma: "it-IT",
    valor: "Nuovo QR Code",
  },
  {
    chave: "ADMIN_MESAS_NEW_QR_BUTTON",
    idioma: "es-ES",
    valor: "Nuevo QR Code",
  },
  { chave: "ADMIN_MESAS_NEW_QR_BUTTON", idioma: "ar-MA", valor: "رمز QR جديد" },

  { chave: "ADMIN_MESAS_NO_TERMINAL", idioma: "pt-BR", valor: "Sem terminal" },
  { chave: "ADMIN_MESAS_NO_TERMINAL", idioma: "pt-PT", valor: "Sem terminal" },
  { chave: "ADMIN_MESAS_NO_TERMINAL", idioma: "en-US", valor: "No terminal" },
  {
    chave: "ADMIN_MESAS_NO_TERMINAL",
    idioma: "it-IT",
    valor: "Nessun terminale",
  },
  { chave: "ADMIN_MESAS_NO_TERMINAL", idioma: "es-ES", valor: "Sin terminal" },
  { chave: "ADMIN_MESAS_NO_TERMINAL", idioma: "ar-MA", valor: "بدون طرفية" },

  { chave: "ADMIN_MESAS_PRINT", idioma: "pt-BR", valor: "Imprimir" },
  { chave: "ADMIN_MESAS_PRINT", idioma: "pt-PT", valor: "Imprimir" },
  { chave: "ADMIN_MESAS_PRINT", idioma: "en-US", valor: "Print" },
  { chave: "ADMIN_MESAS_PRINT", idioma: "it-IT", valor: "Stampa" },
  { chave: "ADMIN_MESAS_PRINT", idioma: "es-ES", valor: "Imprimir" },
  { chave: "ADMIN_MESAS_PRINT", idioma: "ar-MA", valor: "طباعة" },

  { chave: "ADMIN_MESAS_QR_BUTTON", idioma: "pt-BR", valor: "Ver QR Code" },
  { chave: "ADMIN_MESAS_QR_BUTTON", idioma: "pt-PT", valor: "Ver QR Code" },
  { chave: "ADMIN_MESAS_QR_BUTTON", idioma: "en-US", valor: "View QR Code" },
  { chave: "ADMIN_MESAS_QR_BUTTON", idioma: "it-IT", valor: "Vedi QR Code" },
  { chave: "ADMIN_MESAS_QR_BUTTON", idioma: "es-ES", valor: "Ver QR Code" },
  { chave: "ADMIN_MESAS_QR_BUTTON", idioma: "ar-MA", valor: "عرض رمز QR" },

  {
    chave: "ADMIN_MESAS_QR_ERROR",
    idioma: "pt-BR",
    valor: "Erro ao gerar QR Code.",
  },
  {
    chave: "ADMIN_MESAS_QR_ERROR",
    idioma: "pt-PT",
    valor: "Erro ao gerar QR Code.",
  },
  {
    chave: "ADMIN_MESAS_QR_ERROR",
    idioma: "en-US",
    valor: "Error generating QR Code.",
  },
  {
    chave: "ADMIN_MESAS_QR_ERROR",
    idioma: "it-IT",
    valor: "Errore nella generazione del QR Code.",
  },
  {
    chave: "ADMIN_MESAS_QR_ERROR",
    idioma: "es-ES",
    valor: "Error al generar QR Code.",
  },
  {
    chave: "ADMIN_MESAS_QR_ERROR",
    idioma: "ar-MA",
    valor: "خطأ في إنشاء رمز QR.",
  },

  {
    chave: "ADMIN_MESAS_QR_GENERATED",
    idioma: "pt-BR",
    valor: "QR Code gerado!",
  },
  {
    chave: "ADMIN_MESAS_QR_GENERATED",
    idioma: "pt-PT",
    valor: "QR Code gerado!",
  },
  {
    chave: "ADMIN_MESAS_QR_GENERATED",
    idioma: "en-US",
    valor: "QR Code generated!",
  },
  {
    chave: "ADMIN_MESAS_QR_GENERATED",
    idioma: "it-IT",
    valor: "QR Code generato!",
  },
  {
    chave: "ADMIN_MESAS_QR_GENERATED",
    idioma: "es-ES",
    valor: "¡QR Code generado!",
  },
  {
    chave: "ADMIN_MESAS_QR_GENERATED",
    idioma: "ar-MA",
    valor: "تم إنشاء رمز QR!",
  },

  { chave: "ADMIN_MESAS_REMOVE_BUTTON", idioma: "pt-BR", valor: "Remover" },
  { chave: "ADMIN_MESAS_REMOVE_BUTTON", idioma: "pt-PT", valor: "Remover" },
  { chave: "ADMIN_MESAS_REMOVE_BUTTON", idioma: "en-US", valor: "Remove" },
  { chave: "ADMIN_MESAS_REMOVE_BUTTON", idioma: "it-IT", valor: "Rimuovi" },
  { chave: "ADMIN_MESAS_REMOVE_BUTTON", idioma: "es-ES", valor: "Eliminar" },
  { chave: "ADMIN_MESAS_REMOVE_BUTTON", idioma: "ar-MA", valor: "إزالة" },

  {
    chave: "ADMIN_MESAS_REMOVE_ERROR",
    idioma: "pt-BR",
    valor: "Erro ao remover mesa.",
  },
  {
    chave: "ADMIN_MESAS_REMOVE_ERROR",
    idioma: "pt-PT",
    valor: "Erro ao remover mesa.",
  },
  {
    chave: "ADMIN_MESAS_REMOVE_ERROR",
    idioma: "en-US",
    valor: "Error removing table.",
  },
  {
    chave: "ADMIN_MESAS_REMOVE_ERROR",
    idioma: "it-IT",
    valor: "Errore durante la rimozione del tavolo.",
  },
  {
    chave: "ADMIN_MESAS_REMOVE_ERROR",
    idioma: "es-ES",
    valor: "Error al eliminar mesa.",
  },
  {
    chave: "ADMIN_MESAS_REMOVE_ERROR",
    idioma: "ar-MA",
    valor: "خطأ في إزالة الطاولة.",
  },

  { chave: "ADMIN_MESAS_REMOVED", idioma: "pt-BR", valor: "Mesa removida." },
  { chave: "ADMIN_MESAS_REMOVED", idioma: "pt-PT", valor: "Mesa removida." },
  { chave: "ADMIN_MESAS_REMOVED", idioma: "en-US", valor: "Table removed." },
  { chave: "ADMIN_MESAS_REMOVED", idioma: "it-IT", valor: "Tavolo rimosso." },
  { chave: "ADMIN_MESAS_REMOVED", idioma: "es-ES", valor: "Mesa eliminada." },
  {
    chave: "ADMIN_MESAS_REMOVED",
    idioma: "ar-MA",
    valor: "تمت إزالة الطاولة.",
  },

  { chave: "ADMIN_MESAS_SAVE", idioma: "pt-BR", valor: "Salvar" },
  { chave: "ADMIN_MESAS_SAVE", idioma: "pt-PT", valor: "Guardar" },
  { chave: "ADMIN_MESAS_SAVE", idioma: "en-US", valor: "Save" },
  { chave: "ADMIN_MESAS_SAVE", idioma: "it-IT", valor: "Salva" },
  { chave: "ADMIN_MESAS_SAVE", idioma: "es-ES", valor: "Guardar" },
  { chave: "ADMIN_MESAS_SAVE", idioma: "ar-MA", valor: "حفظ" },

  { chave: "ADMIN_MESAS_SAVING", idioma: "pt-BR", valor: "Salvando..." },
  { chave: "ADMIN_MESAS_SAVING", idioma: "pt-PT", valor: "A guardar..." },
  { chave: "ADMIN_MESAS_SAVING", idioma: "en-US", valor: "Saving..." },
  { chave: "ADMIN_MESAS_SAVING", idioma: "it-IT", valor: "Salvataggio..." },
  { chave: "ADMIN_MESAS_SAVING", idioma: "es-ES", valor: "Guardando..." },
  { chave: "ADMIN_MESAS_SAVING", idioma: "ar-MA", valor: "جاري الحفظ..." },

  { chave: "ADMIN_MESAS_TABLE_NUMBER", idioma: "pt-BR", valor: "Mesa" },
  { chave: "ADMIN_MESAS_TABLE_NUMBER", idioma: "pt-PT", valor: "Mesa" },
  { chave: "ADMIN_MESAS_TABLE_NUMBER", idioma: "en-US", valor: "Table" },
  { chave: "ADMIN_MESAS_TABLE_NUMBER", idioma: "it-IT", valor: "Tavolo" },
  { chave: "ADMIN_MESAS_TABLE_NUMBER", idioma: "es-ES", valor: "Mesa" },
  { chave: "ADMIN_MESAS_TABLE_NUMBER", idioma: "ar-MA", valor: "الطاولة" },

  { chave: "ADMIN_MESAS_UPDATED", idioma: "pt-BR", valor: "Mesa atualizada!" },
  { chave: "ADMIN_MESAS_UPDATED", idioma: "pt-PT", valor: "Mesa atualizada!" },
  { chave: "ADMIN_MESAS_UPDATED", idioma: "en-US", valor: "Table updated!" },
  {
    chave: "ADMIN_MESAS_UPDATED",
    idioma: "it-IT",
    valor: "Tavolo aggiornato!",
  },
  {
    chave: "ADMIN_MESAS_UPDATED",
    idioma: "es-ES",
    valor: "¡Mesa actualizada!",
  },
  { chave: "ADMIN_MESAS_UPDATED", idioma: "ar-MA", valor: "تم تحديث الطاولة!" },

  // ─── KITCHEN ──────────────────────────────────────────────────────────────
  {
    chave: "KITCHEN_CANCEL_ERROR",
    idioma: "pt-BR",
    valor: "Erro ao cancelar pedido.",
  },
  {
    chave: "KITCHEN_CANCEL_ERROR",
    idioma: "pt-PT",
    valor: "Erro ao cancelar pedido.",
  },
  {
    chave: "KITCHEN_CANCEL_ERROR",
    idioma: "en-US",
    valor: "Error cancelling order.",
  },
  {
    chave: "KITCHEN_CANCEL_ERROR",
    idioma: "it-IT",
    valor: "Errore nella cancellazione dell'ordine.",
  },
  {
    chave: "KITCHEN_CANCEL_ERROR",
    idioma: "es-ES",
    valor: "Error al cancelar pedido.",
  },
  {
    chave: "KITCHEN_CANCEL_ERROR",
    idioma: "ar-MA",
    valor: "خطأ في إلغاء الطلب.",
  },

  {
    chave: "KITCHEN_CANCEL_ORDER_BTN",
    idioma: "pt-BR",
    valor: "Cancelar pedido",
  },
  {
    chave: "KITCHEN_CANCEL_ORDER_BTN",
    idioma: "pt-PT",
    valor: "Cancelar pedido",
  },
  { chave: "KITCHEN_CANCEL_ORDER_BTN", idioma: "en-US", valor: "Cancel order" },
  {
    chave: "KITCHEN_CANCEL_ORDER_BTN",
    idioma: "it-IT",
    valor: "Annulla ordine",
  },
  {
    chave: "KITCHEN_CANCEL_ORDER_BTN",
    idioma: "es-ES",
    valor: "Cancelar pedido",
  },
  { chave: "KITCHEN_CANCEL_ORDER_BTN", idioma: "ar-MA", valor: "إلغاء الطلب" },

  { chave: "KITCHEN_CANCELLING", idioma: "pt-BR", valor: "Cancelando..." },
  { chave: "KITCHEN_CANCELLING", idioma: "pt-PT", valor: "Cancelando..." },
  { chave: "KITCHEN_CANCELLING", idioma: "en-US", valor: "Cancelling..." },
  { chave: "KITCHEN_CANCELLING", idioma: "it-IT", valor: "Annullamento..." },
  { chave: "KITCHEN_CANCELLING", idioma: "es-ES", valor: "Cancelando..." },
  { chave: "KITCHEN_CANCELLING", idioma: "ar-MA", valor: "جاري الإلغاء..." },

  {
    chave: "KITCHEN_CONFIRM_DELIVERY_BTN",
    idioma: "pt-BR",
    valor: "Confirmar entrega",
  },
  {
    chave: "KITCHEN_CONFIRM_DELIVERY_BTN",
    idioma: "pt-PT",
    valor: "Confirmar entrega",
  },
  {
    chave: "KITCHEN_CONFIRM_DELIVERY_BTN",
    idioma: "en-US",
    valor: "Confirm delivery",
  },
  {
    chave: "KITCHEN_CONFIRM_DELIVERY_BTN",
    idioma: "it-IT",
    valor: "Conferma consegna",
  },
  {
    chave: "KITCHEN_CONFIRM_DELIVERY_BTN",
    idioma: "es-ES",
    valor: "Confirmar entrega",
  },
  {
    chave: "KITCHEN_CONFIRM_DELIVERY_BTN",
    idioma: "ar-MA",
    valor: "تأكيد التسليم",
  },

  {
    chave: "KITCHEN_CONFIRM_PAYMENT_BTN",
    idioma: "pt-BR",
    valor: "Confirmar pagamento",
  },
  {
    chave: "KITCHEN_CONFIRM_PAYMENT_BTN",
    idioma: "pt-PT",
    valor: "Confirmar pagamento",
  },
  {
    chave: "KITCHEN_CONFIRM_PAYMENT_BTN",
    idioma: "en-US",
    valor: "Confirm payment",
  },
  {
    chave: "KITCHEN_CONFIRM_PAYMENT_BTN",
    idioma: "it-IT",
    valor: "Conferma pagamento",
  },
  {
    chave: "KITCHEN_CONFIRM_PAYMENT_BTN",
    idioma: "es-ES",
    valor: "Confirmar pago",
  },
  {
    chave: "KITCHEN_CONFIRM_PAYMENT_BTN",
    idioma: "ar-MA",
    valor: "تأكيد الدفع",
  },

  {
    chave: "KITCHEN_CONFIRMING_DELIVERY",
    idioma: "pt-BR",
    valor: "Confirmando entrega...",
  },
  {
    chave: "KITCHEN_CONFIRMING_DELIVERY",
    idioma: "pt-PT",
    valor: "Confirmando entrega...",
  },
  {
    chave: "KITCHEN_CONFIRMING_DELIVERY",
    idioma: "en-US",
    valor: "Confirming delivery...",
  },
  {
    chave: "KITCHEN_CONFIRMING_DELIVERY",
    idioma: "it-IT",
    valor: "Conferma consegna...",
  },
  {
    chave: "KITCHEN_CONFIRMING_DELIVERY",
    idioma: "es-ES",
    valor: "Confirmando entrega...",
  },
  {
    chave: "KITCHEN_CONFIRMING_DELIVERY",
    idioma: "ar-MA",
    valor: "جاري تأكيد التسليم...",
  },

  {
    chave: "KITCHEN_DELIVERY_CODE_SECTION",
    idioma: "pt-BR",
    valor: "Código de entrega",
  },
  {
    chave: "KITCHEN_DELIVERY_CODE_SECTION",
    idioma: "pt-PT",
    valor: "Código de entrega",
  },
  {
    chave: "KITCHEN_DELIVERY_CODE_SECTION",
    idioma: "en-US",
    valor: "Delivery code",
  },
  {
    chave: "KITCHEN_DELIVERY_CODE_SECTION",
    idioma: "it-IT",
    valor: "Codice di consegna",
  },
  {
    chave: "KITCHEN_DELIVERY_CODE_SECTION",
    idioma: "es-ES",
    valor: "Código de entrega",
  },
  {
    chave: "KITCHEN_DELIVERY_CODE_SECTION",
    idioma: "ar-MA",
    valor: "رمز التسليم",
  },

  {
    chave: "KITCHEN_DELIVERY_CONFIRMED_TOAST",
    idioma: "pt-BR",
    valor: "Entrega confirmada!",
  },
  {
    chave: "KITCHEN_DELIVERY_CONFIRMED_TOAST",
    idioma: "pt-PT",
    valor: "Entrega confirmada!",
  },
  {
    chave: "KITCHEN_DELIVERY_CONFIRMED_TOAST",
    idioma: "en-US",
    valor: "Delivery confirmed!",
  },
  {
    chave: "KITCHEN_DELIVERY_CONFIRMED_TOAST",
    idioma: "it-IT",
    valor: "Consegna confermata!",
  },
  {
    chave: "KITCHEN_DELIVERY_CONFIRMED_TOAST",
    idioma: "es-ES",
    valor: "¡Entrega confirmada!",
  },
  {
    chave: "KITCHEN_DELIVERY_CONFIRMED_TOAST",
    idioma: "ar-MA",
    valor: "تم تأكيد التسليم!",
  },

  {
    chave: "KITCHEN_MOTOBOY_ASSIGNED",
    idioma: "pt-BR",
    valor: "Motoboy atribuído!",
  },
  {
    chave: "KITCHEN_MOTOBOY_ASSIGNED",
    idioma: "pt-PT",
    valor: "Estafeta atribuído!",
  },
  {
    chave: "KITCHEN_MOTOBOY_ASSIGNED",
    idioma: "en-US",
    valor: "Delivery driver assigned!",
  },
  {
    chave: "KITCHEN_MOTOBOY_ASSIGNED",
    idioma: "it-IT",
    valor: "Fattorino assegnato!",
  },
  {
    chave: "KITCHEN_MOTOBOY_ASSIGNED",
    idioma: "es-ES",
    valor: "¡Repartidor asignado!",
  },
  {
    chave: "KITCHEN_MOTOBOY_ASSIGNED",
    idioma: "ar-MA",
    valor: "تم تعيين الدراج!",
  },

  {
    chave: "KITCHEN_MOTOBOY_ERROR",
    idioma: "pt-BR",
    valor: "Erro ao atribuir motoboy.",
  },
  {
    chave: "KITCHEN_MOTOBOY_ERROR",
    idioma: "pt-PT",
    valor: "Erro ao atribuir estafeta.",
  },
  {
    chave: "KITCHEN_MOTOBOY_ERROR",
    idioma: "en-US",
    valor: "Error assigning delivery driver.",
  },
  {
    chave: "KITCHEN_MOTOBOY_ERROR",
    idioma: "it-IT",
    valor: "Errore nell'assegnazione del fattorino.",
  },
  {
    chave: "KITCHEN_MOTOBOY_ERROR",
    idioma: "es-ES",
    valor: "Error al asignar repartidor.",
  },
  {
    chave: "KITCHEN_MOTOBOY_ERROR",
    idioma: "ar-MA",
    valor: "خطأ في تعيين الدراج.",
  },

  {
    chave: "KITCHEN_ORDER_CANCELLED",
    idioma: "pt-BR",
    valor: "Pedido cancelado.",
  },
  {
    chave: "KITCHEN_ORDER_CANCELLED",
    idioma: "pt-PT",
    valor: "Pedido cancelado.",
  },
  {
    chave: "KITCHEN_ORDER_CANCELLED",
    idioma: "en-US",
    valor: "Order cancelled.",
  },
  {
    chave: "KITCHEN_ORDER_CANCELLED",
    idioma: "it-IT",
    valor: "Ordine annullato.",
  },
  {
    chave: "KITCHEN_ORDER_CANCELLED",
    idioma: "es-ES",
    valor: "Pedido cancelado.",
  },
  {
    chave: "KITCHEN_ORDER_CANCELLED",
    idioma: "ar-MA",
    valor: "تم إلغاء الطلب.",
  },

  { chave: "KITCHEN_PAY_LATER_BTN", idioma: "pt-BR", valor: "Pagar depois" },
  { chave: "KITCHEN_PAY_LATER_BTN", idioma: "pt-PT", valor: "Pagar depois" },
  { chave: "KITCHEN_PAY_LATER_BTN", idioma: "en-US", valor: "Pay later" },
  { chave: "KITCHEN_PAY_LATER_BTN", idioma: "it-IT", valor: "Paga dopo" },
  { chave: "KITCHEN_PAY_LATER_BTN", idioma: "es-ES", valor: "Pagar después" },
  { chave: "KITCHEN_PAY_LATER_BTN", idioma: "ar-MA", valor: "ادفع لاحقاً" },

  {
    chave: "KITCHEN_SELECT_MOTOBOY",
    idioma: "pt-BR",
    valor: "Selecionar motoboy",
  },
  {
    chave: "KITCHEN_SELECT_MOTOBOY",
    idioma: "pt-PT",
    valor: "Selecionar estafeta",
  },
  {
    chave: "KITCHEN_SELECT_MOTOBOY",
    idioma: "en-US",
    valor: "Select delivery driver",
  },
  {
    chave: "KITCHEN_SELECT_MOTOBOY",
    idioma: "it-IT",
    valor: "Seleziona fattorino",
  },
  {
    chave: "KITCHEN_SELECT_MOTOBOY",
    idioma: "es-ES",
    valor: "Seleccionar repartidor",
  },
  { chave: "KITCHEN_SELECT_MOTOBOY", idioma: "ar-MA", valor: "اختر الدراج" },

  {
    chave: "KITCHEN_STATUS_ERROR",
    idioma: "pt-BR",
    valor: "Erro ao atualizar status.",
  },
  {
    chave: "KITCHEN_STATUS_ERROR",
    idioma: "pt-PT",
    valor: "Erro ao atualizar estado.",
  },
  {
    chave: "KITCHEN_STATUS_ERROR",
    idioma: "en-US",
    valor: "Error updating status.",
  },
  {
    chave: "KITCHEN_STATUS_ERROR",
    idioma: "it-IT",
    valor: "Errore nell'aggiornamento dello stato.",
  },
  {
    chave: "KITCHEN_STATUS_ERROR",
    idioma: "es-ES",
    valor: "Error al actualizar estado.",
  },
  {
    chave: "KITCHEN_STATUS_ERROR",
    idioma: "ar-MA",
    valor: "خطأ في تحديث الحالة.",
  },

  {
    chave: "KITCHEN_STATUS_UPDATED",
    idioma: "pt-BR",
    valor: "Status atualizado!",
  },
  {
    chave: "KITCHEN_STATUS_UPDATED",
    idioma: "pt-PT",
    valor: "Estado atualizado!",
  },
  {
    chave: "KITCHEN_STATUS_UPDATED",
    idioma: "en-US",
    valor: "Status updated!",
  },
  {
    chave: "KITCHEN_STATUS_UPDATED",
    idioma: "it-IT",
    valor: "Stato aggiornato!",
  },
  {
    chave: "KITCHEN_STATUS_UPDATED",
    idioma: "es-ES",
    valor: "¡Estado actualizado!",
  },
  {
    chave: "KITCHEN_STATUS_UPDATED",
    idioma: "ar-MA",
    valor: "تم تحديث الحالة!",
  },

  {
    chave: "KITCHEN_UPDATE_ERROR",
    idioma: "pt-BR",
    valor: "Erro ao atualizar pedido.",
  },
  {
    chave: "KITCHEN_UPDATE_ERROR",
    idioma: "pt-PT",
    valor: "Erro ao atualizar pedido.",
  },
  {
    chave: "KITCHEN_UPDATE_ERROR",
    idioma: "en-US",
    valor: "Error updating order.",
  },
  {
    chave: "KITCHEN_UPDATE_ERROR",
    idioma: "it-IT",
    valor: "Errore nell'aggiornamento dell'ordine.",
  },
  {
    chave: "KITCHEN_UPDATE_ERROR",
    idioma: "es-ES",
    valor: "Error al actualizar pedido.",
  },
  {
    chave: "KITCHEN_UPDATE_ERROR",
    idioma: "ar-MA",
    valor: "خطأ في تحديث الطلب.",
  },

  {
    chave: "KITCHEN_UPDATED_SUCCESS",
    idioma: "pt-BR",
    valor: "Pedido atualizado!",
  },
  {
    chave: "KITCHEN_UPDATED_SUCCESS",
    idioma: "pt-PT",
    valor: "Pedido atualizado!",
  },
  {
    chave: "KITCHEN_UPDATED_SUCCESS",
    idioma: "en-US",
    valor: "Order updated!",
  },
  {
    chave: "KITCHEN_UPDATED_SUCCESS",
    idioma: "it-IT",
    valor: "Ordine aggiornato!",
  },
  {
    chave: "KITCHEN_UPDATED_SUCCESS",
    idioma: "es-ES",
    valor: "¡Pedido actualizado!",
  },
  {
    chave: "KITCHEN_UPDATED_SUCCESS",
    idioma: "ar-MA",
    valor: "تم تحديث الطلب!",
  },
];

async function main() {
  console.log(
    `Total de entradas a inserir: ${entries.length} (${entries.length / 6} chaves × 6 idiomas)\n`,
  );

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
