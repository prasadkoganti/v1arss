CREATE OR REPLACE PACKAGE xxgstt_arss_invoice_request IS
    PROCEDURE get_inv_reference (
        p_in_requestor        IN VARCHAR2,
        p_out_inv_reference   OUT VARCHAR2
    );
      
    PROCEDURE duplicate_invoice (
        p_in_invoice_id       IN NUMBER,
        p_out_new_invoice_id   OUT NUMBER
    );

END xxgstt_arss_invoice_request;
/

CREATE OR REPLACE PACKAGE BODY xxgstt_arss_invoice_request AS

    PROCEDURE get_inv_reference (
        p_in_requestor        IN VARCHAR2,
        p_out_inv_reference   OUT VARCHAR2
    ) AS
    BEGIN
        SELECT
            inv_req_reference.NEXTVAL
        INTO inv_reference
        FROM
            dual;

    END get_inv_reference;

END xxgstt_arss_invoice_request;