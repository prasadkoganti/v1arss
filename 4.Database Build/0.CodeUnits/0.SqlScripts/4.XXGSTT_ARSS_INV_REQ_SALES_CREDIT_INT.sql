DROP TABLE arss.xxgstt_arss_inv_req_salescredits_int;

CREATE TABLE arss.xxgstt_arss_inv_req_salescredits_int (
    oic_flow_id                 NUMBER(15, 0),
    arss_invoice_reference      VARCHAR2(30 BYTE),
    arss_invoice_id             NUMBER(15, 0),
    arss_invoice_line_id        NUMBER(15, 0),
    fbdi_string                 VARCHAR2(10000 BYTE),
    bu_name                     VARCHAR2(150 BYTE),
    salesrep_number             VARCHAR2(30 BYTE),
    salesrep_id                 NUMBER(15, 0),
    sales_credit_type_name      VARCHAR2(30 BYTE),
    sales_credit_type_id        NUMBER(15, 0),
    sales_credit_amount_split   NUMBER(15, 0),
    sales_credit_percent_split  NUMBER(15, 0),
    interface_line_id           NUMBER(15, 0),
    interface_line_context      VARCHAR2(30 BYTE),
    interface_line_attribute1   VARCHAR2(150 BYTE),
    interface_line_attribute2   VARCHAR2(150 BYTE),
    interface_line_attribute3   VARCHAR2(150 BYTE),
    interface_line_attribute4   VARCHAR2(150 BYTE),
    interface_line_attribute5   VARCHAR2(150 BYTE),
    interface_line_attribute6   VARCHAR2(150 BYTE),
    interface_line_attribute7   VARCHAR2(150 BYTE),
    interface_line_attribute8   VARCHAR2(150 BYTE),
    interface_line_attribute9   VARCHAR2(150 BYTE),
    interface_line_attribute10  VARCHAR2(150 BYTE),
    interface_line_attribute11  VARCHAR2(150 BYTE),
    interface_line_attribute12  VARCHAR2(150 BYTE),
    interface_line_attribute13  VARCHAR2(150 BYTE),
    interface_line_attribute14  VARCHAR2(150 BYTE),
    interface_line_attribute15  VARCHAR2(150 BYTE)
);
/

SHOW ERR;