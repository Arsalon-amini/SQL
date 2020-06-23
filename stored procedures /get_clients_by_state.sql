DROP PROCEDURE IF EXISTS get_clients_by_state;

DELIMITER $$
CREATE PROCEDURE get_clients_by_state
(
	state CHAR (2) -- parameters for function here 
)
BEGIN
	IF state IS NULL THEN 
		SET STATE = 'CA'; -- DEFAULT value (argument) 
	END IF; -- end of of block 

	SELECT * 
    FROM clients c
    WHERE c.state = state; -- compar value in state column with param
END $$

DELIMITER ; 