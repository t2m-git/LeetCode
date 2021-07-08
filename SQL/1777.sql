# Write your MySQL query statement below
SELECT
    s.product_id,
    SUM(CASE WHEN s.store = 'store1' THEN s.price ELSE NULL END) AS store1,
    SUM(CASE WHEN s.store = 'store2' THEN s.price ELSE NULL END) AS store2,
    SUM(CASE WHEN s.store = 'store3' THEN s.price ELSE NULL END) AS store3
FROM
    Products AS s
GROUP BY 1;
