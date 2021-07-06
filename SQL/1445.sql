# Write your MySQL query statement below
/*
WITH CTE1 AS (
SELECT
    sale_date,
    fruit,
    SUM(sold_num) AS sold_sum
FROM
    Sales
WHERE
    fruit = 'apples'
GROUP BY sale_date, fruit
), CTE2 AS (
SELECT
    sale_date,
    fruit,
    SUM(sold_num) AS sold_sum
FROM
    Sales
WHERE
    fruit = 'oranges'
GROUP BY sale_date, fruit
)


SELECT
    c1.sale_date,
    c1.sold_sum - c2.sold_sum AS diff
FROM
    CTE1 AS c1
INNER JOIN CTE2 AS c2 ON c2.sale_date = c1.sale_date;
*/
WITH CTE AS (
SELECT
    sale_date,
    fruit,
    SUM(sold_num) AS sold_sum
FROM
    Sales
GROUP BY sale_date, fruit
)

SELECT
    c1.sale_date,
    c1.sold_sum - c2.sold_sum AS diff
FROM
    CTE AS c1
INNER JOIN CTE AS c2 ON c2.sale_date = c1.sale_date
WHERE
    c1.fruit = 'apples'
    AND c2.fruit = 'oranges';
