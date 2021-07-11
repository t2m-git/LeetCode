# Write your MySQL query statement below
SELECT
    order_id
FROM
(
SELECT
    order_id,
    MAX(quantity) AS max_q
FROM
    OrdersDetails
GROUP BY order_id
 ) AS s1      
WHERE
    s1.max_q > (
SELECT
    MAX(s2.mean_q)
FROM
(
SELECT
    order_id,
    AVG(quantity) AS mean_q
FROM
    OrdersDetails
GROUP BY order_id
) AS s2
);
