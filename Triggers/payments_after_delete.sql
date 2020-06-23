DROP TRIGGER IF EXISTS payments_after_delete; -- check into source file, to view history of changes

DELIMITER $$ 

CREATE TRIGGER payments_after_delete
	AFTER DELETE ON payments
    FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total- OLD.amount -- get values in row deleted 
    WHERE invoice_id = OLD.invoice_id;
    
    INSERT INTO payments_audit -- insert new record in audit table 
    VALUES (OLD.client_id, NEW.date, OLD.amount, 'delete', NOW());

END $$

DELIMITER ; 



