# Write your MySQL query statement below
SELECT
    TRIM(LOWER(product_name)) AS product_name,
    #lower(product_name) AS product_name,
    SUBSTR(sale_date, 1, 7) AS sale_date,
    #DATE_FORMAT(sale_date, '%Y-%m') AS sale_date,
    COUNT(sale_date) AS total
FROM
    Sales
#OK
#GROUP BY 1, 2
#OK
GROUP BY TRIM(LOWER(product_name)), SUBSTR(sale_date, 1, 7)
#NG
#GROUP BY product_name, sale_date
ORDER BY 1 ASC, 2 ASC;
