--DROP TABLE arss.xxgstt_arss_inv_req_control_int;

CREATE TABLE arss.xxgstt_arss_inv_req_control_int (
    oic_flow_id             NUMBER(15, 0),
    arss_invoice_id         NUMBER(15, 0),
    arss_invoice_reference  VARCHAR2(30 BYTE),
	cust_trx_type_name      VARCHAR2(20 BYTE),
    bu_name                 VARCHAR2(150 BYTE),
    status                  VARCHAR2(30 BYTE),
    created_by              VARCHAR2(30 BYTE),
    creation_date           DATE,
    last_updated_by         VARCHAR2(30 BYTE),
    last_update_date        DATE
);
/

SHOW ERR;