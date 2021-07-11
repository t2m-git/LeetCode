# Write your MySQL query statement below
WITH cte AS (
SELECT
    'Low Salary' AS category
UNION
SELECT
    'Average Salary' AS category
UNION
SELECT
    'High Salary' AS category
)

SELECT
    c.category,
    COUNT(s.category) AS accounts_count
FROM
    cte AS c
LEFT JOIN (
SELECT
    account_id,
    income,
    CASE
        WHEN income < 20000 THEN 'Low Salary'
        WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
        ELSE 'High Salary' END AS category
FROM
    Accounts
) AS s ON s.category = c.category
GROUP BY s.category;
