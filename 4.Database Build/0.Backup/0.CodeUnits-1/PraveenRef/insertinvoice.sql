REM INSERTING into VB_VB_EWQCM44QFWH.INVOICEHEADER
SET DEFINE OFF;
INSERT INTO vb_vb_ewqcm44qfwh.invoiceheader (
    id,
    creationdate,
    lastupdatedate,
    createdby,
    lastupdatedby,
    abcschangenumber,
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
    invoicereference,
    status,
    customername,
    transactiontype,
    transactiontyperef,
    customernameref,
    currentapprover,
    insurancecustomernumber,
    businessunit,
    incomesysteamapprover,
    financedirectorapprover,
    transactiontotal
)
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