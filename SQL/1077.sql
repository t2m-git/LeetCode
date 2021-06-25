# Write your MySQL query statement below
WITH CTE AS (

SELECT
    p.project_id,
    p.employee_id,
    MAX(e.experience_years) OVER (PARTITION BY p.project_id) AS max_exp
FROM
    Project AS p
INNER JOIN Employee AS e ON e.employee_id = p.employee_id    

)

SELECT
    c.project_id,
    c.employee_id
FROM
    CTE AS c
INNER JOIN Employee AS e ON e.employee_id = c.employee_id
WHERE
    e.experience_years = c.max_exp;
