DROP TABLE vb_vb_istvpkfgk4j.xxgstt_arss_inv_req_control_int;

CREATE TABLE vb_vb_istvpkfgk4j.xxgstt_arss_inv_req_control_int (
    oic_flow_id                  NUMBER(15,0),
    arss_invoice_reference   VARCHAR2(30 BYTE),
    arss_invoice_id          VARCHAR2(30 BYTE),
    status                   VARCHAR2(30 BYTE),
    created_by               NUMBER(15,0),
    creation_date            DATE,
    last_updated_by          NUMBER(15,0),
    last_update_date         DATE
);

/

SHOW ERR;