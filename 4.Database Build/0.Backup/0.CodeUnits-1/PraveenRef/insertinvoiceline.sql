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
        invoicereference||'_COPY' invoicereference,
        linenumber,
        dupinvoiceidseq.CURRVAL invoiceheaderid,
        taxrate,
        distributiontotal
    FROM
        vb_vb_ewqcm44qfwh.invoiceline
    WHERE
        invoiceheaderid = 1;