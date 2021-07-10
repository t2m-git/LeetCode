# Write your MySQL query statement below
WITH cte AS (

SELECT
    ROW_NUMBER() OVER (ORDER BY home_team_id) AS row_num,
    home_team_id AS team_id,
    home_team_goals AS goal
FROM
    Matches
UNION ALL
SELECT
    ROW_NUMBER() OVER (ORDER BY home_team_id) + (SELECT COUNT(*) FROM Matches)AS row_num,
    away_team_id AS team_id,
    away_team_goals AS goal
FROM
    Matches
), cte2 AS (
    
SELECT
    t.team_name,
    CASE
        WHEN t.team_id = m.home_team_id AND m.home_team_goals > m.away_team_goals THEN 3
        WHEN t.team_id = m.home_team_id AND m.home_team_goals < m.away_team_goals THEN 0
        WHEN t.team_id = m.away_team_id AND m.away_team_goals > m.home_team_goals THEN 3
        WHEN t.team_id = m.away_team_id AND m.away_team_goals < m.home_team_goals THEN 0
    ELSE 1 END AS points,
    CASE
        WHEN t.team_id = m.home_team_id THEN home_team_goals
        WHEN t.team_id = m.away_team_id THEN away_team_goals
    END AS goal_for,
    CASE
        WHEN t.team_id = m.home_team_id THEN away_team_goals
        WHEN t.team_id = m.away_team_id THEN home_team_goals
    END AS goal_against
FROM
    Teams AS t
INNER JOIN Matches AS m ON m.home_team_id = t.team_id OR m.away_team_id = t.team_id
)

SELECT 
    team_name,
    COUNT(*) matches_played,
    SUM(points) points,
    SUM(goal_for) goal_for,
    SUM(goal_against) goal_against,
    SUM(goal_for) - SUM(goal_against) goal_diff
FROM
    cte2
GROUP BY team_name
ORDER BY points DESC, goal_diff DESC, team_name;
