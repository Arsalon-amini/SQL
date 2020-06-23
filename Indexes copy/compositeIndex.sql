USE sql_store;

-- slow query, doesn't use index 
EXPLAIN SELECT customer_id 
FROM customers 
WHERE state = 'CA'
ORDER BY points; -- second column in (state, points) composite index 

-- fast query, uses index 
CREATE INDEX idx_state_points ON customers (state, points); -- order matters 
EXPLAIN SELECT customer_id FROM customers
WHERE state = 'CA' AND points > 1000; -- uses index by narrowing search to state, then points 


SHOW INDEXES IN customers;
DROP INDEX idx_state ON customers;
DROP INDEX idx_points ON customers;