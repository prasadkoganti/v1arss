PCS Notes:

TaskOutcomeDataObject == "REJECT"

invoiceFormDataObject.isCreditNoteFlag == "Y" and invoiceFormDataObject.transactionTotal >=100000

"Your Invoice Request is Rejected - Reference " + invoiceFormDataObject.invoiceReference

"Dear User, Your Invoice Request is Rejected - Reference " + invoiceFormDataObject.invoiceReference

techtutorsti@gmail.com

learnitnow4@gmail.com

rb.oicuser@gmail.com

https://gsttoicdev-frv08jeksq3g-ld.integration.ocp.oraclecloud.com

/ic/builder/design/GSTT_AR_Self_Service_Invoice_App/1.0/resources/data/InvoiceHeader/5

https://gsttoicdev-frv08jeksq3g-ld.integration.ocp.oraclecloud.com

/ic/builder/design/GSTT_AR_Self_Service_Invoice_App/1.0/resources/data/InvoiceLine

{
  "items" : [ {
    "amount" : 110.00000000000001,
    "createdBy" : "techtutorsti@gmail.com",
    "creationDate" : "2020-11-11T10:21:28+00:00",
    "description" : "Default Memo Line Desc1",
    "distributionTotal" : null,
    "id" : 21,
    "invoiceHeaderId" : 5,
    "invoiceHeaderIdObject_id" : 5,
    "invoiceReference" : null,
    "lastUpdateDate" : "2020-11-11T10:21:28.016+00:00",
    "lastUpdatedBy" : "techtutorsti@gmail.com",
    "lineNumber" : null,
    "memoLine" : 1,
    "quantity" : 1,
    "taxCode" : 1,
    "taxRate" : 10.0,
    "unitPrice" : 100.0
  }, {
    "amount" : 220.00000000000003,
    "createdBy" : "techtutorsti@gmail.com",
    "creationDate" : "2020-11-14T06:49:09+00:00",
    "description" : "Default Memo Line Desc2",
    "distributionTotal" : null,
    "id" : 25,
    "invoiceHeaderId" : 5,
    "invoiceHeaderIdObject_id" : 5,
    "invoiceReference" : null,
    "lastUpdateDate" : "2020-11-14T15:27:58+00:00",
    "lastUpdatedBy" : "techtutorsti@gmail.com",
    "lineNumber" : null,
    "memoLine" : 1,
    "quantity" : 1,
    "taxCode" : 1,
    "taxRate" : 10.0,
    "unitPrice" : 200.0
  } ]
}















{
 "addressLine1": "{{ $chain.results.loadInvoiceHeader.body.addressLine1 }}",
 "addressLine2": "{{ $chain.results.loadInvoiceHeader.body.addressLine2 }}",
 "admissionDate": "{{ $chain.results.loadInvoiceHeader.body.admissionDate }}",
 "billToLocation": "{{ $chain.results.loadInvoiceHeader.body.billToLocation }}",
 "businessUnit": "{{ $chain.results.loadInvoiceHeader.body.businessUnit }}",
 "city": "{{ $chain.results.loadInvoiceHeader.body.city }}",
 "commentsToApprover": "{{ $chain.results.loadInvoiceHeader.body.commentsToApprover }}",
 "creditReason": "{{ $chain.results.loadInvoiceHeader.body.creditReason }}",
 "currency": "{{ $chain.results.loadInvoiceHeader.body.currency }}",
 "currentApprover": "{{ $chain.results.loadInvoiceHeader.body.currentApprover }}",
 "customerName": "{{ $chain.results.loadInvoiceHeader.body.customerName }}",
 "customerNameRef": "{{ $chain.results.loadInvoiceHeader.body.customerNameRef }}",
 "dischargeDate": "{{ $chain.results.loadInvoiceHeader.body.dischargeDate }}",
 "financeDirectorApprover": "{{ $chain.results.loadInvoiceHeader.body.financeDirectorApprover }}",
 "id": "{{ $chain.results.loadInvoiceHeader.body.id }}",
 "incomeSysTeamApprover": "{{ $chain.results.loadInvoiceHeader.body.incomeSysTeamApprover }}",
 "insuranceCompany": "{{ $chain.results.loadInvoiceHeader.body.insuranceCompany }}",
 "insuranceCustomerNumber": "{{ $chain.results.loadInvoiceHeader.body.insuranceCustomerNumber }}",
 "invoiceReference": "{{ $chain.results.loadInvoiceHeader.body.invoiceReference }}",
 "invoicingRule": "{{ $chain.results.loadInvoiceHeader.body.invoicingRule }}",
 "notesToBeIncludedOnTrx": "{{ $chain.results.loadInvoiceHeader.body.notesToBeIncludedOnTrx }}",
 "otherRechargeReason": "{{ $chain.results.loadInvoiceHeader.body.otherRechargeReason }}",
 "patientDateOfBirth": "{{ $chain.results.loadInvoiceHeader.body.patientDateOfBirth }}",
 "policyNumber": "{{ $chain.results.loadInvoiceHeader.body.policyNumber }}",
 "poNumber": "{{ $chain.results.loadInvoiceHeader.body.poNumber }}",
 "postalCode": "{{ $chain.results.loadInvoiceHeader.body.postalCode }}",
 "printOption": "{{ $chain.results.loadInvoiceHeader.body.printOption }}",
 "profileClass": "{{ $chain.results.loadInvoiceHeader.body.profileClass }}",
 "reconciliationReference": "{{ $chain.results.loadInvoiceHeader.body.reconciliationReference }}",
 "requestorName": "{{ $chain.results.loadInvoiceHeader.body.requestorName }}",
 "revenueDeptApprover": "{{ $chain.results.loadInvoiceHeader.body.revenueDeptApprover }}",
 "salesPersonName": "{{ $chain.results.loadInvoiceHeader.body.salesPersonName }}",
 "specialInstructions": "{{ $chain.results.loadInvoiceHeader.body.specialInstructions }}",
 "status": "{{ $chain.results.loadInvoiceHeader.body.status }}",
 "transactionDate": "{{ $chain.results.loadInvoiceHeader.body.transactionDate }}",
 "transactionTypeRef": "{{ $chain.results.loadInvoiceHeader.body.transactionTypeRef }}",
 "transactionTypeRefObjec": {
  "items": [
   {
    "name": "{{ $chain.results.loadInvoiceHeader.body.transactionTypeRefObjec.items[0].name }}"
   }
  ]
 }
}