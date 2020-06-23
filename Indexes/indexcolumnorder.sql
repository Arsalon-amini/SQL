SELECT 
	COUNT(DISTINCT state),
    COUNT(DISTINCT last_name) -- lastName has higher cardinality vs. state 
FROM customers; 

CREATE INDEX idx_lastname_state ON customers
(last_name, state);  -- create a composite index (last name first)

CREATE INDEX idx_state_lastname ON customers
(state, last_name);  -- create a composite index (state first)

EXPLAIN SELECT customer_id
FROM customers
WHERE state = 'CA' AND last_name LIKE 'A%';



