# Write your MySQL query statement below
/*
SELECT
    p.player_id,
    p.event_date,
    p.games_played_so_far
FROM
    (
    SELECT
        player_id,
        event_date,
        SUM(games_played) OVER (PARTITION BY player_id ORDER BY event_date ASC) AS games_played_so_far
    FROM
        Activity
    ) AS p
    ORDER BY
        p.player_id,
        p.event_date DESC;
*/        

# Write your MySQL query statement below
SELECT 
    a1.player_id,
    a1.event_date,
    sum(a2.games_played) as games_played_so_far
FROM
    Activity a1
INNER JOIN Activity a2 on a1.player_id = a2.player_id
WHERE
    a1.event_date >= a2.event_date
GROUP BY a1.player_id, a1.event_date;
