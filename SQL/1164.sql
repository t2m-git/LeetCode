# Write your MySQL query statement below
SELECT
    p1.product_id,
    IFNULL(p3.new_price, 10) AS `price` 
FROM
   (
       
    SELECT
       DISTINCT product_id
    FROM
       Products

    ) AS p1
LEFT JOIN 
    (

    SELECT
        product_id,
        MAX(change_date) AS recent_date
    FROM
        Products
    WHERE
        change_date <= '2019-08-16'
    GROUP BY product_id
    ) AS p2
ON p2.product_id = p1.product_id
LEFT JOIN Products AS p3 ON p3.product_id = p1.product_id
AND p3.change_date = p2.recent_date;
