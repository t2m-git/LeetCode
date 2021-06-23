# Write your MySQL query statement below
SELECT
    s.product_id, p.product_name
FROM
    (
    
    SELECT
        product_id,
        MIN(sale_date) AS oldest_sold,
        MAX(sale_date) AS latest_sold,
        SUM(quantity) AS sum_q
    FROM
        Sales
    GROUP BY product_id
    HAVING 
        sum_q > 0
    
    ) AS s
INNER JOIN Product AS p ON s.product_id = p.product_id
WHERE
    s.oldest_sold BETWEEN '2019-01-01' AND '2019-03-31' AND
    s.latest_sold BETWEEN '2019-01-01' AND '2019-03-31';
