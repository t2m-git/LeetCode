# Write your MySQL query statement below
SELECT
    p.product_name,
    SUM(o.unit) AS unit
FROM
    Orders AS o
INNER JOIN Products AS p ON p.product_id = o.product_id
WHERE
    #o.order_date BETWEEN '2020-02-01' AND '2020-02-01' + INTERVAL 28 DAY
    MONTH(o.order_date) = 2
GROUP BY o.product_id
HAVING SUM(o.unit) >= 100;
