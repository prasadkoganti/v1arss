XXGSTT AR Invoice Interface
XXGSTT_AR_INVOICE_INTERFACE
This integration loads AR Invoices from VBCS AR Self Service App to ERP Receivables Cloud
vbcs.arselfservice.pkg

RaInterfaceSalesCreditsAll.csv

XXGSTT AR Invoice Callback Interface
XXGSTT_AR_INV_CALLBACK_INTERFACE
This callback integration captures status of invoice creation in ERP Cloud
vbcs.arselfservice.pkg

select FBDI_STRING from xxgstt_arss_inv_req_salescredits_int where oic_flow_id = #oic_flow_id

getPropertyLineFBDIString

ArAutoinvoiceImport.properties



concat(concat("ArAutoinvoiceImport_",$self/nsmpr6:metadata/nsmpr6:runtime/nsmpr6:instanceId),".zip")

select '/oracle/apps/ess/financials/receivables/transactions/autoInvoices,AutoInvoiceImportEss,ArAutoinvoiceImport,
#NULL,#NULL,#NULL,#NULL,#NULL,#NULL,#NULL,INVOICE' 
propfbdistring from vb_vb_istvpkfgk4j.invoiceheader;

GetInvoiceDetails: /InvoiceHeader/{InvoiceHeader_Id}

GetInvoiceLines: /InvoiceHeader/{InvoiceHeader_Id}/child/invoiceLineCollection2

GetInvoiceDistributions: /InvoiceHeader/{InvoiceHeader_Id}/child/invoiceDistributionColl

https://oicsan-cloudoic12.integration.ocp.oraclecloud.com:443/ic/builder/design/GSTT_AR_Self_Service_Invoice_App/1.0/resources/data

/InvoiceHeader/1/child/invoiceLineCollection2
            

XXGSTT AR Invoice Rest Trigger

XXGSTT VBCS Rest API
https://gsttoicdev-frv08jeksq3g-ld.integration.ocp.oraclecloud.com/ic/builder/design/GSTT_AR_Self_Service_Invoice_App/1.0/resources/data

https://gsttoicdev-frv08jeksq3g-ld.integration.ocp.oraclecloud.com/ic/builder/design/GSTT_AR_Self_Service_Invoice_App/1.0/resources/data/InvoiceHeader

https://gsttoicdev-frv08jeksq3g-ld.integration.ocp.oraclecloud.com/ic/builder/rt/GSTT_AR_Self_Service_Invoice_App/1.0/resources/data/InvoiceHeader

https://gsttoicdev-frv08jeksq3g-ld.integration.ocp.oraclecloud.com/ic/builder/rt/GSTT_AR_Self_Service_Invoice_App/live/resources/data/InvoiceHeader

GSTT Business Unit - 300000001633228
ETL Business Unit - 300000001633231

https://oicsan-cloudoic12.integration.ocp.oraclecloud.com/ic/builder/design/GSTT_AR_Self_Service_Invoice_App/1.0/resources/data

select rct.trx_number from ra_customer_trx_all rct, hr_operating_units hr 
where rct.org_id= hr.organization_id and hr.name = 'ETL Business Unit'

select * from ra_customer_trx_all where trx_number = '3171120'--'3290846'

select * from hz_cust_accounts where account_number = '34743'

It is possible to edit the select and put fn:format-number(number,format)
ex)
select="fn:format-number(<some number>,'##.0' )"/>

3290846

GSTT Business Unit
DM - Invoice

RJ1-900000-22010-000000-000-000000-000000-000000
RJ1-900000-25700-000000-000-000000-000000-000000

RJ1-900000-22010-000000-000-000000-000000-000000
RJ1-900000-25700-000000-000-000000-000000-000000

https://docs.oracle.com/en/cloud/saas/financials/20c/oefbf/receivables.html#receivables

"/Invoice"


00ANTILEPILEPTIC

Medicure Ltd

Organization RJ1
Cost Centre	900000
Subjective	25700
WGA	000000
Intercompany 000
Analysis  000000
Spare1 000000
Spare2 000000
