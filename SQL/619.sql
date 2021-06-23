# Write your MySQL query statement below
SELECT
    MAX(m.num) AS num
FROM
    (
    SELECT
        DISTINCT num,
        COUNT(*) AS count
    FROM
        my_numbers
    GROUP BY num
    ) AS m
WHERE
    m.count = 1;


/*
SELECT
    MAX(m.num) AS num
FROM
    (
    SELECT
        num
    FROM
        my_numbers
    GROUP BY num
    HAVING COUNT(num) = 1
    ) AS m;
*/
