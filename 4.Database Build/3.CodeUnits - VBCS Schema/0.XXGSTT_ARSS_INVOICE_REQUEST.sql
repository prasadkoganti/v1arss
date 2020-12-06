CREATE OR REPLACE PACKAGE vb_vb_istvpkfgk4j.xxgstt_arss_invoice_request IS
    PROCEDURE duplicate_invoice (
        p_in_inv_id      IN NUMBER,
        p_in_requestor   IN VARCHAR2
    );

    PROCEDURE populate_interface_tables (
        p_in_inv_id        IN NUMBER,
        p_in_oic_flow_id   IN NUMBER,
		p_out_status       OUT VARCHAR2
    );

END;
/

CREATE OR REPLACE PACKAGE BODY vb_vb_istvpkfgk4j.xxgstt_arss_invoice_request AS

    PROCEDURE populate_interface_tables (
        p_in_inv_id        IN NUMBER,
        p_in_oic_flow_id   IN NUMBER,
		p_out_status       OUT VARCHAR2
    ) AS
    BEGIN
	--execute vb_vb_istvpkfgk4j.xxgstt_arss_invoice_request.populate_interface_tables();
	--Insert invoice LINES into interface table
        BEGIN
            INSERT INTO vb_vb_istvpkfgk4j.xxgstt_arss_inv_req_lines_int (
                oic_flow_id,
                arss_invoice_reference,
                arss_invoice_id,
                arss_invoice_line_id,
                interface_line_context,
                interface_line_attribute1,
                interface_line_attribute2,
                interface_line_attribute3,
                batch_source_name,
                line_type,
                description,
                currency_code,
                amount,
                cust_trx_type_name,
                term_name,
                orig_system_bill_customer_ref,
                orig_system_bill_address_ref,
                conversion_type,
                conversion_rate,
                trx_date,
                trx_number,
                quantity,
                unit_selling_price,
                printing_option,
                primary_salesrep_number,
                memo_line_name,
                internal_notes,
                creation_date,
                last_update_date,
                created_by,
                last_updated_by,
                amount_includes_tax_flag,
                tax_exempt_flag,
                bu_name
            )
                SELECT
                    p_in_oic_flow_id,
                    h.invoicereference,
                    h.id                 invoice_id,
                    l.id                 invoice_line_id,
                    'AR Import' interface_line_context,
                    h.invoicereference   interface_line_attribute1,
                    h.id                 interface_line_attribute2,
                    l.id                 interface_line_attribute3,
                    'EBS_DATA_MIGRATION' batch_source_name,
                    'LINE' line_type,
                    l.description,
                    (
                        SELECT
                            c.code
                        FROM
                            vb_vb_istvpkfgk4j.currency c
                        WHERE
                            c.id = h.currency
                    ) currency_code,
                    l.amount,
                    h.transactiontype    cust_trx_type_name,
                    '30 Days' term_name,
                    (
                        SELECT
                            c.origsysbillcustomerref
                        FROM
                            vb_vb_istvpkfgk4j.customer c
                        WHERE
                            c.id = h.customernameref
                    ) orig_system_bill_customer_ref,
                    (
                        SELECT
                            c.origsysbilladdressref
                        FROM
                            vb_vb_istvpkfgk4j.customeraddress c
                        WHERE
                            c.id = h.billtolocation
                    ) orig_system_bill_address_ref,
                    'User' conversion_type,
                    1 conversion_rate,
                    h.transactiondate,
                    h.invoicereference   trx_number,
                    l.quantity,
                    l.unitprice          unit_selling_price,
                    h.printoption        printing_option,
                    (
                        SELECT
                            s.primarysalesrepnumber
                        FROM
                            vb_vb_istvpkfgk4j.salesperson s
                        WHERE
                            s.id = h.salespersonname
                    ) primary_salesrep_number,
                    (
                        SELECT
                            name
                        FROM
                            vb_vb_istvpkfgk4j.memoline
                        WHERE
                            id = l.memoline
                    ) memo_line_name,
                    h.notestobeincludedontrx,
                    SYSDATE              creationdate,
                    SYSDATE              lastupdatedate,
                    h.requestorname      createdby,
                    h.requestorname      lastupdatedby,
                    '' amount_includes_tax_flag, --'N' for tax_lines
                    '' tax_exempt_flag, --'N' for tax_lines
                    (
                        SELECT
                            businessunitname
                        FROM
                            vb_vb_istvpkfgk4j.businessunit
                        WHERE
                            id = h.businessunit
                    ) bu_name
                FROM
                    vb_vb_istvpkfgk4j.invoiceheader h,
                    vb_vb_istvpkfgk4j.invoiceline l
                WHERE
                    h.id = p_in_inv_id
                    AND h.id = l.invoiceheaderid;

            UPDATE vb_vb_istvpkfgk4j.xxgstt_arss_inv_req_lines_int l
            SET
                fbdi_string = (
                    SELECT
    --',EBS_DATA_MIGRATION,DM - Invoice,30 Days,2020/08/25,,3171120,11i-CUSTACCT-21485160,11i-CUSTACCT-SITE-369962,,,,,,,,,,,,,,,,,LINE,Fees - London Procurement Programme (LPP) Activity Based Income (ABI) Apprenticeship DPS July 2020,GBP,
    -- User,,1,248.44,1,,248.44,,AR Import,3171120,1,13724728,,,,,,,,,,,,,100,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,00ANTILEPILEPTIC,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,PRI,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,298.13,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,GSTT Business Unit,,ukap@gpstrategies.com'
                        ','
                        || batch_source_name
                        || ','
                        || cust_trx_type_name
                        || ','
                        || term_name
                        || ','
                        || TO_CHAR(trx_date,'YYYY/MM/DD')
                        || ',,'
                        || trx_number
                        || ','
                        || orig_system_bill_customer_ref
                        || ','
                        || orig_system_bill_address_ref
                        || ',,,,,,,,,,,,,,,,,'
                        || line_type
                        || ','
                        || description
                        || ','
                        || currency_code
                        || ','
                        || conversion_type
                        || ','
                        || conversion_date
                        || ','
                        || conversion_rate
                        || ','
                        || amount
                        || ','
                        || quantity
                        || ','
                        || quantity_ordered
                        || ','
                        || unit_selling_price
                        || ','
                        || unit_standard_price
                        || ','
                        || interface_line_context
                        || ','
                        || trx_number
                        || ','
                        || arss_invoice_id
                        || ','
                        || arss_invoice_line_id
                        || ',,,,,,,,,,,,,'
                        || primary_salesrep_number
                        || ','
                        || tax
                        || ',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,'
                        || memo_line_name
                        || ',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,'
                        || printing_option
    --|| ',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,298.13,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,'
                        || ',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,'
                        || bu_name
                        || ',,'
                        || internal_notes fbdi_string
                    FROM
                        vb_vb_istvpkfgk4j.xxgstt_arss_inv_req_lines_int
                    WHERE
                        ROWID = l.rowid
                )
            WHERE
                oic_flow_id = p_in_oic_flow_id;

            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                NULL;
        END;
	--Insert invoice dist into interface table

        BEGIN
            /*INSERT INTO vb_vb_istvpkfgk4j.xxgstt_arss_inv_req_dist_int (
                oic_flow_id,
                arss_invoice_reference,
                arss_invoice_id,
                arss_invoice_line_id
            )
                SELECT
                    p_in_oic_flow_id,
                    h.invoicereference,
                    h.id   invoice_id,
                    l.id   invoice_line_id
                FROM
                    vb_vb_istvpkfgk4j.invoiceheader h,
                    vb_vb_istvpkfgk4j.invoiceline l
                WHERE
                    h.id = p_in_inv_id
                    AND h.id = l.invoiceheaderid;*/
            NULL;
        EXCEPTION
            WHEN OTHERS THEN
                NULL;
        END;
        NULL;
    EXCEPTION
        WHEN OTHERS THEN
            htp.print(sqlerrm);
    END populate_interface_tables;

    PROCEDURE duplicate_invoice (
        p_in_inv_id      IN NUMBER,
        p_in_requestor   IN VARCHAR2
    ) AS
        v_new_inv_id      NUMBER := NULL;
        v_new_invlineid   NUMBER := NULL;
    BEGIN
        SELECT
            vb_vb_istvpkfgk4j.xxgstt_inv_req_id_seq.nextval
        INTO v_new_inv_id
        FROM
            dual;

        INSERT INTO vb_vb_istvpkfgk4j.invoiceheader (
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
            transactiontotal,
            copiedfrominvid
        )
            SELECT
                v_new_inv_id,--vb_vb_istvpkfgk4j.xxgstt_inv_req_id_seq.NEXTVAL,
                to_timestamp(SYSDATE) creationdate,
                to_timestamp(SYSDATE) lastupdatedate,
                p_in_requestor                                     createdby,
                p_in_requestor                                     lastupdatedby,
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
                ih.revenuedeptapprover,
                specialinstructions,
                notestobeincludedontrx,
                commentstoapprover,
                vb_vb_istvpkfgk4j.xxgstt_inv_req_ref_seq.nextval   invoicereference,
                'ENTERED' status,
                customername,
                transactiontype,
                transactiontyperef,
                customernameref,
                NULL currentapprover,
                insurancecustomernumber,
                businessunit,
                ih.incomesysteamapprover,
                ih.financedirectorapprover,
                transactiontotal,
                p_in_inv_id
            FROM
                vb_vb_istvpkfgk4j.invoiceheader ih,
                vb_vb_istvpkfgk4j.approvalhierarchy appr
            WHERE
                ih.id = p_in_inv_id
                AND appr.requestor = p_in_requestor;

        FOR l IN (
            SELECT
                id
            FROM
                vb_vb_istvpkfgk4j.invoiceline
            WHERE
                invoiceheaderid = p_in_inv_id
        ) LOOP
            SELECT
                vb_vb_istvpkfgk4j.xxgstt_inv_req_line_id_seq.nextval
            INTO v_new_invlineid
            FROM
                dual;

            INSERT INTO vb_vb_istvpkfgk4j.invoiceline (
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
                    v_new_invlineid,
                    to_timestamp(SYSDATE) creationdate,
                    to_timestamp(SYSDATE) lastupdatedate,
                    p_in_requestor   createdby,
                    p_in_requestor   lastupdatedby,
                    '' abcschangenumber,
                    memoline,
                    description,
                    quantity,
                    unitprice,
                    taxcode,
                    amount,
                    invoicereference,
                    linenumber,
                    v_new_inv_id     invoiceheaderid,
                    taxrate,
                    distributiontotal
                FROM
                    vb_vb_istvpkfgk4j.invoiceline
                WHERE
                    invoiceheaderid = p_in_inv_id
                    AND id = l.id;

            FOR d IN (
                SELECT
                    id
                FROM
                    vb_vb_istvpkfgk4j.invoicedistribution
                WHERE
                    invoiceheaderid = p_in_inv_id
                    AND invoicelineid = l.id
            ) LOOP
                INSERT INTO vb_vb_istvpkfgk4j.invoicedistribution (
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
                        vb_vb_istvpkfgk4j.xxgstt_inv_req_dist_id_seq.nextval,
                        to_timestamp(SYSDATE) creationdate,
                        to_timestamp(SYSDATE) lastupdatedate,
                        p_in_requestor    createdby,
                        p_in_requestor    lastupdatedby,
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
                        v_new_inv_id      invoiceheaderid,
                        v_new_invlineid   invoicelineid,
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
                        vb_vb_istvpkfgk4j.invoicedistribution
                    WHERE
                        invoiceheaderid = p_in_inv_id
                        AND invoicelineid = l.id
                        AND id = d.id;

            END LOOP; --Distributions loop

        END LOOP; --Lines loop

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            htp.print(sqlerrm);
    END duplicate_invoice;

END;
/

SHOW ERR;