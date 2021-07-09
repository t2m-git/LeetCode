# Write your MySQL query statement below
SELECT
    DISTINCT customer_id
FROM
    Customers
WHERE
    year = 2021
    AND revenue > 0;
