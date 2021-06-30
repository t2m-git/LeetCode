# Write your MySQL query statement below
/*
SELECT 
    "[0-5>" AS bin,
    COUNT(CASE WHEN duration/60 < 5 AND duration/60 >=0 THEN session_id END) AS TOTAL
FROM
    Sessions
UNION
SELECT
    "[5-10>" as bin,
    COUNT(CASE WHEN duration/60 < 10 AND duration/60 >=5 THEN session_id END) AS TOTAL
FROM
    Sessions
UNION
SELECT 
    "[10-15>" as bin,
    COUNT(CASE WHEN duration/60 < 15 AND duration/60 >=10 THEN session_id END) AS TOTAL
FROM
    Sessions
UNION
SELECT
    "15 or more" as bin,
    COUNT(CASE WHEN duration/60 >=15 THEN session_id END) AS TOTAL
FROM
    Sessions;
*/

SELECT
    b.bin,
    IFNULL(c.total, 0) AS total
FROM
(
SELECT "[0-5>" AS bin 
UNION
SELECT "[5-10>" AS bin
UNION
SELECT "[10-15>" AS bin
UNION
SELECT "15 or more" AS bin
) AS b
LEFT JOIN
(
SELECT
    CASE
        WHEN duration / 60 < 5 THEN "[0-5>"
        WHEN duration / 60 < 10 THEN "[5-10>"
        WHEN duration / 60 < 15 THEN "[10-15>"
        ELSE "15 or more" END AS bin,
    CASE
        WHEN duration / 60 < 5 THEN COUNT(duration)
        WHEN duration / 60 < 10 THEN COUNT(duration)
        WHEN duration / 60 < 15 THEN COUNT(duration)
        ELSE COUNT(duration) END AS total 
FROM
    Sessions
GROUP BY bin
) AS c ON c.bin = b.bin;
