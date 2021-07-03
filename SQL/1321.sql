# Write your MySQL query statement below
SELECT
    s2.visited_on,
    s2.amount,
    s2.average_amount
FROM
(
SELECT
    s1.visited_on,
    ROUND(SUM(s1.amount) OVER (ORDER BY s1.visited_on ROWS BETWEEN 6 preceding and current row), 2) AS amount,
    ROUND(AVG(s1.amount) OVER (ORDER BY s1.visited_on ROWS BETWEEN 6 preceding and current row), 2) AS average_amount,
    ROW_NUMBER() OVER (ORDER BY s1.visited_on) AS row_num
FROM
    (
    SELECT
        visited_on,
        SUM(amount) AS amount
    FROM
        Customer
    GROUP BY visited_on  
    ) AS s1
) AS s2
WHERE
    row_num >= 7
ORDER BY visited_on;
