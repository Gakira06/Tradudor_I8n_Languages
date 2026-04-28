-- =========================================================================
-- Chaves novas: colunas do kanban (Kitchen), botões de ação e modal de Mesas
-- Idiomas: pt-BR, pt-PT, en-US, it-IT, es-ES, ar-MA
-- =========================================================================

INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT v.chave, v.valor, s.id, i.id
FROM (VALUES

  -- ==========================================================
  -- COLUNAS DO KANBAN (KitchenPage)
  -- ==========================================================
  ('KITCHEN_COLUMN_AGUARDANDO_PAGAMENTO', 'pt-BR', 'Aguardando Pagamento'),
  ('KITCHEN_COLUMN_AGUARDANDO_PAGAMENTO', 'pt-PT', 'A aguardar pagamento'),
  ('KITCHEN_COLUMN_AGUARDANDO_PAGAMENTO', 'en-US', 'Awaiting Payment'),
  ('KITCHEN_COLUMN_AGUARDANDO_PAGAMENTO', 'it-IT', 'In attesa di pagamento'),
  ('KITCHEN_COLUMN_AGUARDANDO_PAGAMENTO', 'es-ES', 'Esperando Pago'),
  ('KITCHEN_COLUMN_AGUARDANDO_PAGAMENTO', 'ar-MA', 'بانتظار الدفع'),

  ('KITCHEN_COLUMN_RECEBIDO', 'pt-BR', 'Recebido'),
  ('KITCHEN_COLUMN_RECEBIDO', 'pt-PT', 'Recebido'),
  ('KITCHEN_COLUMN_RECEBIDO', 'en-US', 'Received'),
  ('KITCHEN_COLUMN_RECEBIDO', 'it-IT', 'Ricevuto'),
  ('KITCHEN_COLUMN_RECEBIDO', 'es-ES', 'Recibido'),
  ('KITCHEN_COLUMN_RECEBIDO', 'ar-MA', 'مستلم'),

  ('KITCHEN_COLUMN_PREPARANDO', 'pt-BR', 'Preparando'),
  ('KITCHEN_COLUMN_PREPARANDO', 'pt-PT', 'A preparar'),
  ('KITCHEN_COLUMN_PREPARANDO', 'en-US', 'Preparing'),
  ('KITCHEN_COLUMN_PREPARANDO', 'it-IT', 'In preparazione'),
  ('KITCHEN_COLUMN_PREPARANDO', 'es-ES', 'Preparando'),
  ('KITCHEN_COLUMN_PREPARANDO', 'ar-MA', 'جاري التحضير'),

  ('KITCHEN_COLUMN_NO_FORNO', 'pt-BR', 'No Forno'),
  ('KITCHEN_COLUMN_NO_FORNO', 'pt-PT', 'No Forno'),
  ('KITCHEN_COLUMN_NO_FORNO', 'en-US', 'In the Oven'),
  ('KITCHEN_COLUMN_NO_FORNO', 'it-IT', 'In Forno'),
  ('KITCHEN_COLUMN_NO_FORNO', 'es-ES', 'En el Horno'),
  ('KITCHEN_COLUMN_NO_FORNO', 'ar-MA', 'في الفرن'),

  ('KITCHEN_COLUMN_SAIU_PARA_ENTREGA', 'pt-BR', 'Saiu p/ Entrega'),
  ('KITCHEN_COLUMN_SAIU_PARA_ENTREGA', 'pt-PT', 'Saiu p/ Entrega'),
  ('KITCHEN_COLUMN_SAIU_PARA_ENTREGA', 'en-US', 'Out for Delivery'),
  ('KITCHEN_COLUMN_SAIU_PARA_ENTREGA', 'it-IT', 'Uscito per la consegna'),
  ('KITCHEN_COLUMN_SAIU_PARA_ENTREGA', 'es-ES', 'En camino'),
  ('KITCHEN_COLUMN_SAIU_PARA_ENTREGA', 'ar-MA', 'في طريق التوصيل'),

  ('KITCHEN_COLUMN_RETIRADA_PRONTA', 'pt-BR', 'Retirada no Local'),
  ('KITCHEN_COLUMN_RETIRADA_PRONTA', 'pt-PT', 'Levantamento no Local'),
  ('KITCHEN_COLUMN_RETIRADA_PRONTA', 'en-US', 'Ready for Pickup'),
  ('KITCHEN_COLUMN_RETIRADA_PRONTA', 'it-IT', 'Pronto per Ritiro'),
  ('KITCHEN_COLUMN_RETIRADA_PRONTA', 'es-ES', 'Listo para Recoger'),
  ('KITCHEN_COLUMN_RETIRADA_PRONTA', 'ar-MA', 'جاهز للاستلام'),

  ('KITCHEN_COLUMN_LEVAR_PARA_MESA', 'pt-BR', 'Levar para a Mesa'),
  ('KITCHEN_COLUMN_LEVAR_PARA_MESA', 'pt-PT', 'Levar para a Mesa'),
  ('KITCHEN_COLUMN_LEVAR_PARA_MESA', 'en-US', 'Take to Table'),
  ('KITCHEN_COLUMN_LEVAR_PARA_MESA', 'it-IT', 'Portare al Tavolo'),
  ('KITCHEN_COLUMN_LEVAR_PARA_MESA', 'es-ES', 'Llevar a la Mesa'),
  ('KITCHEN_COLUMN_LEVAR_PARA_MESA', 'ar-MA', 'خذ إلى الطاولة'),

  -- ==========================================================
  -- BOTÕES DE AVANÇO DE STATUS (KITCHEN_NEXT_*)
  -- ==========================================================
  ('KITCHEN_NEXT_RECEBIDO', 'pt-BR', 'Iniciar Preparo'),
  ('KITCHEN_NEXT_RECEBIDO', 'pt-PT', 'Iniciar Preparo'),
  ('KITCHEN_NEXT_RECEBIDO', 'en-US', 'Start Preparation'),
  ('KITCHEN_NEXT_RECEBIDO', 'it-IT', 'Inizia Preparazione'),
  ('KITCHEN_NEXT_RECEBIDO', 'es-ES', 'Iniciar Preparación'),
  ('KITCHEN_NEXT_RECEBIDO', 'ar-MA', 'بدء التحضير'),

  ('KITCHEN_NEXT_PREPARANDO', 'pt-BR', 'Enviar ao Forno'),
  ('KITCHEN_NEXT_PREPARANDO', 'pt-PT', 'Enviar ao Forno'),
  ('KITCHEN_NEXT_PREPARANDO', 'en-US', 'Send to Oven'),
  ('KITCHEN_NEXT_PREPARANDO', 'it-IT', 'Metti in Forno'),
  ('KITCHEN_NEXT_PREPARANDO', 'es-ES', 'Enviar al Horno'),
  ('KITCHEN_NEXT_PREPARANDO', 'ar-MA', 'أرسل إلى الفرن'),

  ('KITCHEN_NEXT_NO_FORNO', 'pt-BR', 'Saiu para Entrega'),
  ('KITCHEN_NEXT_NO_FORNO', 'pt-PT', 'Saiu para Entrega'),
  ('KITCHEN_NEXT_NO_FORNO', 'en-US', 'Out for Delivery'),
  ('KITCHEN_NEXT_NO_FORNO', 'it-IT', 'Uscito per la consegna'),
  ('KITCHEN_NEXT_NO_FORNO', 'es-ES', 'Salió para entrega'),
  ('KITCHEN_NEXT_NO_FORNO', 'ar-MA', 'خرج للتوصيل'),

  ('KITCHEN_NEXT_SAIU_PARA_ENTREGA', 'pt-BR', 'Marcar Entregue'),
  ('KITCHEN_NEXT_SAIU_PARA_ENTREGA', 'pt-PT', 'Marcar Entregue'),
  ('KITCHEN_NEXT_SAIU_PARA_ENTREGA', 'en-US', 'Mark as Delivered'),
  ('KITCHEN_NEXT_SAIU_PARA_ENTREGA', 'it-IT', 'Segna come Consegnato'),
  ('KITCHEN_NEXT_SAIU_PARA_ENTREGA', 'es-ES', 'Marcar Entregado'),
  ('KITCHEN_NEXT_SAIU_PARA_ENTREGA', 'ar-MA', 'تحديد كمسلّم'),

  -- ==========================================================
  -- BOTÕES E TEXTOS DO ORDER CARD (Kitchen)
  -- ==========================================================
  ('KITCHEN_CONFIRM_PAYMENT_BTN', 'pt-BR', '✅ Confirmar Pgto'),
  ('KITCHEN_CONFIRM_PAYMENT_BTN', 'pt-PT', '✅ Confirmar Pgto'),
  ('KITCHEN_CONFIRM_PAYMENT_BTN', 'en-US', '✅ Confirm Payment'),
  ('KITCHEN_CONFIRM_PAYMENT_BTN', 'it-IT', '✅ Conferma Pagamento'),
  ('KITCHEN_CONFIRM_PAYMENT_BTN', 'es-ES', '✅ Confirmar Pago'),
  ('KITCHEN_CONFIRM_PAYMENT_BTN', 'ar-MA', '✅ تأكيد الدفع'),

  ('KITCHEN_PAY_LATER_BTN', 'pt-BR', '⏳ Pagar Depois'),
  ('KITCHEN_PAY_LATER_BTN', 'pt-PT', '⏳ Pagar Depois'),
  ('KITCHEN_PAY_LATER_BTN', 'en-US', '⏳ Pay Later'),
  ('KITCHEN_PAY_LATER_BTN', 'it-IT', '⏳ Paga Dopo'),
  ('KITCHEN_PAY_LATER_BTN', 'es-ES', '⏳ Pagar Después'),
  ('KITCHEN_PAY_LATER_BTN', 'ar-MA', '⏳ ادفع لاحقًا'),

  ('KITCHEN_CANCEL_ORDER_BTN', 'pt-BR', 'Cancelar Pedido'),
  ('KITCHEN_CANCEL_ORDER_BTN', 'pt-PT', 'Cancelar Pedido'),
  ('KITCHEN_CANCEL_ORDER_BTN', 'en-US', 'Cancel Order'),
  ('KITCHEN_CANCEL_ORDER_BTN', 'it-IT', 'Annulla Ordine'),
  ('KITCHEN_CANCEL_ORDER_BTN', 'es-ES', 'Cancelar Pedido'),
  ('KITCHEN_CANCEL_ORDER_BTN', 'ar-MA', 'إلغاء الطلب'),

  ('KITCHEN_CANCELLING', 'pt-BR', 'Cancelando...'),
  ('KITCHEN_CANCELLING', 'pt-PT', 'A cancelar...'),
  ('KITCHEN_CANCELLING', 'en-US', 'Cancelling...'),
  ('KITCHEN_CANCELLING', 'it-IT', 'Annullamento...'),
  ('KITCHEN_CANCELLING', 'es-ES', 'Cancelando...'),
  ('KITCHEN_CANCELLING', 'ar-MA', 'جاري الإلغاء...'),

  ('KITCHEN_CANCEL_CONFIRM_TEXT', 'pt-BR', 'Cancelar pedido #{{id}}?'),
  ('KITCHEN_CANCEL_CONFIRM_TEXT', 'pt-PT', 'Cancelar pedido #{{id}}?'),
  ('KITCHEN_CANCEL_CONFIRM_TEXT', 'en-US', 'Cancel order #{{id}}?'),
  ('KITCHEN_CANCEL_CONFIRM_TEXT', 'it-IT', 'Annullare l''ordine #{{id}}?'),
  ('KITCHEN_CANCEL_CONFIRM_TEXT', 'es-ES', '¿Cancelar pedido #{{id}}?'),
  ('KITCHEN_CANCEL_CONFIRM_TEXT', 'ar-MA', 'إلغاء الطلب #{{id}}؟'),

  ('KITCHEN_SELECT_MOTOBOY', 'pt-BR', 'Selecionar motoboy...'),
  ('KITCHEN_SELECT_MOTOBOY', 'pt-PT', 'Selecionar estafeta...'),
  ('KITCHEN_SELECT_MOTOBOY', 'en-US', 'Select rider...'),
  ('KITCHEN_SELECT_MOTOBOY', 'it-IT', 'Seleziona rider...'),
  ('KITCHEN_SELECT_MOTOBOY', 'es-ES', 'Seleccionar repartidor...'),
  ('KITCHEN_SELECT_MOTOBOY', 'ar-MA', 'اختر مندوب التوصيل...'),

  ('KITCHEN_DELIVERY_CODE_SECTION', 'pt-BR', '📍 Código do cliente'),
  ('KITCHEN_DELIVERY_CODE_SECTION', 'pt-PT', '📍 Código do cliente'),
  ('KITCHEN_DELIVERY_CODE_SECTION', 'en-US', '📍 Customer code'),
  ('KITCHEN_DELIVERY_CODE_SECTION', 'it-IT', '📍 Codice del cliente'),
  ('KITCHEN_DELIVERY_CODE_SECTION', 'es-ES', '📍 Código del cliente'),
  ('KITCHEN_DELIVERY_CODE_SECTION', 'ar-MA', '📍 رمز العميل'),

  ('KITCHEN_CONFIRM_DELIVERY_BTN', 'pt-BR', '✓ Confirmar Entrega'),
  ('KITCHEN_CONFIRM_DELIVERY_BTN', 'pt-PT', '✓ Confirmar Entrega'),
  ('KITCHEN_CONFIRM_DELIVERY_BTN', 'en-US', '✓ Confirm Delivery'),
  ('KITCHEN_CONFIRM_DELIVERY_BTN', 'it-IT', '✓ Conferma Consegna'),
  ('KITCHEN_CONFIRM_DELIVERY_BTN', 'es-ES', '✓ Confirmar Entrega'),
  ('KITCHEN_CONFIRM_DELIVERY_BTN', 'ar-MA', '✓ تأكيد التسليم'),

  ('KITCHEN_CONFIRMING_DELIVERY', 'pt-BR', 'Confirmando...'),
  ('KITCHEN_CONFIRMING_DELIVERY', 'pt-PT', 'A confirmar...'),
  ('KITCHEN_CONFIRMING_DELIVERY', 'en-US', 'Confirming...'),
  ('KITCHEN_CONFIRMING_DELIVERY', 'it-IT', 'Conferma...'),
  ('KITCHEN_CONFIRMING_DELIVERY', 'es-ES', 'Confirmando...'),
  ('KITCHEN_CONFIRMING_DELIVERY', 'ar-MA', 'جاري التأكيد...'),

  -- ==========================================================
  -- TOASTS DA KITCHEN PAGE
  -- ==========================================================
  ('KITCHEN_STATUS_UPDATED', 'pt-BR', 'Status atualizado'),
  ('KITCHEN_STATUS_UPDATED', 'pt-PT', 'Estado atualizado'),
  ('KITCHEN_STATUS_UPDATED', 'en-US', 'Status updated'),
  ('KITCHEN_STATUS_UPDATED', 'it-IT', 'Stato aggiornato'),
  ('KITCHEN_STATUS_UPDATED', 'es-ES', 'Estado actualizado'),
  ('KITCHEN_STATUS_UPDATED', 'ar-MA', 'تم تحديث الحالة'),

  ('KITCHEN_STATUS_ERROR', 'pt-BR', 'Falha ao atualizar status'),
  ('KITCHEN_STATUS_ERROR', 'pt-PT', 'Falha ao atualizar estado'),
  ('KITCHEN_STATUS_ERROR', 'en-US', 'Failed to update status'),
  ('KITCHEN_STATUS_ERROR', 'it-IT', 'Impossibile aggiornare lo stato'),
  ('KITCHEN_STATUS_ERROR', 'es-ES', 'Error al actualizar estado'),
  ('KITCHEN_STATUS_ERROR', 'ar-MA', 'فشل في تحديث الحالة'),

  ('KITCHEN_MOTOBOY_ASSIGNED', 'pt-BR', 'Motoboy atribuído'),
  ('KITCHEN_MOTOBOY_ASSIGNED', 'pt-PT', 'Estafeta atribuído'),
  ('KITCHEN_MOTOBOY_ASSIGNED', 'en-US', 'Rider assigned'),
  ('KITCHEN_MOTOBOY_ASSIGNED', 'it-IT', 'Rider assegnato'),
  ('KITCHEN_MOTOBOY_ASSIGNED', 'es-ES', 'Repartidor asignado'),
  ('KITCHEN_MOTOBOY_ASSIGNED', 'ar-MA', 'تم تعيين المندوب'),

  ('KITCHEN_MOTOBOY_ERROR', 'pt-BR', 'Falha ao atribuir motoboy'),
  ('KITCHEN_MOTOBOY_ERROR', 'pt-PT', 'Falha ao atribuir estafeta'),
  ('KITCHEN_MOTOBOY_ERROR', 'en-US', 'Failed to assign rider'),
  ('KITCHEN_MOTOBOY_ERROR', 'it-IT', 'Impossibile assegnare rider'),
  ('KITCHEN_MOTOBOY_ERROR', 'es-ES', 'Error al asignar repartidor'),
  ('KITCHEN_MOTOBOY_ERROR', 'ar-MA', 'فشل في تعيين المندوب'),

  ('KITCHEN_DELIVERY_CONFIRMED_TOAST', 'pt-BR', 'Entrega confirmada!'),
  ('KITCHEN_DELIVERY_CONFIRMED_TOAST', 'pt-PT', 'Entrega confirmada!'),
  ('KITCHEN_DELIVERY_CONFIRMED_TOAST', 'en-US', 'Delivery confirmed!'),
  ('KITCHEN_DELIVERY_CONFIRMED_TOAST', 'it-IT', 'Consegna confermata!'),
  ('KITCHEN_DELIVERY_CONFIRMED_TOAST', 'es-ES', '¡Entrega confirmada!'),
  ('KITCHEN_DELIVERY_CONFIRMED_TOAST', 'ar-MA', 'تم تأكيد التسليم!'),

  ('KITCHEN_ORDER_CANCELLED', 'pt-BR', 'Pedido cancelado'),
  ('KITCHEN_ORDER_CANCELLED', 'pt-PT', 'Pedido cancelado'),
  ('KITCHEN_ORDER_CANCELLED', 'en-US', 'Order cancelled'),
  ('KITCHEN_ORDER_CANCELLED', 'it-IT', 'Ordine annullato'),
  ('KITCHEN_ORDER_CANCELLED', 'es-ES', 'Pedido cancelado'),
  ('KITCHEN_ORDER_CANCELLED', 'ar-MA', 'تم إلغاء الطلب'),

  ('KITCHEN_CANCEL_ERROR', 'pt-BR', 'Falha ao cancelar pedido'),
  ('KITCHEN_CANCEL_ERROR', 'pt-PT', 'Falha ao cancelar pedido'),
  ('KITCHEN_CANCEL_ERROR', 'en-US', 'Failed to cancel order'),
  ('KITCHEN_CANCEL_ERROR', 'it-IT', 'Impossibile annullare l''ordine'),
  ('KITCHEN_CANCEL_ERROR', 'es-ES', 'Error al cancelar pedido'),
  ('KITCHEN_CANCEL_ERROR', 'ar-MA', 'فشل في إلغاء الطلب'),

  ('KITCHEN_UPDATED_SUCCESS', 'pt-BR', 'Atualizado com sucesso'),
  ('KITCHEN_UPDATED_SUCCESS', 'pt-PT', 'Atualizado com sucesso'),
  ('KITCHEN_UPDATED_SUCCESS', 'en-US', 'Updated successfully'),
  ('KITCHEN_UPDATED_SUCCESS', 'it-IT', 'Aggiornato con successo'),
  ('KITCHEN_UPDATED_SUCCESS', 'es-ES', 'Actualizado con éxito'),
  ('KITCHEN_UPDATED_SUCCESS', 'ar-MA', 'تم التحديث بنجاح'),

  ('KITCHEN_UPDATE_ERROR', 'pt-BR', 'Falha ao atualizar'),
  ('KITCHEN_UPDATE_ERROR', 'pt-PT', 'Falha ao atualizar'),
  ('KITCHEN_UPDATE_ERROR', 'en-US', 'Failed to update'),
  ('KITCHEN_UPDATE_ERROR', 'it-IT', 'Impossibile aggiornare'),
  ('KITCHEN_UPDATE_ERROR', 'es-ES', 'Error al actualizar'),
  ('KITCHEN_UPDATE_ERROR', 'ar-MA', 'فشل في التحديث'),

  -- ==========================================================
  -- MODAL DE CADASTRO / EDIÇÃO DE MESA (AdminMesasPage)
  -- ==========================================================
  ('ADMIN_MESAS_FORM_TITLE_EDIT', 'pt-BR', 'Editar Mesa'),
  ('ADMIN_MESAS_FORM_TITLE_EDIT', 'pt-PT', 'Editar Mesa'),
  ('ADMIN_MESAS_FORM_TITLE_EDIT', 'en-US', 'Edit Table'),
  ('ADMIN_MESAS_FORM_TITLE_EDIT', 'it-IT', 'Modifica Tavolo'),
  ('ADMIN_MESAS_FORM_TITLE_EDIT', 'es-ES', 'Editar Mesa'),
  ('ADMIN_MESAS_FORM_TITLE_EDIT', 'ar-MA', 'تعديل الطاولة'),

  ('ADMIN_MESAS_FORM_TITLE_NEW', 'pt-BR', 'Nova Mesa'),
  ('ADMIN_MESAS_FORM_TITLE_NEW', 'pt-PT', 'Nova Mesa'),
  ('ADMIN_MESAS_FORM_TITLE_NEW', 'en-US', 'New Table'),
  ('ADMIN_MESAS_FORM_TITLE_NEW', 'it-IT', 'Nuovo Tavolo'),
  ('ADMIN_MESAS_FORM_TITLE_NEW', 'es-ES', 'Nueva Mesa'),
  ('ADMIN_MESAS_FORM_TITLE_NEW', 'ar-MA', 'طاولة جديدة'),

  ('ADMIN_MESAS_FORM_NAME_LABEL', 'pt-BR', 'Nome da mesa *'),
  ('ADMIN_MESAS_FORM_NAME_LABEL', 'pt-PT', 'Nome da mesa *'),
  ('ADMIN_MESAS_FORM_NAME_LABEL', 'en-US', 'Table name *'),
  ('ADMIN_MESAS_FORM_NAME_LABEL', 'it-IT', 'Nome del tavolo *'),
  ('ADMIN_MESAS_FORM_NAME_LABEL', 'es-ES', 'Nombre de la mesa *'),
  ('ADMIN_MESAS_FORM_NAME_LABEL', 'ar-MA', 'اسم الطاولة *'),

  ('ADMIN_MESAS_FORM_NAME_PH', 'pt-BR', 'Ex: Mesa Varanda 1'),
  ('ADMIN_MESAS_FORM_NAME_PH', 'pt-PT', 'Ex: Mesa Varanda 1'),
  ('ADMIN_MESAS_FORM_NAME_PH', 'en-US', 'E.g.: Terrace Table 1'),
  ('ADMIN_MESAS_FORM_NAME_PH', 'it-IT', 'Es.: Tavolo Terrazza 1'),
  ('ADMIN_MESAS_FORM_NAME_PH', 'es-ES', 'Ej: Mesa Terraza 1'),
  ('ADMIN_MESAS_FORM_NAME_PH', 'ar-MA', 'مثال: طاولة التراس 1'),

  ('ADMIN_MESAS_FORM_NUMBER_LABEL', 'pt-BR', 'Número da mesa *'),
  ('ADMIN_MESAS_FORM_NUMBER_LABEL', 'pt-PT', 'Número da mesa *'),
  ('ADMIN_MESAS_FORM_NUMBER_LABEL', 'en-US', 'Table number *'),
  ('ADMIN_MESAS_FORM_NUMBER_LABEL', 'it-IT', 'Numero del tavolo *'),
  ('ADMIN_MESAS_FORM_NUMBER_LABEL', 'es-ES', 'Número de mesa *'),
  ('ADMIN_MESAS_FORM_NUMBER_LABEL', 'ar-MA', 'رقم الطاولة *'),

  ('ADMIN_MESAS_FORM_TERMINAL_LABEL', 'pt-BR', 'ID da Maquininha (Mercado Pago Point)'),
  ('ADMIN_MESAS_FORM_TERMINAL_LABEL', 'pt-PT', 'ID do Terminal (Mercado Pago Point)'),
  ('ADMIN_MESAS_FORM_TERMINAL_LABEL', 'en-US', 'Terminal ID (Mercado Pago Point)'),
  ('ADMIN_MESAS_FORM_TERMINAL_LABEL', 'it-IT', 'ID Terminale (Mercado Pago Point)'),
  ('ADMIN_MESAS_FORM_TERMINAL_LABEL', 'es-ES', 'ID del Terminal (Mercado Pago Point)'),
  ('ADMIN_MESAS_FORM_TERMINAL_LABEL', 'ar-MA', 'معرّف الجهاز (Mercado Pago Point)'),

  ('ADMIN_MESAS_FORM_TERMINAL_HINT', 'pt-BR', 'Deixe em branco se a mesa não tiver maquininha dedicada.'),
  ('ADMIN_MESAS_FORM_TERMINAL_HINT', 'pt-PT', 'Deixe em branco se a mesa não tiver terminal dedicado.'),
  ('ADMIN_MESAS_FORM_TERMINAL_HINT', 'en-US', 'Leave blank if the table has no dedicated terminal.'),
  ('ADMIN_MESAS_FORM_TERMINAL_HINT', 'it-IT', 'Lascia vuoto se il tavolo non ha un terminale dedicato.'),
  ('ADMIN_MESAS_FORM_TERMINAL_HINT', 'es-ES', 'Dejar en blanco si la mesa no tiene terminal dedicado.'),
  ('ADMIN_MESAS_FORM_TERMINAL_HINT', 'ar-MA', 'اتركه فارغًا إذا لم يكن للطاولة جهاز دفع مخصص.'),

  ('ADMIN_MESAS_SAVING', 'pt-BR', 'Salvando...'),
  ('ADMIN_MESAS_SAVING', 'pt-PT', 'A guardar...'),
  ('ADMIN_MESAS_SAVING', 'en-US', 'Saving...'),
  ('ADMIN_MESAS_SAVING', 'it-IT', 'Salvataggio...'),
  ('ADMIN_MESAS_SAVING', 'es-ES', 'Guardando...'),
  ('ADMIN_MESAS_SAVING', 'ar-MA', 'جاري الحفظ...'),

  ('ADMIN_MESAS_SAVE', 'pt-BR', 'Salvar'),
  ('ADMIN_MESAS_SAVE', 'pt-PT', 'Guardar'),
  ('ADMIN_MESAS_SAVE', 'en-US', 'Save'),
  ('ADMIN_MESAS_SAVE', 'it-IT', 'Salva'),
  ('ADMIN_MESAS_SAVE', 'es-ES', 'Guardar'),
  ('ADMIN_MESAS_SAVE', 'ar-MA', 'حفظ'),

  ('ADMIN_MESAS_CANCEL', 'pt-BR', 'Cancelar'),
  ('ADMIN_MESAS_CANCEL', 'pt-PT', 'Cancelar'),
  ('ADMIN_MESAS_CANCEL', 'en-US', 'Cancel'),
  ('ADMIN_MESAS_CANCEL', 'it-IT', 'Annulla'),
  ('ADMIN_MESAS_CANCEL', 'es-ES', 'Cancelar'),
  ('ADMIN_MESAS_CANCEL', 'ar-MA', 'إلغاء'),

  ('ADMIN_MESAS_UPDATED', 'pt-BR', 'Mesa atualizada!'),
  ('ADMIN_MESAS_UPDATED', 'pt-PT', 'Mesa atualizada!'),
  ('ADMIN_MESAS_UPDATED', 'en-US', 'Table updated!'),
  ('ADMIN_MESAS_UPDATED', 'it-IT', 'Tavolo aggiornato!'),
  ('ADMIN_MESAS_UPDATED', 'es-ES', '¡Mesa actualizada!'),
  ('ADMIN_MESAS_UPDATED', 'ar-MA', 'تم تحديث الطاولة!'),

  ('ADMIN_MESAS_CREATED', 'pt-BR', 'Mesa criada!'),
  ('ADMIN_MESAS_CREATED', 'pt-PT', 'Mesa criada!'),
  ('ADMIN_MESAS_CREATED', 'en-US', 'Table created!'),
  ('ADMIN_MESAS_CREATED', 'it-IT', 'Tavolo creato!'),
  ('ADMIN_MESAS_CREATED', 'es-ES', '¡Mesa creada!'),
  ('ADMIN_MESAS_CREATED', 'ar-MA', 'تم إنشاء الطاولة!'),

  ('ADMIN_MESAS_ERROR_NAME', 'pt-BR', 'Informe o nome da mesa.'),
  ('ADMIN_MESAS_ERROR_NAME', 'pt-PT', 'Informe o nome da mesa.'),
  ('ADMIN_MESAS_ERROR_NAME', 'en-US', 'Enter the table name.'),
  ('ADMIN_MESAS_ERROR_NAME', 'it-IT', 'Inserisci il nome del tavolo.'),
  ('ADMIN_MESAS_ERROR_NAME', 'es-ES', 'Ingresa el nombre de la mesa.'),
  ('ADMIN_MESAS_ERROR_NAME', 'ar-MA', 'أدخل اسم الطاولة.'),

  ('ADMIN_MESAS_ERROR_NUMBER', 'pt-BR', 'Número de mesa inválido.'),
  ('ADMIN_MESAS_ERROR_NUMBER', 'pt-PT', 'Número de mesa inválido.'),
  ('ADMIN_MESAS_ERROR_NUMBER', 'en-US', 'Invalid table number.'),
  ('ADMIN_MESAS_ERROR_NUMBER', 'it-IT', 'Numero del tavolo non valido.'),
  ('ADMIN_MESAS_ERROR_NUMBER', 'es-ES', 'Número de mesa inválido.'),
  ('ADMIN_MESAS_ERROR_NUMBER', 'ar-MA', 'رقم طاولة غير صالح.'),

  ('ADMIN_MESAS_ERROR_SAVE', 'pt-BR', 'Erro ao salvar mesa.'),
  ('ADMIN_MESAS_ERROR_SAVE', 'pt-PT', 'Erro ao guardar mesa.'),
  ('ADMIN_MESAS_ERROR_SAVE', 'en-US', 'Error saving table.'),
  ('ADMIN_MESAS_ERROR_SAVE', 'it-IT', 'Errore salvataggio tavolo.'),
  ('ADMIN_MESAS_ERROR_SAVE', 'es-ES', 'Error al guardar mesa.'),
  ('ADMIN_MESAS_ERROR_SAVE', 'ar-MA', 'خطأ في حفظ الطاولة.'),

  -- ==========================================================
  -- CARD DE MESA
  -- ==========================================================
  ('ADMIN_MESAS_INACTIVE', 'pt-BR', '(inativa)'),
  ('ADMIN_MESAS_INACTIVE', 'pt-PT', '(inativa)'),
  ('ADMIN_MESAS_INACTIVE', 'en-US', '(inactive)'),
  ('ADMIN_MESAS_INACTIVE', 'it-IT', '(inattivo)'),
  ('ADMIN_MESAS_INACTIVE', 'es-ES', '(inactiva)'),
  ('ADMIN_MESAS_INACTIVE', 'ar-MA', '(غير نشطة)'),

  ('ADMIN_MESAS_TABLE_NUMBER', 'pt-BR', 'Mesa nº {{number}}'),
  ('ADMIN_MESAS_TABLE_NUMBER', 'pt-PT', 'Mesa nº {{number}}'),
  ('ADMIN_MESAS_TABLE_NUMBER', 'en-US', 'Table nº {{number}}'),
  ('ADMIN_MESAS_TABLE_NUMBER', 'it-IT', 'Tavolo n. {{number}}'),
  ('ADMIN_MESAS_TABLE_NUMBER', 'es-ES', 'Mesa n.º {{number}}'),
  ('ADMIN_MESAS_TABLE_NUMBER', 'ar-MA', 'طاولة رقم {{number}}'),

  ('ADMIN_MESAS_NO_TERMINAL', 'pt-BR', '⚠️ Sem maquininha vinculada'),
  ('ADMIN_MESAS_NO_TERMINAL', 'pt-PT', '⚠️ Sem terminal vinculado'),
  ('ADMIN_MESAS_NO_TERMINAL', 'en-US', '⚠️ No terminal linked'),
  ('ADMIN_MESAS_NO_TERMINAL', 'it-IT', '⚠️ Nessun terminale collegato'),
  ('ADMIN_MESAS_NO_TERMINAL', 'es-ES', '⚠️ Sin terminal vinculado'),
  ('ADMIN_MESAS_NO_TERMINAL', 'ar-MA', '⚠️ لا يوجد جهاز مرتبط'),

  ('ADMIN_MESAS_QR_BUTTON', 'pt-BR', 'QR Code'),
  ('ADMIN_MESAS_QR_BUTTON', 'pt-PT', 'QR Code'),
  ('ADMIN_MESAS_QR_BUTTON', 'en-US', 'QR Code'),
  ('ADMIN_MESAS_QR_BUTTON', 'it-IT', 'QR Code'),
  ('ADMIN_MESAS_QR_BUTTON', 'es-ES', 'QR Code'),
  ('ADMIN_MESAS_QR_BUTTON', 'ar-MA', 'رمز QR'),

  ('ADMIN_MESAS_EDIT_BUTTON', 'pt-BR', '✏️ Editar'),
  ('ADMIN_MESAS_EDIT_BUTTON', 'pt-PT', '✏️ Editar'),
  ('ADMIN_MESAS_EDIT_BUTTON', 'en-US', '✏️ Edit'),
  ('ADMIN_MESAS_EDIT_BUTTON', 'it-IT', '✏️ Modifica'),
  ('ADMIN_MESAS_EDIT_BUTTON', 'es-ES', '✏️ Editar'),
  ('ADMIN_MESAS_EDIT_BUTTON', 'ar-MA', '✏️ تعديل'),

  ('ADMIN_MESAS_NEW_QR_BUTTON', 'pt-BR', '🔄 Novo QR'),
  ('ADMIN_MESAS_NEW_QR_BUTTON', 'pt-PT', '🔄 Novo QR'),
  ('ADMIN_MESAS_NEW_QR_BUTTON', 'en-US', '🔄 New QR'),
  ('ADMIN_MESAS_NEW_QR_BUTTON', 'it-IT', '🔄 Nuovo QR'),
  ('ADMIN_MESAS_NEW_QR_BUTTON', 'es-ES', '🔄 Nuevo QR'),
  ('ADMIN_MESAS_NEW_QR_BUTTON', 'ar-MA', '🔄 رمز QR جديد'),

  ('ADMIN_MESAS_REMOVE_BUTTON', 'pt-BR', '🗑️ Remover'),
  ('ADMIN_MESAS_REMOVE_BUTTON', 'pt-PT', '🗑️ Remover'),
  ('ADMIN_MESAS_REMOVE_BUTTON', 'en-US', '🗑️ Remove'),
  ('ADMIN_MESAS_REMOVE_BUTTON', 'it-IT', '🗑️ Rimuovi'),
  ('ADMIN_MESAS_REMOVE_BUTTON', 'es-ES', '🗑️ Eliminar'),
  ('ADMIN_MESAS_REMOVE_BUTTON', 'ar-MA', '🗑️ إزالة'),

  ('ADMIN_MESAS_REMOVED', 'pt-BR', 'Mesa removida.'),
  ('ADMIN_MESAS_REMOVED', 'pt-PT', 'Mesa removida.'),
  ('ADMIN_MESAS_REMOVED', 'en-US', 'Table removed.'),
  ('ADMIN_MESAS_REMOVED', 'it-IT', 'Tavolo rimosso.'),
  ('ADMIN_MESAS_REMOVED', 'es-ES', 'Mesa eliminada.'),
  ('ADMIN_MESAS_REMOVED', 'ar-MA', 'تمت إزالة الطاولة.'),

  ('ADMIN_MESAS_QR_GENERATED', 'pt-BR', 'Novo QR code gerado!'),
  ('ADMIN_MESAS_QR_GENERATED', 'pt-PT', 'Novo código QR gerado!'),
  ('ADMIN_MESAS_QR_GENERATED', 'en-US', 'New QR code generated!'),
  ('ADMIN_MESAS_QR_GENERATED', 'it-IT', 'Nuovo codice QR generato!'),
  ('ADMIN_MESAS_QR_GENERATED', 'es-ES', '¡Nuevo QR code generado!'),
  ('ADMIN_MESAS_QR_GENERATED', 'ar-MA', 'تم إنشاء رمز QR جديد!'),

  ('ADMIN_MESAS_QR_ERROR', 'pt-BR', 'Erro ao regenerar QR code.'),
  ('ADMIN_MESAS_QR_ERROR', 'pt-PT', 'Erro ao regenerar código QR.'),
  ('ADMIN_MESAS_QR_ERROR', 'en-US', 'Error regenerating QR code.'),
  ('ADMIN_MESAS_QR_ERROR', 'it-IT', 'Errore rigenerazione QR code.'),
  ('ADMIN_MESAS_QR_ERROR', 'es-ES', 'Error al regenerar QR code.'),
  ('ADMIN_MESAS_QR_ERROR', 'ar-MA', 'خطأ في إعادة إنشاء رمز QR.'),

  ('ADMIN_MESAS_REMOVE_ERROR', 'pt-BR', 'Erro ao remover mesa.'),
  ('ADMIN_MESAS_REMOVE_ERROR', 'pt-PT', 'Erro ao remover mesa.'),
  ('ADMIN_MESAS_REMOVE_ERROR', 'en-US', 'Error removing table.'),
  ('ADMIN_MESAS_REMOVE_ERROR', 'it-IT', 'Errore rimozione tavolo.'),
  ('ADMIN_MESAS_REMOVE_ERROR', 'es-ES', 'Error al eliminar mesa.'),
  ('ADMIN_MESAS_REMOVE_ERROR', 'ar-MA', 'خطأ في إزالة الطاولة.'),

  ('ADMIN_MESAS_CONFIRM_REMOVE', 'pt-BR', 'Remover "{{name}}"? Esta ação não pode ser desfeita.'),
  ('ADMIN_MESAS_CONFIRM_REMOVE', 'pt-PT', 'Remover "{{name}}"? Esta ação não pode ser desfeita.'),
  ('ADMIN_MESAS_CONFIRM_REMOVE', 'en-US', 'Remove "{{name}}"? This action cannot be undone.'),
  ('ADMIN_MESAS_CONFIRM_REMOVE', 'it-IT', 'Rimuovere "{{name}}"? Questa azione non può essere annullata.'),
  ('ADMIN_MESAS_CONFIRM_REMOVE', 'es-ES', '¿Eliminar "{{name}}"? Esta acción no se puede deshacer.'),
  ('ADMIN_MESAS_CONFIRM_REMOVE', 'ar-MA', 'إزالة "{{name}}"؟ لا يمكن التراجع عن هذا الإجراء.'),

  ('ADMIN_MESAS_CONFIRM_REGEN', 'pt-BR', 'Gerar novo QR code para "{{name}}"? O QR code antigo deixará de funcionar.'),
  ('ADMIN_MESAS_CONFIRM_REGEN', 'pt-PT', 'Gerar novo código QR para "{{name}}"? O código QR antigo deixará de funcionar.'),
  ('ADMIN_MESAS_CONFIRM_REGEN', 'en-US', 'Generate a new QR code for "{{name}}"? The old QR code will stop working.'),
  ('ADMIN_MESAS_CONFIRM_REGEN', 'it-IT', 'Generare un nuovo QR code per "{{name}}"? Il QR code precedente smetterà di funzionare.'),
  ('ADMIN_MESAS_CONFIRM_REGEN', 'es-ES', '¿Generar nuevo QR code para "{{name}}"? El QR code anterior dejará de funcionar.'),
  ('ADMIN_MESAS_CONFIRM_REGEN', 'ar-MA', 'إنشاء رمز QR جديد لـ "{{name}}"؟ رمز QR القديم سيتوقف عن العمل.'),

  -- ==========================================================
  -- MODAL DE QR CODE DA MESA
  -- ==========================================================
  ('ADMIN_MESAS_QR_SCAN_HINT', 'pt-BR', 'Mesa {{number}} — escaneie para pedir'),
  ('ADMIN_MESAS_QR_SCAN_HINT', 'pt-PT', 'Mesa {{number}} — escaneie para fazer pedido'),
  ('ADMIN_MESAS_QR_SCAN_HINT', 'en-US', 'Table {{number}} — scan to order'),
  ('ADMIN_MESAS_QR_SCAN_HINT', 'it-IT', 'Tavolo {{number}} — scannerizza per ordinare'),
  ('ADMIN_MESAS_QR_SCAN_HINT', 'es-ES', 'Mesa {{number}} — escanea para pedir'),
  ('ADMIN_MESAS_QR_SCAN_HINT', 'ar-MA', 'طاولة {{number}} — امسح للطلب'),

  ('ADMIN_MESAS_PRINT', 'pt-BR', '🖨️ Imprimir'),
  ('ADMIN_MESAS_PRINT', 'pt-PT', '🖨️ Imprimir'),
  ('ADMIN_MESAS_PRINT', 'en-US', '🖨️ Print'),
  ('ADMIN_MESAS_PRINT', 'it-IT', '🖨️ Stampa'),
  ('ADMIN_MESAS_PRINT', 'es-ES', '🖨️ Imprimir'),
  ('ADMIN_MESAS_PRINT', 'ar-MA', '🖨️ طباعة')

) AS v(chave, codigo_idioma, valor)
JOIN sistemas s ON s.codigo = 'website'
JOIN idiomas i ON i.codigo = v.codigo_idioma
ON CONFLICT (chave, sistema_id, idioma_id)
DO UPDATE SET valor = EXCLUDED.valor, atualizado_em = NOW();
