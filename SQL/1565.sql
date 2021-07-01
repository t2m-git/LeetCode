# Write your MySQL query statement below
SELECT
    LEFT(order_date, 7) AS month,
    COUNT(invoice) AS order_count,
    COUNT(DISTINCT customer_id) AS customer_count
FROM
    Orders
WHERE
    invoice > 20
GROUP BY month;
