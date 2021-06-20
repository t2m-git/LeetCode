# Write your MySQL query statement below
#SELECT
#    w2.id
#FROM
#    Weather AS w1, Weather AS w2
#WHERE
#    to_days(w2.recordDate) = to_days(w1.recordDate) + 1 AND
#    w2.Temperature > w1.Temperature;

SELECT
    w1.id AS 'Id'
FROM
    Weather AS w1
INNER JOIN
    Weather AS w2
ON
    DATEDIFF(w1.recordDate, w2.recordDate) = 1 AND
    w1.Temperature > w2.Temperature;
