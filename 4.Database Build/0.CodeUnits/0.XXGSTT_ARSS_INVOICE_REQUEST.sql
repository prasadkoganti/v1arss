CREATE OR REPLACE PACKAGE arss.xxgstt_arss_invoice_request IS
    PROCEDURE duplicate_invoice (
        p_in_inv_id     IN  NUMBER,
        p_in_requestor  IN  VARCHAR2
    );

    PROCEDURE populate_interface_tables (
        p_in_inv_id       IN   NUMBER,
        p_in_oic_flow_id  IN   NUMBER,
        p_out_status      OUT  VARCHAR2
    );

    PROCEDURE update_approver (
        p_in_inv_id            IN  NUMBER,
        p_in_current_approver  IN  VARCHAR2
    );

    PROCEDURE update_invoice_status (
        p_in_inv_id      IN  NUMBER,
        p_in_inv_status  IN  VARCHAR2
    );

    PROCEDURE get_distribution_defaults (
        p_in_inv_id       IN  NUMBER,
        p_in_inv_line_id  IN  NUMBER
    );

    PROCEDURE update_transaction_total (
        p_in_inv_id IN NUMBER
    );

END;
/

CREATE OR REPLACE PACKAGE BODY arss.xxgstt_arss_invoice_request AS

    PROCEDURE update_transaction_total (
        p_in_inv_id IN NUMBER
    ) AS
    BEGIN
        UPDATE vb_vb_istvpkfgk4j.invoiceheader h
        SET
            transactiontotal = (
                SELECT
                    nvl(SUM(amount), 0)
                FROM
                    vb_vb_istvpkfgk4j.invoiceline l
                WHERE
                    l.invoiceheaderid = p_in_inv_id
            )
        WHERE
            h.id = p_in_inv_id;

    EXCEPTION
        WHEN OTHERS THEN
            NULL;
    END;

    PROCEDURE get_distribution_defaults (
        p_in_inv_id       IN  NUMBER,
        p_in_inv_line_id  IN  NUMBER
    ) AS
        l_cursor SYS_REFCURSOR;
    BEGIN
        OPEN l_cursor FOR SELECT
                              '1'         AS "organizationRef",
                              'RJ1'       AS "organization",
                              '1'         AS "costCentreRef",
                              '900000'    AS "costCentre",
                              '22010'     AS "subjective",
                              '1'         AS "subjectiveRef",
                              '000000'    AS "wGA",
                              '1'         AS "wgaRef",
                              '000'       AS "intercompany",
                              '1'         AS "intercompanyRef",
                              '000000'    AS "analysis",
                              '1'         AS "analysisRef",
                              '000000'    AS "spare1",
                              '1'         AS "spare1Ref",
                              '000000'    AS "spare2",
                              '1'         AS "spare2Ref",
                              l.amount    AS "lineAmount",
                              l.amount    AS "allocationAmount"
                          FROM
                              vb_vb_istvpkfgk4j.invoiceheader    h,
                              vb_vb_istvpkfgk4j.invoiceline      l
                          WHERE
                                  h.id = p_in_inv_id
                              AND l.id = p_in_inv_line_id
                              AND h.id = l.invoiceheaderid;

        apex_json.open_object;
        apex_json.write('distributiondetails', l_cursor);
        apex_json.close_object;
    EXCEPTION
        WHEN OTHERS THEN
            NULL;
    END;

    PROCEDURE update_approver (
        p_in_inv_id            IN  NUMBER,
        p_in_current_approver  IN  VARCHAR2
    ) AS
        l_cursor SYS_REFCURSOR;
    BEGIN
        UPDATE vb_vb_istvpkfgk4j.invoiceheader
        SET
            currentapprover = p_in_current_approver
        WHERE
            id = p_in_inv_id;

        --COMMIT;
        /*OPEN l_cursor FOR SELECT
                              i.id                 AS "invid",
                              i.currentapprover    AS "currentapprover"
                          FROM
                              vb_vb_istvpkfgk4j.invoiceheader i
                          WHERE
                              i.id = decode(p_in_inv_id, NULL, i.id, p_in_inv_id);

        apex_json.open_object;
        apex_json.write('invoices', l_cursor);
        apex_json.close_object;*/
		
                                    EXCEPTION
        WHEN OTHERS THEN
            NULL;
    END;

    PROCEDURE update_invoice_status (
        p_in_inv_id      IN  NUMBER,
        p_in_inv_status  IN  VARCHAR2
    ) AS
        l_cursor SYS_REFCURSOR;
    BEGIN
        UPDATE vb_vb_istvpkfgk4j.invoiceheader
        SET
            status = nvl(p_in_inv_status, status)
        WHERE
            id = p_in_inv_id;

        --COMMIT;
        /*OPEN l_cursor FOR SELECT
                              i.id                 AS "invid",
                              i.status             AS "status"
                          FROM
                              vb_vb_istvpkfgk4j.invoiceheader i
                          WHERE
                              i.id = decode(p_in_inv_id, NULL, i.id, p_in_inv_id);

        apex_json.open_object;
        apex_json.write('invoices', l_cursor);
        apex_json.close_object;*/
                                    EXCEPTION
        WHEN OTHERS THEN
            NULL;
    END;

    PROCEDURE populate_interface_tables (
        p_in_inv_id       IN   NUMBER,
        p_in_oic_flow_id  IN   NUMBER,
        p_out_status      OUT  VARCHAR2
    ) AS
    BEGIN
        BEGIN
            INSERT INTO arss.xxgstt_arss_inv_req_control_int (
                oic_flow_id,
                arss_invoice_id,
                arss_invoice_reference,
                cust_trx_type_name,
                bu_name,
                status,
                created_by,
                creation_date,
                last_updated_by,
                last_update_date
            )
                SELECT
                    p_in_oic_flow_id,
                    p_in_inv_id,
                    h.invoicereference,
                    h.transactiontype,
                    bu.businessunitname,
                    'LOAD_TO_ERP_STARTED'  status,
                    h.requestorname        createdby,
                    sysdate                creationdate,
                    h.requestorname        lastupdatedby,
                    sysdate                lastupdatedate
                FROM
                    vb_vb_istvpkfgk4j.invoiceheader      h,
                    vb_vb_istvpkfgk4j.businessunit       bu,
                    vb_vb_istvpkfgk4j.transactiontype    tt
                WHERE
                        h.businessunit = bu.id
                    AND h.transactiontyperef = tt.id
                    AND h.id = p_in_inv_id;

        EXCEPTION
            WHEN OTHERS THEN
                NULL;
        END;

        BEGIN
            INSERT INTO arss.xxgstt_arss_inv_req_lines_int (
                oic_flow_id,
                arss_invoice_reference,
                arss_invoice_id,
                arss_invoice_line_id,
                interface_line_context,
                interface_line_attribute1,
                interface_line_attribute2,
                interface_line_attribute3,
                interface_line_attribute4,
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
                    h.id                          invoice_id,
                    l.id                          invoice_line_id,
                    'ARSS Income Request Import'  interface_line_context,
                    h.invoicereference            interface_line_attribute1,
                    h.id                          interface_line_attribute2,
                    l.id                          interface_line_attribute3,
                    p_in_oic_flow_id              interface_line_attribute4,
                    'EBS_DATA_MIGRATION'          batch_source_name,
                    'LINE'                        line_type,
                    l.description,
                    (
                        SELECT
                            c.code
                        FROM
                            vb_vb_istvpkfgk4j.currency c
                        WHERE
                            c.id = h.currency
                    )                             currency_code,
                    l.amount                      amount,
                    h.transactiontype             cust_trx_type_name,
                    '30 Days'                     term_name,
                    (
                        SELECT
                            c.origsysbillcustomerref
                        FROM
                            vb_vb_istvpkfgk4j.customer c
                        WHERE
                            c.id = h.customernameref
                    )                             orig_system_bill_customer_ref,
                    (
                        SELECT
                            c.origsysbilladdressref
                        FROM
                            vb_vb_istvpkfgk4j.customeraddress c
                        WHERE
                            c.id = h.billtolocation
                    )                             orig_system_bill_address_ref,
                    'User'                        conversion_type,
                    1                             conversion_rate,
                    h.transactiondate,
                    h.invoicereference            trx_number,
                    l.quantity,
                    l.unitprice                   unit_selling_price,
                    (
                        SELECT
                            c.value
                        FROM
                            vb_vb_istvpkfgk4j.printoption c
                        WHERE
                            c.id = h.printoption
                    )                             printing_option,
                    (
                        SELECT
                            s.primarysalesrepnumber
                        FROM
                            vb_vb_istvpkfgk4j.salesperson s
                        WHERE
                            s.id = h.salespersonname
                    )                             primary_salesrep_number,
                    (
                        SELECT
                            name
                        FROM
                            vb_vb_istvpkfgk4j.memoline
                        WHERE
                            id = l.memoline
                    )                             memo_line_name,
                    h.notestobeincludedontrx,
                    sysdate                       creationdate,
                    sysdate                       lastupdatedate,
                    h.requestorname               createdby,
                    h.requestorname               lastupdatedby,
                    ''                            amount_includes_tax_flag,
                    ''                            tax_exempt_flag,
                    (
                        SELECT
                            businessunitname
                        FROM
                            vb_vb_istvpkfgk4j.businessunit
                        WHERE
                            id = h.businessunit
                    )                             bu_name
                FROM
                    vb_vb_istvpkfgk4j.invoiceheader    h,
                    vb_vb_istvpkfgk4j.invoiceline      l
                WHERE
                        h.id = p_in_inv_id
                    AND h.id = l.invoiceheaderid;

            UPDATE arss.xxgstt_arss_inv_req_lines_int l
            SET
                fbdi_string = (
                    SELECT
                        ','
                        || batch_source_name
                        || ','
                        || cust_trx_type_name
                        || ','
                        || term_name
                        || ','
                        || to_char(trx_date, 'YYYY/MM/DD')
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
                        || interface_line_attribute1
                        || ','
                        || interface_line_attribute2
                        || ','
                        || interface_line_attribute3
                        || ','
                        || interface_line_attribute4
                        || ',,,,,,,,,,,,'
                        || primary_salesrep_number
                        || ','
                        || tax
                        || ',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,'
                        || memo_line_name
                        || ',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,'
                        || printing_option
                        || ',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,'
                        || bu_name
                        || ',,'
                        || internal_notes fbdi_string
                    FROM
                        arss.xxgstt_arss_inv_req_lines_int
                    WHERE
                        ROWID = l.rowid
                )
            WHERE
                    oic_flow_id = p_in_oic_flow_id
                AND line_type = 'LINE';

            INSERT INTO arss.xxgstt_arss_inv_req_lines_int (
                oic_flow_id,
                arss_invoice_reference,
                arss_invoice_id,
                arss_invoice_line_id,
                interface_line_context,
                interface_line_attribute1,
                interface_line_attribute2,
                interface_line_attribute3,
                interface_line_attribute4,
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
                bu_name,
                tax_rate_code,
                link_to_line_context,
                link_to_line_attribute1,
                link_to_line_attribute2,
                link_to_line_attribute3,
                link_to_line_attribute4
            )
                SELECT
                    p_in_oic_flow_id,
                    h.invoicereference,
                    h.id                                 invoice_id,
                    l.id                                 invoice_line_id,
                    'ARSS Income Request Import'         interface_line_context,
                    h.invoicereference                   interface_line_attribute1,
                    h.id                                 interface_line_attribute2,
                    l.id || '_1'                         interface_line_attribute3,
                    p_in_oic_flow_id                     interface_line_attribute4,
                    'EBS_DATA_MIGRATION'                 batch_source_name,
                    'TAX'                                line_type,
                    l.description || ' Tax Line'         description,
                    (
                        SELECT
                            c.code
                        FROM
                            vb_vb_istvpkfgk4j.currency c
                        WHERE
                            c.id = h.currency
                    )                                    currency_code,
                    ( l.amount * l.taxrate *.01 )        amount,
                    h.transactiontype                    cust_trx_type_name,
                    '30 Days'                            term_name,
                    (
                        SELECT
                            c.origsysbillcustomerref
                        FROM
                            vb_vb_istvpkfgk4j.customer c
                        WHERE
                            c.id = h.customernameref
                    )                                    orig_system_bill_customer_ref,
                    (
                        SELECT
                            c.origsysbilladdressref
                        FROM
                            vb_vb_istvpkfgk4j.customeraddress c
                        WHERE
                            c.id = h.billtolocation
                    )                                    orig_system_bill_address_ref,
                    'User'                               conversion_type,
                    1                                    conversion_rate,
                    h.transactiondate,
                    h.invoicereference                   trx_number,
                    l.quantity,
                    l.unitprice                          unit_selling_price,
                    (
                        SELECT
                            c.value
                        FROM
                            vb_vb_istvpkfgk4j.printoption c
                        WHERE
                            c.id = h.printoption
                    )                                    printing_option,
                    (
                        SELECT
                            s.primarysalesrepnumber
                        FROM
                            vb_vb_istvpkfgk4j.salesperson s
                        WHERE
                            s.id = h.salespersonname
                    )                                    primary_salesrep_number,
                    (
                        SELECT
                            name
                        FROM
                            vb_vb_istvpkfgk4j.memoline
                        WHERE
                            id = l.memoline
                    )                                    memo_line_name,
                    h.notestobeincludedontrx,
                    sysdate                              creationdate,
                    sysdate                              lastupdatedate,
                    h.requestorname                      createdby,
                    h.requestorname                      lastupdatedby,
                    'N'                                  amount_includes_tax_flag,
                    'S'                                  tax_exempt_flag,
                    (
                        SELECT
                            businessunitname
                        FROM
                            vb_vb_istvpkfgk4j.businessunit
                        WHERE
                            id = h.businessunit
                    )                                    bu_name,
                    (
                        SELECT
                            name
                        FROM
                            vb_vb_istvpkfgk4j.taxcode
                        WHERE
                            id = l.taxcode
                    )                                    taxcode,
                    'ARSS Income Request Import'         link_to_line_context,
                    h.invoicereference                   link_to_line_attribute1,
                    h.id                                 link_to_line_attribute2,
                    l.id                                 link_to_line_attribute3,
                    p_in_oic_flow_id                     link_to_line_attribute4
                FROM
                    vb_vb_istvpkfgk4j.invoiceheader    h,
                    vb_vb_istvpkfgk4j.invoiceline      l
                WHERE
                        h.id = p_in_inv_id
                    AND h.id = l.invoiceheaderid
                    AND l.taxrate > 0;

            UPDATE arss.xxgstt_arss_inv_req_lines_int l
            SET
                fbdi_string = (
                    SELECT
                        ','
                        || batch_source_name
                        || ','
                        || cust_trx_type_name
                        || ','
                        || term_name
                        || ','
                        || to_char(trx_date, 'YYYY/MM/DD')
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
                        || NULL
                        || ','
                        || interface_line_context
                        || ','
                        || interface_line_attribute1
                        || ','
                        || interface_line_attribute2
                        || ','
                        || interface_line_attribute3
                        || ','
                        || interface_line_attribute4
                        || ',,,,,,,,,,,,'
                        || primary_salesrep_number
                        || ',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,'
                        || tax_rate_code
                        || ',,,,,,,'
                        || tax_exempt_flag
                        || ',,,,'
                        || amount_includes_tax_flag
                        || ',,,,,,,,,,,,,,,,'
                        || memo_line_name
                        || ',,,'
                        || link_to_line_context
                        || ','
                        || link_to_line_attribute1
                        || ','
                        || link_to_line_attribute2
                        || ','
                        || link_to_line_attribute3
                        || ','
                        || link_to_line_attribute4
                        || ',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,'
                        || printing_option
                        || ',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,'
                        || bu_name
                        || ',,'
                        || internal_notes fbdi_string
                    FROM
                        arss.xxgstt_arss_inv_req_lines_int
                    WHERE
                        ROWID = l.rowid
                )
            WHERE
                    oic_flow_id = p_in_oic_flow_id
                AND line_type = 'TAX';

            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                NULL;
        END;

        BEGIN
            INSERT INTO arss.xxgstt_arss_inv_req_salescredits_int (
                oic_flow_id,
                arss_invoice_reference,
                arss_invoice_id,
                arss_invoice_line_id,
                bu_name,
                salesrep_number,
                sales_credit_type_name,
                sales_credit_amount_split,
                sales_credit_percent_split,
                interface_line_context,
                interface_line_attribute1,
                interface_line_attribute2,
                interface_line_attribute3,
                interface_line_attribute4
            )
                SELECT
                    p_in_oic_flow_id,
                    h.invoicereference,
                    h.id                          invoice_id,
                    l.id                          invoice_line_id,
                    (
                        SELECT
                            businessunitname
                        FROM
                            vb_vb_istvpkfgk4j.businessunit
                        WHERE
                            id = h.businessunit
                    )                             bu_name,
                    s.primarysalesrepnumber       salesrep_number,
                    s.salescredittypename         sales_credit_type_name,
                    l.amount                      sales_credit_amount_split,
                    s.salescreditpercentsplit     sales_credit_percent_split,
                    'ARSS Income Request Import'  interface_line_context,
                    h.invoicereference            interface_line_attribute1,
                    h.id                          interface_line_attribute2,
                    l.id                          interface_line_attribute3,
                    p_in_oic_flow_id              interface_line_attribute4
                FROM
                    vb_vb_istvpkfgk4j.invoiceheader    h,
                    vb_vb_istvpkfgk4j.invoiceline      l,
                    vb_vb_istvpkfgk4j.salesperson      s
                WHERE
                        h.id = p_in_inv_id
                    AND h.id = l.invoiceheaderid;

            UPDATE arss.xxgstt_arss_inv_req_salescredits_int l
            SET
                fbdi_string = (
                    SELECT
                        ','
                        || salesrep_number
                        || ','
                        || sales_credit_type_name
                        || ','
                        || sales_credit_amount_split
                        || ','
                        || sales_credit_percent_split
                        || ','
                        || interface_line_context
                        || ','
                        || interface_line_attribute1
                        || ','
                        || interface_line_attribute2
                        || ','
                        || interface_line_attribute3
                        || ','
                        || interface_line_attribute4
                        || ',,,,,,,,,,,,,,,,,,,,,,,,,,,,'
                        || bu_name
                    FROM
                        arss.xxgstt_arss_inv_req_salescredits_int
                    WHERE
                        ROWID = l.rowid
                )
            WHERE
                oic_flow_id = p_in_oic_flow_id;

        EXCEPTION
            WHEN OTHERS THEN
                NULL;
        END;

        BEGIN
            INSERT INTO arss.xxgstt_arss_inv_req_dist_int (
                oic_flow_id,
                arss_invoice_reference,
                arss_invoice_id,
                arss_invoice_line_id,
                arss_invoice_dist_id,
                bu_name,
                account_class,
                amount,
                percent,
                interface_line_context,
                interface_line_attribute1,
                interface_line_attribute2,
                interface_line_attribute3,
                interface_line_attribute4,
                segment1,
                segment2,
                segment3,
                segment4,
                segment5,
                segment6,
                segment7,
                segment8
            )
                SELECT
                    p_in_oic_flow_id,
                    h.invoicereference,
                    h.id                          invoice_id,
                    l.id                          invoice_line_id,
                    d.id                          invoice_dist_id,
                    b.businessunitname            bu_name,
                    'REV'                         account_class,
                    d.allocationamount            amount,
                    d.allocationpercentage        percent,
                    'ARSS Income Request Import'  interface_line_context,
                    h.invoicereference            interface_line_attribute1,
                    h.id                          interface_line_attribute2,
                    l.id                          interface_line_attribute3,
                    p_in_oic_flow_id              interface_line_attribute4,
                    organization,
                    costcentre,
                    subjective,
                    wga,
                    intercompany,
                    analysis,
                    spare1,
                    spare2
                FROM
                    vb_vb_istvpkfgk4j.invoiceheader          h,
                    vb_vb_istvpkfgk4j.invoiceline            l,
                    vb_vb_istvpkfgk4j.invoicedistribution    d,
                    vb_vb_istvpkfgk4j.businessunit           b
                WHERE
                        h.id = p_in_inv_id
                    AND h.id = l.invoiceheaderid
                    AND h.id = d.invoiceheaderid
                    AND l.id = d.invoicelineid
                    AND b.id = h.businessunit;

            UPDATE arss.xxgstt_arss_inv_req_dist_int l
            SET
                fbdi_string = (
                    SELECT
                        ','
                        || account_class
                        || ','
                        || amount
                        || ','
                        || percent
                        || ',,'
                        || interface_line_context
                        || ','
                        || interface_line_attribute1
                        || ','
                        || interface_line_attribute2
                        || ','
                        || interface_line_attribute3
                        || ','
                        || interface_line_attribute4
                        || ',,,,,,,,,,,,'
                        || segment1
                        || ','
                        || segment2
                        || ','
                        || segment3
                        || ','
                        || segment4
                        || ','
                        || segment5
                        || ','
                        || segment6
                        || ','
                        || segment7
                        || ','
                        || segment8
                        || ',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,'
                        || bu_name
                    FROM
                        arss.xxgstt_arss_inv_req_dist_int
                    WHERE
                        ROWID = l.rowid
                )
            WHERE
                oic_flow_id = p_in_oic_flow_id;

        EXCEPTION
            WHEN OTHERS THEN
                NULL;
        END;

        BEGIN
            INSERT INTO arss.xxgstt_arss_inv_req_property_int
                SELECT
                    p_in_oic_flow_id,
                    p_in_inv_id,
                    '/oracle/apps/ess/financials/receivables/transactions/autoInvoices,AutoInvoiceImportEss,ArAutoinvoiceImport,'
                    || bu.orgid
                    || ','
                    || 'EBS_DATA_MIGRATION'
                    || ','
                    || to_char(sysdate, 'YYYY-MM-DD')
                    || ','
                    || tt.transactiontypeid
                    || ',#NULL,#NULL,#NULL,#NULL,#NULL,#NULL,#NULL,#NULL,'
                    || h.invoicereference
                    || ','
                    || h.invoicereference
                    || ',#NULL,#NULL,#NULL,#NULL,#NULL,#NULL,#NULL,#NULL,Y,#NULL' propfbdistring
                FROM
                    vb_vb_istvpkfgk4j.invoiceheader      h,
                    vb_vb_istvpkfgk4j.businessunit       bu,
                    vb_vb_istvpkfgk4j.transactiontype    tt
                WHERE
                        h.businessunit = bu.id
                    AND h.transactiontyperef = tt.id
                    AND h.id = p_in_inv_id;

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
        p_in_inv_id     IN  NUMBER,
        p_in_requestor  IN  VARCHAR2
    ) AS
        v_new_inv_id     NUMBER := NULL;
        v_new_invlineid  NUMBER := NULL;
    BEGIN
        SELECT
            arss.xxgstt_inv_req_id_seq.nextval
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
                v_new_inv_id,
                to_timestamp(sysdate)                    creationdate,
                to_timestamp(sysdate)                    lastupdatedate,
                p_in_requestor                           createdby,
                p_in_requestor                           lastupdatedby,
                ''                                       abcschangenumber,
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
                arss.xxgstt_inv_req_ref_seq.nextval      invoicereference,
                'ENTERED'                                status,
                customername,
                transactiontype,
                transactiontyperef,
                customernameref,
                NULL                                     currentapprover,
                insurancecustomernumber,
                businessunit,
                ih.incomesysteamapprover,
                ih.financedirectorapprover,
                transactiontotal,
                p_in_inv_id
            FROM
                vb_vb_istvpkfgk4j.invoiceheader        ih,
                vb_vb_istvpkfgk4j.approvalhierarchy    appr
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
                arss.xxgstt_inv_req_line_id_seq.nextval
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
                    to_timestamp(sysdate)     creationdate,
                    to_timestamp(sysdate)     lastupdatedate,
                    p_in_requestor            createdby,
                    p_in_requestor            lastupdatedby,
                    ''                        abcschangenumber,
                    memoline,
                    description,
                    quantity,
                    unitprice,
                    taxcode,
                    amount,
                    invoicereference,
                    linenumber,
                    v_new_inv_id              invoiceheaderid,
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
                        arss.xxgstt_inv_req_dist_id_seq.nextval,
                        to_timestamp(sysdate)     creationdate,
                        to_timestamp(sysdate)     lastupdatedate,
                        p_in_requestor            createdby,
                        p_in_requestor            lastupdatedby,
                        ''                        abcschangenumber,
                        organizationref,
                        costcentreref,
                        subjectiveref,
                        wgaref,
                        intercompanyref,
                        analysisref,
                        spare1ref,
                        spare2ref,
                        invoicereference,
                        v_new_inv_id              invoiceheaderid,
                        v_new_invlineid           invoicelineid,
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

            END LOOP;

        END LOOP;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            htp.print(sqlerrm);
    END duplicate_invoice;

END;
/

SHOW ERR;