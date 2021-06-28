# Write your MySQL query statement below
/*SELECT
    e.employee_id,
    COUNT(*) OVER (PARTITION BY team_id) AS team_size
FROM
    Employee AS e;
*/    
    
WITH CTE AS
(
    SELECT
        team_id, 
        COUNT(team_id) as team_size
    FROM
        Employee
    GROUP BY team_id
)

SELECT
    e.employee_id,
    c.team_size
FROM 
    Employee AS e
INNER join CTE AS c ON c.team_id = e.team_id;
