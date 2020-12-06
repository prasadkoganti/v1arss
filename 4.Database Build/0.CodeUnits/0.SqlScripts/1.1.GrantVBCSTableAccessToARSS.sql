DECLARE
    CURSOR c1 IS SELECT
                     table_name
                 FROM
                     all_tables
                 WHERE
                     owner = 'VB_VB_ISTVPKFGK4J';

    cmd   VARCHAR2(200);
BEGIN
    FOR c IN c1 LOOP
        cmd := 'GRANT ALL ON VB_VB_ISTVPKFGK4J.'
               || c.table_name
               || ' TO ARSS';
        EXECUTE IMMEDIATE cmd;
    END LOOP;
END;