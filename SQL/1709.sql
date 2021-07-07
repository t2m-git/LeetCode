# Write your MySQL query statement below
WITH CTE AS (

SELECT
    DISTINCT user_id,
    '2021-1-1' AS visit_date
FROM
    UserVisits
UNION ALL
SELECT
    DISTINCT user_id,
    visit_date
FROM
    UserVisits
)

SELECT
    s.user_id,
    MAX(DATEDIFF(lag1, visit_date)) AS biggest_window
FROM
(
SELECT
    c1.user_id,
    c1.visit_date,
    LAG(visit_date, 1) OVER (PARTITION BY user_id ORDER BY visit_date DESC) AS lag1
FROM
    CTE AS c1
) AS s
GROUP BY 1;
