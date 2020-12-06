DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN

    ORDS.ENABLE_SCHEMA(p_enabled => TRUE,
                       p_schema => 'ARSS',
                       p_url_mapping_type => 'BASE_PATH',
                       p_url_mapping_pattern => 'arss',
                       p_auto_rest_auth => TRUE);

    commit;

END;