# Write your MySQL query statement below
WITH cte AS (
    select
        number,
        SUM(frequency) over (ORDER BY number) - frequency AS lower_num,
        SUM(frequency) over (ORDER BY number) AS upper_num,
        SUM(frequency) over () / 2 AS medium_num
    from numbers 
)

SELECT
    AVG(number) AS median
FROM
    cte
WHERE
    medium_num BETWEEN lower_num AND upper_num;
