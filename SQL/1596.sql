# Write your MySQL query statement below
WITH cte as (
SELECT 
    o.customer_id,
    p.product_id,
    p.product_name,
    COUNT(o.product_id) as cnt,
    DENSE_RANK() over(PARTITION by o.customer_id ORDER BY COUNT(o.product_id) DESC) AS my_rank 
FROM
  products AS p 
RIGHT JOIN orders o on o.product_id = p.product_id
GROUP BY o.customer_id, p.product_name 
ORDER BY o.customer_id
)

SELECT
    customer_id,
    product_id,
    product_name
FROM
    cte
WHERE
    my_rank = 1;
