
CREATE USER moon_app IDENTIFIED BY '123'; -- user account for an application called moon, password = INDETIFIED BY 
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE
ON sql_store.* -- * means all tables in sql_store db 
TO moon_app; 