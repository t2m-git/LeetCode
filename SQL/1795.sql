# Write your MySQL query statement below
SELECT
    s.product_id,
    s.store,
    s.price
FROM
(
SELECT
    product_id,
    'store1' AS `store`,
    store1 AS price
FROM
    Products
UNION ALL
SELECT
    product_id,
    'store2' AS `store`,
    store2 AS price
FROM
    Products
UNION ALL
SELECT
    product_id,
    'store3' AS `store`,
    store3 AS price
FROM
    Products
) AS s
WHERE
    s.price IS NOT NULL;
