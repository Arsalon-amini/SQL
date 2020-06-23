EXPLAIN SELECT customer_id FROM customers 

ORDER BY state, first_name, points; 
SHOW STATUS LIKE 'last_query_cost'; -- returns cost of last query (non index expensive vs. index sorting better) 