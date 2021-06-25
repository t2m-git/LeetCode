# Write your MySQL query statement below
SELECT
    DISTINCT l1.Num AS ConsecutiveNums
FROM
    Logs AS l1, Logs AS l2, Logs AS l3
WHERE
    l1.id = l2.id -1 AND
    l2.id = l3.id -1 AND    
    l1.Num = l2.Num AND
    l2.Num = l3.Num;
    
/*
SELECT
    DISTINCT l.Num AS ConsecutiveNums
FROM
    (
    SELECT
        *,
        LAG(Num, 1) OVER (ORDER BY Id ASC) AS lag1,
        LAG(Num, 2) OVER (ORDER BY Id ASC) AS lag2
    FROM
        Logs
    ) AS l
WHERE
    l.Num = lag1
    AND l.Num = lag2;

SELECT
    DISTINCT l1.Num AS ConsecutiveNums
FROM
    Logs AS l1
INNER JOIN Logs AS l2 ON l2.Id = (l1.Id + 1)
INNER JOIN Logs AS l3 ON l3.Id = (l2.Id + 1)
WHERE
    l1.Num = l2.Num
    AND l2.Num = l3.Num;
*/
