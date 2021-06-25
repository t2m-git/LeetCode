# Write your MySQL query statement below
SELECT
    c.customer_id
FROM
    Customer AS c
LEFT JOIN
    Product AS p ON p.product_key = c.product_key
GROUP BY c.customer_id
# DISTINCT clause for product table is just for insurance.
HAVING COUNT(DISTINCT p.product_key) = (SELECT COUNT(DISTINCT product_key) FROM product);
