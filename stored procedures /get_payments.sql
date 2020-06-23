DROP PROCEDURE IF EXISTS get_payments;

DELIMITER $$
CREATE PROCEDURE `get_payments`(
	client_id INT,  -- takes 4 bytes, can store larger numbers 
    payment_method_id TINYINT -- takes 2 bytes, stores up to 255 
)
BEGIN
		SELECT * 
        FROM payments p
        WHERE p.client_id = IFNULL(client_id, p.client_id)-- if client_id is NULL, use same value in p.client_id column
        AND p.payment_method = IFNULL(payment_method_id, p.payment_method); -- parameter and table column name differ slighlty (real world scenario)
        
END $$

DELIMITER ; 