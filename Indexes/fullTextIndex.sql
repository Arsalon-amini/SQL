USE sql_blog;
EXPLAIN SELECT *
FROM posts
WHERE title LIKE '%react redux%' OR 
				body LIKE '%react redux%';
                
SHOW INDEXES IN posts;
ANALYZE TABLE posts;
SHOW STATUS LIKE 'last_query_cost'; 

CREATE FULLTEXT INDEX idx_title_body ON posts(title, body); -- composite fulltext index (title column, name column)

EXPLAIN SELECT *
FROM posts
WHERE MATCH (title, body) AGAINST ('react -redux +form' IN BOOLEAN MODE);