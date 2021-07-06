# Write your MySQL query statement below
/*
SELECT
    o.customer_id,
    c.customer_name
FROM
    Customers AS c
INNER JOIN Orders AS o ON o.customer_id = c.customer_id
GROUP BY o.customer_id 
HAVING COUNT(o.product_name IN ('A', 'B') OR null) > 1
AND COUNT(o.product_name = 'C' or null) = 0;
*/

WITH CTE_ONE AS (
SELECT
    customer_id
FROM
    Orders
WHERE
    product_name IN ('A', 'B', 'C')
GROUP BY customer_id
HAVING COUNT(DISTINCT product_name) = 2    
),

CTE_TWO AS (
SELECT
    customer_id
FROM 
    Orders
WHERE
    product_name IN ('A', 'B')
GROUP BY customer_id
HAVING COUNT(DISTINCT product_name) = 2      
)

SELECT
    a.customer_id,
    c.customer_name
FROM 
    CTE_ONE AS a 
INNER JOIN CTE_TWO AS b ON b.customer_id = a.customer_id
INNER JOIN Customers AS c ON c.customer_id = a.customer_id
ORDER BY A.customer_id;
