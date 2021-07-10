# Write your MySQL query statement below
WITH cte AS 
    (SELECT
        a.account_id,
        DATE_FORMAT(t.day,"%Y-%m-01") AS month,
        SUM(t.amount) AS amounts,
        a.max_income
    FROM
        Transactions AS t
    INNER JOIN Accounts AS a ON a.account_id = t.account_id
    WHERE
        type="Creditor"
    GROUP BY 1,2
    HAVING amounts > a.max_income
    ORDER BY 1,2)

SELECT
    c1.account_id
FROM
    cte AS c1
INNER JOIN cte AS c2 ON c2.account_id = c1.account_id
WHERE
    ABS(TIMESTAMPDIFF(month, c1.month, c2.month)) = 1
GROUP BY 1;
