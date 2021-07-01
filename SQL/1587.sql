# Write your MySQL query statement below
SELECT
    u.name,
    SUM(t.amount) AS balance
FROM
    Users AS u
INNER JOIN Transactions AS t ON t.account = u.account 
GROUP BY 1
HAVING balance > 10000;
