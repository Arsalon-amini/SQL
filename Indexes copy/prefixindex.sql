-- Finding optimal prefix length for prefix index on last_name column
SELECT
			COUNT(DISTINCT LEFT (last_name, 1)) AS cardinalityOneCharIndex,
            COUNT(DISTINCT LEFT (last_name, 5)) AS cardinality_5_CharIndex,
            COUNT(DISTINCT LEFT (last_name, 10)) AS cardinality_10_CharIndex,
            COUNT(DISTINCT LEFT (last_name, 20)) AS cardinality_20_CharIndex
FROM customers;
    
    
CREATE INDEX idx_lastName ON customers (last_name(5)); -- prefix index optimial length last_name cardinality 
ANALYZE TABLE customers;
SHOW INDEXES IN customers;

DROP INDEX idx_lastname ON customers;



