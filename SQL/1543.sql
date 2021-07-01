# Write your MySQL query statement below
SELECT
    lower(product_name) AS product_name,
    SUBSTR(sale_date, 1, 7) AS sale_date,
    #DATE_FORMAT(sale_date, '%Y-%m') AS sale_date,
    COUNT(sale_date) AS total
FROM
    Sales
GROUP BY 1, 2
ORDER BY 1 ASC, 2 ASC;
