# Write your MySQL query statement below
/*
WITH cte1 AS (

SELECT
    MIN(s1.cnt)
FROM
    (
        SELECT
            activity,
            COUNT(activity) AS cnt
        FROM
            Friends
        GROUP BY activity
    ) AS s1
), cte2 AS (

SELECT
    MAX(s2.cnt)
FROM
    (
        SELECT
            activity,
            COUNT(activity) AS cnt
        FROM
            Friends
        GROUP BY activity
    ) AS s2
)


SELECT
    f.activity
FROM
    Friends AS f
INNER JOIN Activities AS a ON a.name = f.activity
GROUP BY f.activity
HAVING COUNT(f.activity) NOT IN (

SELECT * FROM cte1
UNION ALL
SELECT * FROM cte2

)
*/
SELECT
    DISTINCT activity
FROM
    (SELECT 
        activity,
        RANK() OVER (ORDER BY COUNT(activity) DESC) AS highest_participant,
        RANK() OVER (ORDER BY COUNT(activity) ASC) AS lowest_participant
    FROM
        Friends
    GROUP BY activity) AS temp
    WHERE temp.highest_participant <> 1 AND temp.lowest_participant <> 1;
