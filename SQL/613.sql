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
