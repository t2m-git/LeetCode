# Write your MySQL query statement below
WITH cte AS (

SELECT
    salary
FROM
    Employees
GROUP BY salary
HAVING COUNT(salary) >1

)

SELECT
    s.employee_id, 
    s.name,
    s.salary,
    s.team_id
FROM
    (

    SELECT
        *,
        DENSE_RANK() OVER (ORDER BY salary ASC) AS team_id
    FROM
        Employees AS e1
    WHERE
        salary IN (SELECT * FROM cte)
        
    ) AS s
ORDER BY s.team_id, employee_id;
