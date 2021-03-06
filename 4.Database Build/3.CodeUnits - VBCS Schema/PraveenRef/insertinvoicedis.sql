REM INSERTING into VB_VB_EWQCM44QFWH.INVOICEDISTRIBUTION
SET DEFINE OFF;
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
            invoiceheaderid = 1
            AND invoicelineid = 4