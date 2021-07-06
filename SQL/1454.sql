# Write your MySQL query statement below
/*
SELECT
    DISTINCT s1.id,
    a.name
FROM
(
SELECT
    s.id,
    s.login_date,
    LAG(s.login_date, 1) OVER (PARTITION BY s.id ORDER BY s.login_date) AS lag1,
    LAG(s.login_date, 2) OVER (PARTITION BY s.id ORDER BY s.login_date) AS lag2,
    LAG(s.login_date, 3) OVER (PARTITION BY s.id ORDER BY s.login_date) AS lag3,
    LAG(s.login_date, 4) OVER (PARTITION BY s.id ORDER BY s.login_date) AS lag4,
    LEAD(s.login_date, 1) OVER (PARTITION BY s.id ORDER BY s.login_date) AS lead1,
    LEAD(s.login_date, 2) OVER (PARTITION BY s.id ORDER BY s.login_date) AS lead2,
    LEAD(s.login_date, 3) OVER (PARTITION BY s.id ORDER BY s.login_date) AS lead3,
    LEAD(s.login_date, 4) OVER (PARTITION BY s.id ORDER BY s.login_date) AS lead4
FROM
(
SELECT
    DISTINCT id, login_date
FROM
    Logins
ORDER BY id, login_date
) AS s
) AS s1
INNER JOIN Accounts AS a ON a.id = s1.id
WHERE
    (
    DATEDIFF(s1.login_date, s1.lag1) = 1
    AND DATEDIFF(s1.login_date, s1.lag2) = 2
    AND DATEDIFF(s1.login_date, s1.lag3) = 3
    AND DATEDIFF(s1.login_date, s1.lag4) = 4)
    OR
    (
    DATEDIFF(s1.lead1, s1.login_date) = 1
    AND DATEDIFF(s1.lead1, s1.lag1) = 2
    AND DATEDIFF(s1.lead1, s1.lag2) = 3
    AND DATEDIFF(s1.lead1, s1.lag3) = 4  
    )
    OR
    (
    DATEDIFF(s1.lead2, s1.lead1) = 1
    AND DATEDIFF(s1.lead2, s1.login_date) = 2
    AND DATEDIFF(s1.lead2, s1.lag1) = 3
    AND DATEDIFF(s1.lead2, s1.lag2) = 4  
    )
    OR
    (
    DATEDIFF(s1.lead3, s1.lead2) = 1
    AND DATEDIFF(s1.lead3, s1.lead1) = 2
    AND DATEDIFF(s1.lead3, s1.login_date) = 3
    AND DATEDIFF(s1.lead3, s1.lag1) = 4  
    )
    OR
    (
    DATEDIFF(s1.lead4, s1.lead3) = 1
    AND DATEDIFF(s1.lead4, s1.lead2) = 2
    AND DATEDIFF(s1.lead4, s1.lead1) = 3
    AND DATEDIFF(s1.lead4, s1.login_date) = 4  
    )
ORDER BY id;

WITH CTE AS (
SELECT 
    id,
    DAYOFYEAR(login_date)- (RANK() OVER(PARTITION BY id ORDER BY login_date)) AS flag
FROM 
    (
    SELECT
        DISTINCT
            id,
            login_date
        FROM
            Logins
    ) AS a
ORDER BY id, DAYOFYEAR(login_date))

SELECT 
    DISTINCT c.id, a.name
FROM
    cte AS c
INNER JOIN Accounts AS A ON c.id = a.id
GROUP BY flag, id
HAVING COUNT(c.flag)>=5
ORDER BY c.id


SELECT
    DISTINCT p.id, a.name
FROM 
    (
    SELECT
        id,
        datediff(login_date, lag(login_date,4) over (PARTITION BY id ORDER BY login_date)) AS diff
    FROM (SELECT DISTINCT * FROM Logins) AS s) AS p
    INNER JOIN Accounts AS a USING(id)
WHERE diff = 4
ORDER BY 1

*/


SELECT
    DISTINCT l1.id, a.name
FROM
    Accounts AS a
INNER JOIN Logins AS l1 using(id)
INNER JOIN Logins AS l2 on l2.id = a.id 
AND DATEDIFF(l2.login_date, l1.login_date) BETWEEN 1 AND 4
GROUP BY l1.id, l1.login_date
HAVING COUNT(DISTINCT l2.login_date) = 4
ORDER BY 1;
