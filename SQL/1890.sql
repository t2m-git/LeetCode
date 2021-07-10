# Write your MySQL query statement below
SELECT
    s.user_id,
    s.time_stamp AS last_stamp
FROM
(
SELECT
    user_id,
    time_stamp,
    RANK() OVER (PARTITION BY user_id ORDER BY time_stamp DESC) AS my_rank
FROM
    Logins
WHERE
    YEAR(time_stamp) = 2020
) AS s
WHERE
    s.my_rank = 1;
