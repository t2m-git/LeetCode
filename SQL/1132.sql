# Write your MySQL query statement below
SELECT
    ROUND(
    AVG(tmp.daily )
    , 2) AS average_daily_percent
FROM
    (
    
    SELECT
        a1.action_date,
        COUNT(DISTINCT r1.post_id) / COUNT(DISTINCT a1.post_id) * 100 AS daily
    FROM
        Actions AS a1
    LEFT JOIN Removals AS r1 ON r1.post_id = a1.post_id
    WHERE
         a1.extra = 'spam'
    GROUP BY a1.action_date
    ORDER BY a1.action_date ASC
    
    ) AS tmp;
