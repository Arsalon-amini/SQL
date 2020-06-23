CREATE DATABASE IF NOT EXISTS sql_store2;
USE sql_store2;


DROP TABLE IF EXISTS orders; -- must drop dependent table first, allow MySQL to drop parent table (orders depends on customers)
DROP TABLE IF EXISTS customers;
CREATE TABLE customers
(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) CHARACTER SET latin1 NOT NULL,
    points 		INT NOT NULL DEFAULT 0,
    email 		VARCHAR(255) NOT NULL UNIQUE -- every customer has a unique email    
    );
    
    
    CREATE TABLE orders
    (
			order_id INT PRIMARY KEY, -- my SQL assumes will not accept null values "not null" is under the hood 
            customer_id INT NOT NULL,
            FOREIGN KEY fk_orders_customers (customer_id)
				REFERENCES customers (customer_id)
                ON UPDATE CASCADE -- cascade, set null, no action (foreign key pannel options) 
				ON DELETE NO ACTION -- won't let a customer be deleted if there is an order for the customer
    );