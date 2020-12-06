CREATE OR REPLACE PACKAGE arselfservicepkg AS 
   -- Duplicates an Invoice 
    PROCEDURE duplicate_invoice (
        p_invoice_id       IN NUMBER,
        p_new_invoice_id   OUT NUMBER
    );

END arselfservicepkg;
/

SHOW ERRORS;