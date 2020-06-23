DROP TRIGGER IF EXISTS payments_after_insert;

DELIMITER $$

CREATE TRIGGER payments_after_insert -- tableName_beforeORafter_typeOfStatement
	AFTER INSERT ON payments -- AFTER vs BEFORE OR INSERT vs UPDATE vs DELETE 
    FOR EACH ROW 
BEGIN
	UPDATE invoices -- can modify data in any table except payments (trigger) or infinite loop happens
    SET payment_total = payment_total + NEW.amount 
    WHERE invoice_id = NEW.invoice_id; 
    
    INSERT INTO payments_audit
    VALUES (NEW.client_id, NEW.date, NEW.amount, 'insert', NOW());
END $$

DELIMITER ; 