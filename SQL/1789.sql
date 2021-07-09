# Write your MySQL query statement below
SELECT
    s.employee_id,
    s.department_id
FROM
    (
    
    SELECT
        employee_id,
        department_id,
        RANK() OVER (PARTITION BY employee_id ORDER BY primary_flag ASC) AS my_rank
    FROM
        Employee
        
    ) AS s
WHERE
    s.my_rank = 1;
