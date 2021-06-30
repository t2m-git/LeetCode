# Write your MySQL query statement below
SELECT
    t.team_id,
    t.team_name,
    IFNULL(SUM(u.p_host), 0) AS num_points
FROM
    Teams AS t
LEFT JOIN
(
(
SELECT
    m1.host_team AS team_id,
    SUM(CASE 
            WHEN m1.host_goals > m1.guest_goals THEN 3
            WHEN m1.host_goals = m1.guest_goals THEN 1
            ELSE 0 END) AS p_host
FROM
    Matches AS m1
GROUP BY m1.host_team
)
UNION ALL
(
SELECT
    m1.guest_team AS team_id,
    SUM(CASE 
            WHEN m1.guest_goals > m1.host_goals THEN 3
            WHEN m1.guest_goals = m1.host_goals THEN 1
            ELSE 0 END) AS p_guest
FROM
    Matches AS m1
GROUP BY m1.guest_team
)
) AS u ON u.team_id = t.team_id
GROUP BY t.team_id
ORDER BY num_points DESC, t.team_id ASC;
