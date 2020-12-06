DROP USER vbcs_admin CASCADE;

CREATE USER vbcs_admin IDENTIFIED BY "5eagateFinanace";

GRANT
    CREATE USER,
    ALTER USER,
    DROP USER,
    CREATE PROFILE
TO vbcs_admin WITH ADMIN OPTION;

GRANT connect TO vbcs_admin WITH ADMIN OPTION;

GRANT resource TO vbcs_admin WITH ADMIN OPTION;

GRANT
    CREATE SEQUENCE,
    CREATE OPERATOR,
    CREATE SESSION,
    ALTER SESSION,
    CREATE PROCEDURE,
    CREATE VIEW,
    CREATE JOB,
    CREATE DIMENSION,
    CREATE INDEXTYPE,
    CREATE TYPE,
    CREATE TRIGGER,
    CREATE TABLE,
    CREATE PROFILE
TO vbcs_admin WITH ADMIN OPTION;

GRANT
    UNLIMITED TABLESPACE
TO vbcs_admin WITH ADMIN OPTION;

GRANT SELECT ON sys.dba_profiles TO vbcs_admin WITH GRANT OPTION;

GRANT SELECT ON sys.dba_users TO vbcs_admin WITH GRANT OPTION;

GRANT SELECT ON sys.dba_data_files TO vbcs_admin WITH GRANT OPTION;

GRANT SELECT ON sys.dba_segments TO vbcs_admin WITH GRANT OPTION;