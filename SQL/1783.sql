# Write your MySQL query statement below
SELECT 
    player_id,
    player_name,
    SUM(CASE WHEN player_id = Wimbledon THEN 1 ELSE 0 END)+
    SUM(CASE WHEN player_id = Fr_open THEN 1 ELSE 0 END)+
    SUM(CASE WHEN player_id = US_open THEN 1 ELSE 0 END)+
    SUM(CASE WHEN player_id = Au_open THEN 1 ELSE 0 END) AS grand_slams_count
FROM Players
LEFT JOIN Championships ON player_id = Wimbledon OR player_id = Fr_open OR player_id = US_open OR player_id = Au_open
GROUP BY player_id
HAVING grand_slams_count <> 0;
