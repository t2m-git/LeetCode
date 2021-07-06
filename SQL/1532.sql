# Write your MySQL query statement below
SELECT
c.name AS customer_name,
c.customer_id,
o.order_id,
o.order_date
FROM
    Customers AS c
LEFT JOIN (
SELECT
    customer_id,
    order_date,
    order_id,
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS my_num
FROM
    Orders
) AS o ON o.customer_id = c.customer_id
WHERE
    my_num <= 3
ORDER BY 1, 2, 4 DESC;
