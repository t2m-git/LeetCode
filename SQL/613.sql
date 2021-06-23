# Write your MySQL query statement below
SELECT
    MIN(s.distance) AS shortest
FROM
    (
    SELECT
        x,
        x - LAG(x) OVER(ORDER BY x ASC) AS distance
    FROM
        point
    ) AS s;

/*
SELECT
    MIN(ABS(p1.x - p2.x)) as shortest
FROM
    point as p1
INNER JOIN point as p2 ON p1.x <> p2.x;


SELECT 
    MIN(ABS(p1.x - p2.x)) as shortest
FROM
    point p1, point p2
WHERE
    p1.x <> p2.x;
*/
