# Write your MySQL query statement below
SELECT
    p1.id AS p1,
    p2.id AS p2,
    ABS(p1.x_value - p2.x_value)*ABS(p1.y_value - p2.y_value) AS area
FROM
    Points AS p1
INNER JOIN Points AS p2 ON p1.id < p2.id
AND p2.x_value <> p1.x_value
AND p2.y_value <> p1.y_value
ORDER BY area DESC, p1 ASC, p2 ASC;
