# Write your MySQL query statement below
SELECT
    DISTINCT t1.product_id,
    ROUND(SUM(t1.price * t2.units) / SUM(t2.units), 2) AS average_price
FROM
    Prices AS t1
LEFT JOIN UnitsSold AS t2 ON t2.product_id = t1.product_id
WHERE
    t2.purchase_date BETWEEN t1.start_date AND t1.end_date
GROUP BY t1.product_id;
