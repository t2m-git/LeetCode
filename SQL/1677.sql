# Write your MySQL query statement below
SELECT
    p.name,
    IFNULL(SUM(rest), 0) AS rest,
    IFNULL(SUM(paid), 0) AS paid,
    IFNULL(SUM(canceled), 0) AS canceled,
    IFNULL(SUM(refunded), 0) AS refunded
FROM
    Product AS p
LEFT JOIN Invoice AS i ON p.product_id = i.product_id
GROUP BY p.product_id
ORDER BY p.name;
