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

/*
SELECT
    p.project_id,
    p.employee_id
FROM 
    Project AS p
LEFT JOIN Employee AS e on p.employee_id = e.employee_id,
(
    SELECT
        p.project_id,
        MAX(e.experience_years) as num
    FROM Project AS p
    LEFT JOIN Employee e on p.employee_id = e.employee_id
    GROUP BY p.project_id
) as temp
WHERE
    p.project_id = temp.project_id
    AND e.experience_years = temp.num;
*/
