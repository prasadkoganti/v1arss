DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN

    ORDS.ENABLE_SCHEMA(p_enabled => TRUE,
                       p_schema => 'VBCS_ADMIN',
                       p_url_mapping_type => 'BASE_PATH',
                       p_url_mapping_pattern => 'vbcs_admin',
                       p_auto_rest_auth => FALSE);

    commit;

END;