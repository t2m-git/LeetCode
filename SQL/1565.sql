# Write your MySQL query statement below
SELECT
    #LEFT(order_date, 7) AS month,
    #SUBSTR(order_date, 1, 7) AS month,
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(order_id) AS order_count,
    COUNT(DISTINCT customer_id) AS customer_count
FROM
    Orders
WHERE
    invoice > 20
GROUP BY month;
