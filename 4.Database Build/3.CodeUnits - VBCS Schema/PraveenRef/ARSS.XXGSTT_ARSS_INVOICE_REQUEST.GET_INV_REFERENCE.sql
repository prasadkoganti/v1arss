BEGIN
  ORDS.define_module(
    p_module_name    => 'rest-v1',
    p_base_path      => 'rest-v1/',
    p_items_per_page => 0);
  
  ORDS.define_template(
   p_module_name    => 'rest-v1',
   p_pattern        => 'ARSS/XXGSTT_ARSS_INVOICE_REQUEST/GET_INV_REFERENCE');

  ORDS.define_handler(
    p_module_name    => 'rest-v1',
    p_pattern        => 'ARSS/XXGSTT_ARSS_INVOICE_REQUEST/GET_INV_REFERENCE',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_plsql,
    p_source         => 'BEGIN XXGSTT_ARSS_INVOICE_REQUEST.GET_INV_REFERENCE; END;',
    p_items_per_page => 0);
    
  ORDS.define_template(
   p_module_name    => 'rest-v1',
   p_pattern        => 'ARSS/XXGSTT_ARSS_INVOICE_REQUEST/GET_INV_REFERENCE/:requestor');

  ORDS.define_handler(
    p_module_name    => 'rest-v1',
    p_pattern        => 'ARSS/XXGSTT_ARSS_INVOICE_REQUEST/GET_INV_REFERENCE/:requestor',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_plsql,
    p_source         => 'BEGIN XXGSTT_ARSS_INVOICE_REQUEST.GET_INV_REFERENCE(:requestor); END;',
    p_items_per_page => 0);
    
  COMMIT;
END;
/