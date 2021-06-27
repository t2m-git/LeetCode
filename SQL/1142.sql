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

/*
WITH cte AS(
    
SELECT
    COUNT(DISTINCT user_id) AS user_cnt, 
    COUNT(DISTINCT session_id) AS sess_cnt
FROM activity
WHERE  DATEDIFF('2019-07-27', activity_date) < 30
    
)


SELECT
    ROUND(coalesce((sess_cnt/user_cnt),0),2) as average_sessions_per_user 
FROM cte;

SELECT
    IFNULL(
        (  
            select
                ROUND(((COUNT(DISTINCT session_id))/(COUNT(DISTINCT user_id))),2)
            FROM
                activity
            WHERE
                activity_date BETWEEN "2019-06-28" AND "2019-07-27"
        )
    , 0)
AS average_sessions_per_user;
*/
