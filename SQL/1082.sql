# Write your MySQL query statement below
WITH TEMP AS (

SELECT
    seller_id,
    SUM(price),
    DENSE_RANK() OVER(ORDER BY SUM(price) DESC) AS my_rank
FROM
    Sales
GROUP BY seller_id

)

SELECT
    seller_id
FROM
    TEMP
WHERE
    my_rank = 1;
