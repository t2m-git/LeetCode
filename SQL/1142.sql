# Write your MySQL query statement below
SELECT
    CASE
        WHEN
            ROUND(SUM(a1.cnt_se) / SUM(a2.cnt_user), 2) IS NULL THEN 0
        ELSE ROUND(SUM(a1.cnt_se) / SUM(a2.cnt_user), 2) END AS average_sessions_per_user
FROM
    (
    
    SELECT
        user_id,
        COUNT(DISTINCT session_id) AS cnt_se
    FROM
        Activity
    WHERE
        activity_date BETWEEN '2019-07-27' - INTERVAL 29 DAY AND '2019-07-27'
    GROUP BY user_id
    
    ) AS a1,
    (
    
    SELECT
        COUNT(DISTINCT user_id) AS cnt_user
    FROM
        Activity
    WHERE
        activity_date BETWEEN '2019-07-27' - INTERVAL 29 DAY AND '2019-07-27'
    GROUP BY user_id
    
    ) AS a2;
