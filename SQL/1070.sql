# Write your MySQL query statement below
WITH CTE AS (

SELECT
    s.*,
    MIN(s.year) OVER (PARTITION BY s.product_id) AS first_year
FROM
    Sales AS s

)

SELECT
    product_id,
    first_year,
    quantity,
    price
FROM
    CTE
WHERE
    year = first_year;
