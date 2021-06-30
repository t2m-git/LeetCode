# Write your MySQL query statement below
SELECT
    t.customer_id,
    t.name
FROM
(
SELECT
    SUBSTR(o.order_date, 1, 7) AS order_month,
    o.customer_id,
    c.name,
    SUM(o.quantity * p.price) AS rev
FROM
    Orders AS o
INNER JOIN Customers AS c ON c.customer_id = o.customer_id    
INNER JOIN Product AS p ON p.product_id = o.product_id
WHERE
SUBSTR(o.order_date, 1, 7) IN ('2020-06', '2020-07')
GROUP BY order_month, o.customer_id
HAVING (SUM(o.quantity * p.price) >= 100)
) AS t
GROUP BY t.customer_id
HAVING COUNT(*) = 2;

/*
SELECT
    c.customer_id,
    c.name
FROM
    orders as o
LEFT JOIN product as p ON o.product_id = p.product_id
LEFT JOIN customers as c ON o.customer_id= c.customer_id
GROUP BY 1,2
HAVING
SUM(CASE WHEN month(o.order_date)=06 THEN (o.quantity*p.price) END) >= 100
AND SUM(CASE WHEN month(o.order_date)=07 THEN (o.quantity*p.price) END ) >=100;
*/
