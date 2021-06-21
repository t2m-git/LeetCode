# Write your MySQL query statement below
SELECT
    player_id AS `player_id`,
    device_id AS `device_id`
FROM
    Activity
WHERE
    (player_id, event_date) IN (
        SELECT
            player_id,
            min(event_date)
        FROM
            Activity
        GROUP BY
            player_id
    );
