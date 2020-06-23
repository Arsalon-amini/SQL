CREATE DEFINER=`root`@`localhost` FUNCTION `get_risk_factor_for_client`(
	client_id INT
) RETURNS int
    READS SQL DATA
BEGIN
		DECLARE risk_factor DECIMAL (9, 2) DEFAULT 0; -- declaring a variable with a max of 9 digits and 2 digits after decimal 
		DECLARE invoices_total DECIMAL (9, 2);
		DECLARE invoices_count INT;
    
		SELECT count(*), SUM(invoice_total)
		INTO invoices_count, invoices_total -- coorespond to values in SELECT statement
		FROM invoices i
        WHERE i.client_id = client_id; -- equal to input 
    
    SET risk_factor = invoices_total / invoices_count * 5; 
    RETURN IFNULL(risk_factor, 0); 
END