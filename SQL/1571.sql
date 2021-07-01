# Write your MySQL query statement below
SELECT
    w.name AS warehouse_name,
    SUM((p.Width * p.Length * p.Height) * w.units) AS volume
FROM
    Warehouse AS w
LEFT JOIN Products AS p ON p.product_id = w.product_id
GROUP BY warehouse_name;
