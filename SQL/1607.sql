# Write your MySQL query statement below
SELECT
    s1.seller_name
FROM
    Seller AS s1
WHERE
    s1.seller_id NOT IN
(
SELECT
    s.seller_id
FROM
    Orders AS o
INNER JOIN Seller AS s ON s.seller_id = o.seller_id
WHERE
    YEAR(o.sale_date) = 2020
)
ORDER BY s1.seller_name;
