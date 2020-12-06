select * from all_users where username like 'VB%';

select * from all_tables where owner='ADMIN';--VB_VB_BZUHYLUZKAZ

select * from VB_VB_ISTVPKFGK4J.INVOICEHEADER;

select * from VB_VB_ISTVPKFGK4J.INVOICELINE;

select * from VB_VB_ISTVPKFGK4J.TAXCODE;

select c.code from VB_VB_ISTVPKFGK4J.currency c where c.id = h.currency;

SELECT
        1 p_in_oic_flow_id,
        h.invoicereference,
        h.id   invoice_id,
        l.id   invoice_line_id,
		'AR Import' INTERFACE_LINE_CONTEXT,
		h.invoicereference INTERFACE_LINE_ATTRIBUTE1,
		h.id INTERFACE_LINE_ATTRIBUTE2,
		l.id INTERFACE_LINE_ATTRIBUTE3,
		'EBS_DATA_MIGRATION' BATCH_SOURCE_NAME,
		'LINE' LINE_TYPE,
		l.description,
		(select c.code from VB_VB_ISTVPKFGK4J.currency c where c.id = h.currency) CURRENCY_CODE,
        l.amount,
        h.transactiontype CUST_TRX_TYPE_NAME,
        '30 Days' TERM_NAME,
        ORIG_SYSTEM_BILL_CUSTOMER_REF
    FROM
        vb_vb_istvpkfgk4j.invoiceheader h,
        vb_vb_istvpkfgk4j.invoiceline l
    WHERE
        h.id = 1000006--p_in_inv_id
        AND h.id = l.invoiceheaderid;

INSERT INTO vb_vb_istvpkfgk4j.xxgstt_arss_inv_req_lines_int (
    oic_flow_id,
    arss_invoice_reference,
    arss_invoice_id,
    arss_invoice_line_id
)
    SELECT
        '1' p_in_oic_flow_id,
        h.invoicereference,
        h.id   invoice_id,
        l.id   invoice_line_id
    FROM
        vb_vb_istvpkfgk4j.invoiceheader h,
        vb_vb_istvpkfgk4j.invoiceline l
    WHERE
        h.id = 1000006
        AND h.id = l.invoiceheaderid;

select * from ra_interface_lines_all;

SELECT
    description,
    quantity,
    unitprice,
    t.name,
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
    vb_vb_istvpkfgk4j.invoicedistribution d,
    VB_VB_ISTVPKFGK4J.TAXCODE t
WHERE
    l.invoiceheaderid = 1000006
    AND l.invoiceheaderid = d.invoiceheaderid
    AND l.id = d.invoicelineid
    AND l.taxcode = t.id;

delete from VB_VB_ISTVPKFGK4J.INVOICEHEADER where id in (1000001,1000003);

select * from VB_VB_ISTVPKFGK4J.INVOICEDISTRIBUTION;

select distributiontotal from VB_VB_ISTVPKFGK4J.INVOICELINE;

select revenuedeptapprover,incomesysteamapprover,financedirectorapprover from VB_VB_ISTVPKFGK4J.APPROVALHIERARCHY where requestor = 'techtutorsti@gmail.com';

select revenuedeptapprover,incomesysteamapprover,financedirectorapprover from VB_VB_ISTVPKFGK4J.APPROVALHIERARCHY where requestor = :requestor;

update VB_VB_ISTVPKFGK4J.APPROVALHIERARCHY 
set revenuedeptapprover = 'incomesysteamapprover@gmail.com'
where requestor = :requestor;