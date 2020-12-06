CREATE OR REPLACE PACKAGE BODY arselfservicepkg AS as 
   -- Duplicates an Invoice 
 procedure duplicate_invoice (
    p_invoiceheaderid       IN NUMBER,
    p_new_invoiceheaderid   OUT NUMBER
) AS
    v_new_invoicelineid   NUMBER := NULL;
    BEGIN
    SELECT
        dupinvoiceidseq.NEXTVAL
    INTO p_new_invoiceheaderid
    FROM
        dual;

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
            p_new_invoiceheaderid,--dupinvoiceidseq.NEXTVAL,
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
            vb_vb_ewqcm44qfwh.invoiceheader
        WHERE
            invoiceheaderid = p_invoiceheaderid;

FOR l IN (
    SELECT
        id
    FROM
        vb_vb_ewqcm44qfwh.invoiceline
    WHERE
        invoiceheaderid = p_invoiceheaderid
)
loop
    SELECT
        dupinvoiceidseq.NEXTVAL
    INTO v_new_invoicelineid
    FROM
        dual;

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
    )
        SELECT
            v_new_invoicelineid,
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
            p_new_invoiceheaderid   invoiceheaderid,
            taxrate,
            distributiontotal
        FROM
            vb_vb_ewqcm44qfwh.invoiceline
        WHERE
            invoiceheaderid = p_invoiceheaderid
            AND id = l.id;

FOR d IN (
    SELECT
        id
    FROM
        vb_vb_ewqcm44qfwh.invoicedistribution
    WHERE
        invoiceheaderid = p_invoiceheaderid
        AND invoicelineid = l.id
)
loop
    INSERT INTO vb_vb_ewqcm44qfwh.invoicedistribution (
        id,
        creationdate,
        lastupdatedate,
        createdby,
        lastupdatedby,
        abcschangenumber,
        organizationref,
        costcentreref,
        subjectiveref,
        wgaref,
        intercompanyref,
        analysisref,
        spare1ref,
        spare2ref,
        invoicereference,
        invoiceheaderid,
        invoicelineid,
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
    )
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
            p_new_invoiceheaderid   invoiceheaderid,
            v_new_invoicelineid     invoicelineid,
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
            invoiceheaderid = p_invoiceheaderid
            AND invoicelineid = l.id end
    loop; --Distributions loop
END
    loop; --Lines loop
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        htp.print(sqlerrm);
        end;
END arselfservicepkg;
/
SHOW ERRORS;