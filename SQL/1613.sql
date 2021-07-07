# Write your MySQL query statement below
WITH RECURSIVE cte AS(
    SELECT 1 AS 'ids'
    UNION ALL
    SELECT ids + 1 AS 'ids' FROM cte
    #WHERE ids <= 100
    WHERE (ids + 1) <= (SELECT MAX(customer_id) FROM customers)
)

SELECT
    ids
FROM 
    cte
WHERE
    ids NOT IN 
        (SELECT customer_id FROM customers)
    #AND ids <= (SELECT MAX(customer_id) FROM customers)
    ;
