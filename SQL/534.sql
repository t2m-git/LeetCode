# Write your MySQL query statement below
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
