Pending:
Trx Number Seq Pattern
Rev, tax and rec account derivation logic


Discussion Points:

FTP Connection not working

What transaction source needs to be used for ARSS invoices?

Trx Numbering Discussion?

Invoice Approval History in new Page?

We need to have context defined on transaction line DFF - ARSS Income Request Import - with 4 attributes
Invoice Reference, Invoice Header Id, Invoice Line Id, Flow Id

Do we need to load distribution record for tax line as well? If yes, how to derive the account segments?

Currently i have hardcoded the distribution account segments. How to derive them?

Analysis and Spare segments should be updatebale - 000000
Organization is parking lot - Derive based on BU - 
Cost centre from sales person
Income from memo lines
WGA code is from customer/charity/acl
Analysis is updatable
Intercompany from customer
Spare is default 0000 and updatable

Rev => Probably from Data mapping tables
Rec => Table -> Data Sync
Tax => Probably from Data mapping tables

Desc Procedure


***************************************************

GSTT SFTP:

138.1.16.137
5022
GSTT_SFTP
Welcome12345

/INBOUND/arss/input

/INBOUND/arss/archive

***************************************************

Copy Request:

[[ $page.variables.oj_table_1084591017_1SelectedId === '' 
|| $page.variables.selectedInvStatus === 'ENTERED'
|| $page.variables.selectedInvStatus === 'SUBMITTED' 
|| $page.variables.selectedInvStatus === 'APPROVED'  
|| $page.variables.selectedInvStatus === 'REJECTED'
|| $page.variables.selectedInvStatus === 'ERRORED' ]]

or

[[ $page.variables.oj_table_1084591017_1SelectedId === '' 
|| $page.variables.selectedInvStatus !== 'COMPLETE']]

Edit/Delete Request:

[[ $page.variables.oj_table_1084591017_1SelectedId === '' 
|| $page.variables.selectedInvStatus !== 'ENTERED'
|| ]]

***************************************************

Distribution Total - remoce allocation percentage:

[[ ($page.variables.invoiceDistribution.allocationAmount+$page.variables.invoiceLineDisTotalAmtVarPass)<=$page.variables.invoiceLineAmtVarPass]]

{{ ($variables.invoiceDistribution.allocationPercentage && $variables.invoiceDistribution.lineAmount) ? ($variables.invoiceDistribution.allocationPercentage * $variables.invoiceDistribution.lineAmount * .01 ) : 0 }}

{{ ($variables.invoiceDistribution.allocationPercentage && $variables.invoiceDistribution.lineAmount) ? ($variables.invoiceDistribution.allocationPercentage * $variables.invoiceDistribution.lineAmount * .01 ) : 0 }}

[[ ($page.variables.invoiceDistribution.allocationAmount+$page.variables.invoiceLineDisTotalAmtVarPass)<=$page.variables.invoiceLineAmtVarPass]]

<oj-input-number label-hint="Allocation Amount" converter='{"options":{"maximumFractionDigits":2,"decimalFormat":"short"},"type":"number"}' max="[[ $variables.invoiceDistribution.lineAmount ]]" min="1"></oj-input-number>

***************************************************

Distribution Account Pick Up:

https://oracle-base.com/articles/misc/apex_json-package-generate-and-parse-json-documents-in-oracle

SET SERVEROUTPUT ON

DECLARE
    l_cursor SYS_REFCURSOR;
BEGIN
    OPEN l_cursor FOR SELECT
                          i.id                 AS "invid",
                          i.currentapprover    AS "currentapprover"
                      FROM
                          vb_vb_istvpkfgk4j.invoiceheader i
                      WHERE
                          i.id = 1000015;

    apex_json.initialize_clob_output;
    apex_json.open_object;
    apex_json.write('employees', l_cursor);
    apex_json.close_object;
    dbms_output.put_line(apex_json.get_clob_output);
    apex_json.free_output;
END;
/

{
 "organizationRef": 1,
 "organization": "RJ1",
 "costCentreRef": 1,
 "costCentre": "900000",
 "subjective": "22010",
 "subjectiveRef": "1",
 "wGA": "000000",
 "wgaRef": "1",
 "intercompany": "000",
 "intercompanyRef": 1,
 "analysis": "000000",
 "analysisRef": "1",
 "spare1": "000000",
 "spare1Ref": "1",
 "spare2": "000000",
 "spare2Ref": "1",
 "lineAmount": "{{ $page.variables.invoiceLineAmtVarPass }}",
 "allocationAmount": "{{ $page.variables.invoiceLineAmtVarPass }}"
} 

Changed to 



***************************************************

select * from ra_customer_trx_all where creation_date >sysdate-7 and CREATED_FROM <> 'CreatedFromUI'

https://www.google.com/url?q=https://teams.microsoft.com/l/meetup-join/19%253ameeting_ZDc2ODQ0OWUtYThmNy00OTRkLWI2NDEtMTZiMmY5ZTBjMTQw%2540thread.v2/0?context%3D%257b%2522Tid%2522%253a%25223e0088dc-0629-4ae6-aa8c-813e7a296f50%2522%252c%2522Oid%2522%253a%2522a48ab598-f288-44de-9383-fa7fae82459a%2522%257d&sa=D&source=calendar&usd=2&usg=AOvVaw3T1BaBWomv25xpfU9wtFAO

https://docs.oracle.com/en/cloud/paas/integration-cloud/user-processes/customize-notification-emails-human-tasks.html#GUID-F06A3E08-ED1C-4316-A59D-38C9D3503925

Get FBDI Callback privileges assign to user

https://blogs.oracle.com/imc/subscribe-to-business-events-in-fusion-based-saas-applications-from-oracle-integration-cloud-oic-part-1-prerequisites 

Set Ups:

Integration Specialist

OIC_INTEGRATION_ROLE:
FND_MANAGE_CATALOG_SERVICE_PRIV Priv
AttachmentsUser role

CSF Key:

https://fa-eqjv-dev1-saasfaprod1.fa.ocs.oraclecloud.com/soa/composer

idcs-76c8b719dcd7451fb064dcf01cd70f28GSTTOICDEV
shiva.yarlagadda89@gmail.com
Version1@363412

 $page.variables.referenceCond ? $page.variables.referenceCond : $page.variables.invoiceHeaderListSDP2.invoiceReference

{
 "filterCriterion": {
  "criteria": [
   "{{ $page.variables.referenceCond}}",
   "{{ $page.variables.statusCond }}",
   "{{ $page.variables.customerCond }}",
   "{{ $page.variables.requestorCond }}",
   "{{ $page.variables.lastupdateCond }}",
   "{{ $page.variables.transactiontotalCond }}"
  ],
  "op": "$and"
 }
}

Distribution Amount Validations

[[ ($page.variables.invoiceDistribution.allocationAmount+$page.variables.invoiceLineDisTotalAmtVarPass)<=$page.variables.invoiceLineAmtVarPass]]

Edit Distribution Amount Validation

[[ ($page.variables.invoiceLineDisTotalAmtVarPass-$page.variables.oldDistributionAllocationAmount+$page.variables.invoiceDistribution.allocationAmount)<=$page.variables.invoiceLineAmtVarPass]]

[[ "invoiceLineDisTotalAmtVarPass " +$page.variables.invoiceLineDisTotalAmtVarPass + " oldDistributionAllocationAmount " +$page.variables.oldDistributionAllocationAmount + " allocationAmount " +$page.variables.invoiceDistribution.allocationAmount + " invoiceLineAmtVarPass " +$page.variables.invoiceDistribution.invoiceLineAmtVarPass]]

invoiceLineDisTotalAmtVarPass 100 oldDistributionAllocationAmount 100 allocationAmount 98 invoiceLineAmtVarPass undefined

With Tax:

{{ ($variables.invoiceLine.quantity && $variables.invoiceLine.unitPrice && $variables.invoiceLine.taxRate ) ? ($variables.invoiceLine.quantity * $variables.invoiceLine.unitPrice * (1+($variables.invoiceLine.taxRate * .01))) : 0 }}

$page.variables.invoiceLine.quantity * $page.variables.invoiceLine.unitPrice * (1+($page.variables.invoiceLine.taxRate*.01))

Without Tax:

{{ ($variables.invoiceLine.quantity && $variables.invoiceLine.unitPrice && $variables.invoiceLine.taxRate ) ? ($variables.invoiceLine.quantity * $variables.invoiceLine.unitPrice ) : 0 }}

$page.variables.invoiceLine.quantity * $page.variables.invoiceLine.unitPrice * (1+($page.variables.invoiceLine.taxRate*.01))


[[ $variables.invoiceHeader.status !== "ENTERED" ]]

disabled='[[ $variables.invoiceHeader.status !== "ENTERED" ]]'

[[ $page.variables.oj_table_1084591017_1SelectedId === '' || ]]

DELETE INVOICE: 

[[ $page.variables.oj_table_1084591017_1SelectedId === '' 
|| $page.variables.selectedInvStatus === 'SUBMITTED' 
|| $page.variables.selectedInvStatus === 'APPROVED'  
|| $page.variables.selectedInvStatus === 'COMPLETE'
|| $page.variables.selectedInvStatus === 'ERRORED' ]]

[[ $page.variables.oj_table_1084591017_1SelectedId === '' 
|| $page.variables.selectedInvStatus !== 'ENTERED' 
|| $page.variables.selectedInvStatus !== 'REJECTED' ]]

DUPLICATE INVOICE: 

[[ $page.variables.oj_table_1084591017_1SelectedId === '' 
|| $page.variables.selectedInvStatus === 'ENTERED'
|| $page.variables.selectedInvStatus === 'SUBMITTED' 
|| $page.variables.selectedInvStatus === 'APPROVED'  
|| $page.variables.selectedInvStatus === 'REJECTED'
|| $page.variables.selectedInvStatus === 'ERRORED' ]]

EDIT INVOICE:

[[ $page.variables.oj_table_1084591017_1SelectedId === '' || $page.variables.selectedInvStatus !== 'ENTERED' ]]



https://blogs.oracle.com/vbcs/processes-in-vbcs-applications-creating-and-launching-a-process

approvalHierarchySDP

<oj-select-one value="{{ $page.variables.invoiceHeader.transactionTypeRef }}" readonly="false" label-hint="Transaction Type" required="true" options="[[ $page.variables.transactionTypeListSDP ]]" options-keys.value="id" options-keys.label="name"></oj-select-one>
<oj-select-one value="{{ $page.variables.invoiceHeader.requestorName }}" readonly="false" label-hint="Requestor Name" required="true" options="[[ $page.variables.approvalHierarchySDP ]]" options-keys.value="id" options-keys.label="requestor"></oj-select-one>


<oj-select-one label-hint="Requestor Name" value="{{ $page.variables.invoiceHeader.requestorName }}" options="[[ $page.variables.approvalHierarchySDP ]]"></oj-select-one>

<oj-input-text value="{{ $page.variables.invoiceHeader.requestorName }}" label-hint="Requestor Name" required="true"></oj-input-text>

{{ $application.user.username }}    

{{ $application.user.email }} 

ENTERED
SUBMITTED

APPROVED
REJECTED

COMPLETE
ERRORED

[[ $page.variables.oj_table_1084591017_1SelectedId === '']]

"reset": "none",
              "mapping": {
                "$target.filterCriterion": {
                  "source": "$source.filterCriterion",
                  "reset": "empty"
                }
              }
			  
{
 "filterCriterion": {
  "criteria": [
   "{{ $page.variables.referenceCond }}",
   "{{ $page.variables.statusCond }}",
   "{{ $page.variables.customerCond }}"
  ],
  "op": "$and"
 }
}			  

https://blogs.oracle.com/shay/filtering-data-providers-with-compound-conditions-in-visual-builders

{
 "filterCriterion": {
  "criteria": [
   "{{ $page.variables.referenceCond }}",
   "{{ $page.variables.statusCond }}"
  ],
  "op": "$and"
 }
}

[[ $variables.invoiceHeader.status !== "ENTERED" ]]

disabled='[[ $variables.invoiceHeader.status !== "ENTERED" ]]'

$variables.invoiceHeader.status !== "ENTERED"

[[$page.variables.invoiceHeaderListSDP.status !=== "ENTERED" ]]

DELETE:

Delete transactions which are not in status of SUBMITTED or COMPLETE

$page.variables.oj_table_1084591017_1SelectedId === '' || $page.variables.selectedInvStatus === 'SUBMITTED' || $page.variables.selectedInvStatus === 'COMPLETE'

<oj-button disabled="[[ $page.variables.oj_table_1084591017_1SelectedId === '' && $page.variables.invoiceHeaderListSDP.status !== 'ENTERED' ]]" on-oj-action="[[$page.listeners.deleteInvoiceHeaderButtonClicked]]">Delete</oj-button>

Access Required:

OIC Instance

A0136784
JAMES JUSTICE

Naming Conventions? 

GSTT AR Self Service Invoice App
GSTT_AR_Self_Service_Invoice_App

Consuming ORDS Services in Visual Builder
https://www.youtube.com/watch?v=1CjqdW_Qdqc	

$page.variables.invoiceHeaderId


[[ $chain.variables.value !== undefined]]

{{$page.variables.invoiceHeaderIdVarPass}}

{{$page.variables.invoiceLineIdVarPass}}

{{$page.variables.invoiceLineAmountVarPass}}

{{$page.variables.invoiceLineIdPassVar}}

{{$page.variables.invoiceHeaderIdPassVarDis}}

{{ $page.variables.invoiceLine.amount }}

{{ ($variables.invoiceLine.unitPrice  &&  }}

$variables.invoiceLine.taxRate

{{ ($variables.invoiceLine.quantity && $variables.invoiceLine.unitPrice && $variables.invoiceLine.taxRate ) ? (($variables.invoiceLine.quantity * $variables.invoiceLine.unitPrice * $variables.invoiceLine.taxRate)/100) : 0 }}

[
 {
  "attribute": "{{ $variables.invoiceHeaderListSDP2.idAttribute }}",
  "direction": "descending"
 }
]
ascending

{{ ($variables.invoiceLine.quantity && $variables.invoiceLine.unitPrice && $variables.invoiceLine.taxRate ) ? ($variables.invoiceLine.quantity * $variables.invoiceLine.unitPrice * (1+($variables.invoiceLine.taxRate * .01))) : 0 }}

Mapping:

{
 "amount": "{{ $page.variables.invoiceLine.quantity * $page.variables.invoiceLine.unitPrice * (1+($page.variables.invoiceLine.taxRate * .01)) }}"
}


$page.variables.invoiceLine.quantity * $page.variables.invoiceLine.unitPrice * (1+($page.variables.invoiceLine.taxRate*.01))

$page.variables.invoiceLine.quantity && $page.variables.invoiceLine.unitPrice && $page.variables.invoiceLine.taxRate ) ? 
 ($page.variables.invoiceLine.quantity * $page.variables.invoiceLine.unitPrice * (1+($page.variables.invoiceLine.taxRate * .01)))
 
{{ ($variables.receivablesInvoiceLine.Quantity && $variables.receivablesInvoiceLine.UnitSellingPrice) ? $variables.receivablesInvoiceLine.Quantity * $variables.receivablesInvoiceLine.UnitSellingPrice : 0 }}

[[ $page.variables.invoiceLine.taxCode  !== undefined]]



Distributions Join

{{ ($variables.invoiceDistribution.allocationPercentage && $variables.invoiceDistribution.lineAmount) ? ($variables.invoiceDistribution.allocationPercentage * $variables.invoiceDistribution.lineAmount * .01 ) : 0 }}

$page.variables.invoiceDistribution.allocationPercentage*$page.variables.invoiceDistribution.lineAmount*.01


1001745

101.10.12101.000.000.000

https://docs.oracle.com/en/cloud/paas/integration-cloud/visual-developer/create-and-edit-business-objects.html#GUID-AC4674BD-F810-4A6D-863F-71C9D9302E20


ProcessInterfaceLine Web Service For Populating Ra_interface_lines with interface transaction line DFF Values (Doc ID 2465443.1)

Fusion Accounts Receivables Web services (Doc ID 2475053.1)

https://ucf1-zsdg-fa-ext.oracledemos.com/fscmService/RecInvoiceService?WSDL

select * from ra_customer_trx_all where trx_number = '1076893'

select hcas.* from 
hz_cust_accounts hca ,
hz_cust_acct_sites_all hcas
where hca.account_number = '10020' 
and hca.cust_account_id = hcas.cust_account_id
and hcas.bill_to_flag = 'Y'

select * from hz_party_sites where party_site_id = 300000117910173

<inv:BusinessUnit>
SELECT BU_NAME FROM FUSION.FUN_ALL_BUSINESS_UNITS_V

<inv:TransactionSource>
SELECT NAME FROM FUSION.RA_BATCH_SOURCES_ALL

<inv:TransactionType>

SELECT NAME FROM FUSION.RA_CUST_TRX_TYPES_ALL

<inv:BillToAccountNumber>

SELECT ACCOUNT_NUMBER FROM FUSION.HZ_CUST_ACCOUNTS

<inv:BillToLocation>

SELECT HCSU.LOCATION FROM 
FUSION.HZ_CUST_ACCOUNTS HCA,FUSION.HZ_CUST_ACCT_SITES_ALL HCSA,FUSION.HZ_CUST_SITE_USES_ALL HCSU
WHERE HCA.ACCOUNT_NUMBER='10020' AND HCA.CUST_ACCOUNT_ID = HCSA.CUST_ACCOUNT_ID
AND HCSA.CUST_ACCT_SITE_ID = HCSU.CUST_ACCT_SITE_ID AND HCSU.SITE_USE_CODE='BILL_TO' AND HCSU.STATUS='A'

<inv:PaymentTermsName>

SELECT NAME FROM FUSION.RA_TERMS

DATE FORMAT : YYYY-MM-DD


https://docs.oracle.com/en/cloud/saas/financials/20d/index.html

No REST API to Create Credit Memo

Credit Memo REST API Error: The transaction type that you selected is invalid. (AR-856386) (Doc ID 2528896.1)

sample payload of RecInvoiceService


How to Create Invoice Interface Distributions Using WebService? (Doc ID 2588209.1)

How to Create A Simple Receivables Invoice Along With Transaction Header DFF Using WebService? (Doc ID 2587718.1)

How To Pass Quantity Field While Creating Credit Memo Using Webservice (Doc ID 2553649.1)

ProcessInterfaceLine service call ends in SQLException (Doc ID 2671106.1)



ERP Cloud Instance

https://fa-eqjv-dev1-saasfaprod1.fa.ocs.oraclecloud.com/hcmUI/faces/FuseWelcome
shiva.yarlagadda89@gmail.com
welcome123

https://gsttoicdev-frv08jeksq3g-ld.integration.ocp.oraclecloud.com/ic/home/
shiva.yarlagadda89@gmail.com
Version1@363412

161.17.0.35


https://www.youtube.com/watch?v=pa4yoWmxREM

https://www.techsupper.com/2019/10/dependent-cascading-list-of-values-lov-in-vbcs.html

https://blogs.oracle.com/shay/passing-values-between-pages-in-oracle-application-builder-cloud-service




































https://www.ateam-oracle.com/new-concepts-in-performance-enhancement-with-oic-for-atp-databases