# Write your MySQL query statement below
WITH cte AS (
    SELECT
        player_id,
        MIN(event_date) as install_date
    FROM
        Activity
    GROUP BY 1
)

SELECT
    c.install_date AS install_dt ,
    COUNT(DISTINCT player_id) AS installs ,
    ROUND(IFNULL(rent_play_cnt,0) / COUNT(DISTINCT player_id),2) AS Day1_retention
FROM
    cte AS c
LEFT JOIN
(
    SELECT
        c.install_date AS install_date ,
        COUNT(DISTINCT c.player_id) as rent_play_cnt
    FROM
        cte AS c 
    INNER JOIN Activity AS a ON a.player_id = c.player_id
    AND a.event_date = DATE_ADD(c.install_date,INTERVAL 1 DAY)
    GROUP BY 1
) AS s ON s.install_date = c.install_date
GROUP BY 1;
