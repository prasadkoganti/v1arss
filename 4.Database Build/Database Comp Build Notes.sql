3292865
GP Strategies Training Limited
NON NHS OTHER

origsysbillcustomerref - 11i-CUSTACCT-3344160
origsysbilladdressref - 11i-CUSTACCT-SITE-369962

select * from ra_customer_trx_all where trx_number = '3292865'

select distinct load_request_id from ra_interface_lines_all where created_by = 'techtutorsti@gmail.com'

select * from ra_interface_lines_all where trx_number = '10046'

select * from ra_interface_distributions_all where interface_line_attribute1 = '10046'

select * from ra_interface_salescredits_all where interface_line_attribute1 = '10046'


select hca.orig_system_reference from hz_cust_accounts hca,hz_cust_acct_sites_all hcas 
where hca.account_number ='34743' and hca.cust_account_id = hcas.cust_account_id

select hca.orig_system_reference orig_system_bill_customer_ref,hcas.orig_system_reference orig_system_bill_address_ref 
from hz_cust_accounts hca,hz_cust_acct_sites_all hcas 
where hca.account_number ='34743' and hca.cust_account_id = hcas.cust_account_id

cloudoic12

https://docs.oracle.com/en/cloud/paas/app-builder-cloud/abcag/administrative-tasks1.html#GUID-AE853818-5538-43EF-8EDC-0D917663FC75

admin
5eagateFinanace

$chain.results.loadInvoiceHeader.headers.get('ETag')

https://foizja9l9puedqg-gsttadwdev.adb.uk-london-1.oraclecloudapps.com/ords/arss/_sdw/?nav=worksheet

https://foizja9l9puedqg-gsttadwdev.adb.uk-london-1.oraclecloudapps.com/ords/admin/_sdw/?nav=worksheet

https://gsttoictest-frv08jeksq3g-ld.integration.ocp.oraclecloud.com/ic/builder/?root=settings


SELECT
    description,
    quantity,
    unitprice,
    taxcode,
    organization
    || '.'
    || costcentre
    || '.'
    || subjective
    || '.'
    || wga
    || '.'
    || intercompany
    || '.'
    || analysis
    || '.'
    || spare1
    || '.'
    || spare2 code_combination
FROM
    vb_vb_istvpkfgk4j.invoiceline l,
    vb_vb_istvpkfgk4j.invoicedistribution d
WHERE
    l.invoiceheaderid = 1000006
    AND l.invoiceheaderid = d.invoiceheaderid
    AND l.id = d.invoicelineid;
	
	
admin
Pkug@18112020

VB_VB_EWQCM44QFWH
Pkug@18112020

BEGIN
  ORDS.define_service(
    p_module_name    => 'rest-v1',
    p_base_path      => 'rest-v1/',
    p_pattern        => 'employees/',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_collection_feed,
    p_source         => 'SELECT * FROM emp',
    p_items_per_page => 0);

  COMMIT;
END;
/

https://pndvtmyn7kjzjau-db202011180647.adb.ap-hyderabad-1.oraclecloudapps.com/ords/admin/rest-v1/employees/

BEGIN
  ORDS.define_service(
    p_module_name    => 'rest-v1',
    p_base_path      => 'rest-v1/',
    p_pattern        => 'employees/',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_collection_feed,
    p_source         => 'SELECT * FROM VB_VB_EWQCM44QFWH.INVOICEHEADER',
    p_items_per_page => 0);

  COMMIT;
END;
/

https://pndvtmyn7kjzjau-db202011180647.adb.ap-hyderabad-1.oraclecloudapps.com/ords/admin/rest-v1/employees/

BEGIN
  ORDS.define_service(
    p_module_name    => 'VbcsRestApi',
    p_base_path      => 'VbcsRestApi/',
    p_pattern        => 'invoices/',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_collection_feed,
    p_source         => 'SELECT * FROM VB_VB_EWQCM44QFWH.INVOICEHEADER',
    p_items_per_page => 0);

  COMMIT;
END;
/

https://pndvtmyn7kjzjau-db202011180647.adb.ap-hyderabad-1.oraclecloudapps.com/ords/admin/VbcsRestApi/invoices/

/VbcsRestApi/resources/11.13.18.05/cashBanks/{BankPartyId}

CREATE OR REPLACE PROCEDURE update_invoice (
    p_invoice_id IN NUMBER
) AS
BEGIN
    UPDATE vb_vb_ewqcm44qfwh.invoiceheader
    SET
        reconciliationreference = 'DEF'
    WHERE
        id = p_invoice_id;
        COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        htp.print(sqlerrm);
END;
/

BEGIN
  ORDS.define_module(
    p_module_name    => 'update',
    p_base_path      => 'update/',
    p_items_per_page => 0);
  
  ORDS.define_template(
   p_module_name    => 'update',
   p_pattern        => 'invoices/');

  ORDS.define_handler(
    p_module_name    => 'update',
    p_pattern        => 'invoices/',
    p_method         => 'PUT',
    p_source_type    => ORDS.source_type_plsql,
    p_source         => 'BEGIN
                           update_invoice(p_invoice_id    => :invoice_id);
                         END;',
    p_items_per_page => 0);

  COMMIT;
END;
/

https://pndvtmyn7kjzjau-db202011180647.adb.ap-hyderabad-1.oraclecloudapps.com/ords/admin/update/invoices/

raw_payload:

{ "invoice_id": 1 }

COLUMN source_type FORMAT A15
COLUMN source FORMAT A20

https://oracle-base.com/articles/misc/oracle-rest-data-services-ords-create-basic-rest-web-services-using-plsql

https://pndvtmyn7kjzjau-db202011180647.adb.ap-hyderabad-1.oraclecloudapps.com/ords/

https://pndvtmyn7kjzjau-db202011180647.adb.ap-hyderabad-1.oraclecloudapps.com/ords/admin/soda/latest/fruit

https://youtu.be/9w02aiOoSvA

https://www.youtube.com/watch?v=9w02aiOoSvA

https://PNDVTMYN7KJZJAU-DB202011180647.adb.ap-hyderabad-1.oraclecloudapps.com/ords/hr/module/service/

https://PNDVTMYN7KJZJAU-DB202011180647.adb.ap-hyderabad-1.oraclecloudapps.com/ords/hr/module/service/

https://docs.oracle.com/en/cloud/paas/atp-cloud/atpug/ords-rest.html#GUID-3D237239-2239-45A1-A77D-1028CD18F83A

https://docs.oracle.com/en/database/oracle/oracle-rest-data-services/19.4/qsord/get-started-with-oracle-rest-data-services.html#GUID-4F651A96-1E4F-4048-AE70-3136AC2A409A

The password for the wallet is

password - Hiraksquare@93

 

Database Login details are

username - ADMIN

password - Hiraksquare@93

same password is for both database and admin schema

Pkug@18112020

Pkug@18112020Wal1

https://docs.oracle.com/en/cloud/paas/app-builder-cloud/abcag/administrative-tasks1.html#GUID-AE853818-5538-43EF-8EDC-0D917663FC75

DROP USER vbcsadmin CASCADE;
CREATE USER vbcsadmin IDENTIFIED BY "Pkug@18112020";
GRANT CREATE USER, ALTER USER, DROP USER, CREATE PROFILE TO vbcsadmin WITH ADMIN OPTION;
GRANT CONNECT TO vbcsadmin WITH ADMIN OPTION;
GRANT RESOURCE TO vbcsadmin WITH ADMIN OPTION;
GRANT CREATE SEQUENCE, CREATE OPERATOR, CREATE SESSION,ALTER SESSION, CREATE PROCEDURE, CREATE VIEW, CREATE JOB,CREATE DIMENSION,CREATE INDEXTYPE,CREATE TYPE,CREATE TRIGGER,CREATE TABLE,CREATE PROFILE TO vbcsadmin WITH ADMIN OPTION;
GRANT UNLIMITED TABLESPACE TO vbcsadmin WITH ADMIN OPTION;
GRANT SELECT ON SYS.DBA_PROFILES TO vbcsadmin WITH GRANT OPTION;
GRANT SELECT ON SYS.DBA_USERS TO vbcsadmin WITH GRANT OPTION;
GRANT SELECT ON SYS.DBA_DATA_FILES TO vbcsadmin WITH GRANT OPTION;
GRANT SELECT ON SYS.DBA_SEGMENTS TO vbcsadmin WITH GRANT OPTION;


select * from all_users where username = 'vbcsadmin';
