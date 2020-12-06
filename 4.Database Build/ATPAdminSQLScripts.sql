select * from all_users where username like 'VB%';

select * from all_tables where owner='VB_VB_EWQCM44QFWH';--VB_VB_BZUHYLUZKAZ

select * from VB_VB_EWQCM44QFWH.INVOICEHEADER;

delete from VB_VB_EWQCM44QFWH.INVOICEHEADER where id = 1000003;

--select dupinvoiceidseq.NEXTVAL from dual;

select * from VB_VB_EWQCM44QFWH.INVOICELINE where invoiceheaderid = 1;

select * from VB_VB_EWQCM44QFWH.INVOICEDISTRIBUTION;

select * from VB_VB_EWQCM44QFWH.REQUESTOR;

SELECT
     dupinvoicedisidseq.NEXTVAL,
        to_timestamp(SYSDATE) creationdate,
        to_timestamp(SYSDATE) lastupdatedate,
        'techtutorsti@gmail.com' createdby,
        'techtutorsti@gmail.com' lastupdatedby,
        '' abcschangenumber,
     organizationref,
     costcentreref,
     subjectiveref,
     wgaref,
     intercompanyref,
     analysisref,
     spare1ref,
     spare2ref,
     invoicereference,
     p_new_invoiceheaderid invoiceheaderid,
     v_new_invoicelineid invoicelineid,
     distributionlinenumber,
     invoicelinenumber,
     allocationpercentage,
     allocationamount,
     lineamount,
     organization,
     costcentre,
     subjective,
     wga,
     intercompany,
     analysis,
     spare1,
     spare2
 FROM
     vb_vb_ewqcm44qfwh.invoicedistribution
 WHERE
     invoiceheaderid = 1
     AND invoicelineid = 4

INSERT INTO vb_vb_ewqcm44qfwh.invoiceline (
    id,
    creationdate,
    lastupdatedate,
    createdby,
    lastupdatedby,
    abcschangenumber,
    memoline,
    description,
    quantity,
    unitprice,
    taxcode,
    amount,
    invoicereference,
    linenumber,
    invoiceheaderid,
    taxrate,
    distributiontotal
);

    SELECT
        dupinvoicelineidseq.NEXTVAL,
        to_timestamp(SYSDATE) creationdate,
        to_timestamp(SYSDATE) lastupdatedate,
        'techtutorsti@gmail.com' createdby,
        'techtutorsti@gmail.com' lastupdatedby,
        '' abcschangenumber,
        memoline,
        description,
        quantity,
        unitprice,
        taxcode,
        amount,
        invoicereference,
        linenumber,
        dupinvoiceidseq.CURRVAL invoiceheaderid,
        taxrate,
        distributiontotal
    FROM
        vb_vb_ewqcm44qfwh.invoiceline
    WHERE
        invoiceheaderid = 1;

select dupinvoiceidseq.nextval from dual;

SELECT
    dupinvoiceidseq.NEXTVAL,
    to_timestamp(SYSDATE) creationdate,
    to_timestamp(SYSDATE) lastupdatedate,
    'techtutorsti@gmail.com' createdby,
    'techtutorsti@gmail.com' lastupdatedby,
    '' abcschangenumber,
    transactiondate,
    billtolocation,
    profileclass,
    addressline1,
    addressline2,
    city,
    postalcode,
    creditreason,
    invoicingrule,
    currency,
    salespersonname,
    reconciliationreference,
    insurancecompany,
    policynumber,
    patientdateofbirth,
    printoption,
    admissiondate,
    dischargedate,
    ponumber,
    otherrechargereason,
    requestorname,
    revenuedeptapprover,
    specialinstructions,
    notestobeincludedontrx,
    commentstoapprover,
    invoicereference || '_COPY' invoicereference,
    'ENTERED' status,
    customername,
    transactiontype,
    transactiontyperef,
    customernameref,
    NULL currentapprover,
    insurancecustomernumber,
    businessunit,
    incomesysteamapprover,
    financedirectorapprover,
    transactiontotal
FROM
    vb_vb_ewqcm44qfwh.invoiceheader;
