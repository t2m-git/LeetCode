# Write your MySQL query statement below
SELECT
    ROUND(
        SQRT(MIN(POWER(p1.x - p2.x, 2) + POWER(p1.y - p2.y, 2)))
        , 2) AS shortest
FROM
    point_2d AS p1
INNER JOIN
    point_2d AS p2 ON p1.x <> p2.x 
    OR p1.y <> p2.y;
