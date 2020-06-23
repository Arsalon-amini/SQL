EXPLAIN SELECT customer_id FROM customers WHERE points > 1000 ; 

CREATE INDEX idx_points ON customers (points);
DROP INDEX idx_lastname ON customers; 

SHOW INDEXES in customers;