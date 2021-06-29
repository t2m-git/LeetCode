# Write your MySQL query statement below
SELECT
    activity_date AS login_date,
    COUNT(DISTINCT t.user_id) AS user_count
FROM
    (
    
    SELECT
        user_id,
        activity_date,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY activity_date ASC) AS my_row
    FROM
        Traffic
    WHERE
        activity IN ('login')
    
    ) AS t
WHERE
    t.activity_date BETWEEN '2019-06-30' - INTERVAL 90 DAY AND '2019-06-30'
    AND t.my_row = 1
GROUP BY activity_date;
