# Write your MySQL query statement below
SELECT
    p.product_name,
    s.product_id,
    s.order_id,
    s.order_date
FROM
(
SELECT
    *,
    RANK() OVER (PARTITION BY product_id ORDER BY order_date DESC) AS my_rank
FROM
    Orders
) AS s
INNER JOIN Products AS p ON p.product_id = s.product_id
WHERE
    my_rank = 1
ORDER BY 1, 2, 3;
