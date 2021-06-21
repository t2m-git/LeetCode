# Write your MySQL query statement below
/* Time Limit Exceeded
SELECT
    ROUND(f2.num_login_back / f1.num_users, 2) AS fraction
FROM
    (
    SELECT
        COUNT(DISTINCT player_id) AS num_users
    FROM
        Activity
    ) AS f1,
    (
    SELECT 
        COUNT(DISTINCT a1.player_id) AS num_login_back
    FROM
        Activity AS a1
    INNER JOIN Activity AS a2 ON a1.player_id = a2.player_id
    AND DATEDIFF(a2.event_date, a1.event_date) = 1
    WHERE a1.event_date = (
        SELECT
            MIN(event_date)
        FROM
            Activity        
        WHERE
            player_id = a1.player_id
            )
    ) AS f2;
*/
SELECT ROUND(
        (
        SELECT 
            COUNT(*)
        FROM 
            Activity as a1
        WHERE
            (a1.player_id, a1.event_date) in (
                    SELECT
                        DISTINCT(a2.player_id),
                        MIN(a2.event_date) + interval 1 day as event_date
                    FROM
                        ACTIVITY as a2
                    GROUP BY a2.player_id
            )
        ) 
        /
        (
        SELECT 
            COUNT(DISTINCT a3.player_id)
        FROM
            activity as a3
        ), 2) as fraction;

/* Time Limit Exceeded
SELECT ROUND(
        (
            SELECT COUNT(DISTINCT a1.player_id)
            FROM Activity AS a1
                JOIN Activity AS a2 ON a1.player_id = a2.player_id
                AND DATEDIFF(a2.event_date, a1.event_date) = 1
            WHERE a1.event_date = (
                    SELECT MIN(event_date)
                    FROM Activity
                    WHERE player_id = a1.player_id
                )
        ) / (
            SELECT COUNT(DISTINCT player_id)
            FROM Activity
        ), 2) AS `fraction`;
*/
