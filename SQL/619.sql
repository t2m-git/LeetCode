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
