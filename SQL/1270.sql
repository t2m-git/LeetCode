# Write your MySQL query statement below
/* UNION ALL - not efficient
(

SELECT
    employee_id
FROM
    Employees
WHERE
    manager_id = 1
    AND employee_id <> 1

)
UNION ALL
(
SELECT
    employee_id
FROM
    Employees
WHERE
    manager_id IN (
    
    SELECT
        employee_id
    FROM
        Employees
    WHERE
        manager_id = 1
        AND employee_id <> 1
    ) 
)
UNION ALL
(
SELECT
    employee_id
FROM
    Employees
WHERE
    manager_id IN (
    
    SELECT
        employee_id
    FROM
        Employees
    WHERE
        manager_id IN (
    
    SELECT
        employee_id
    FROM
        Employees
    WHERE
        manager_id = 1
        AND employee_id <> 1        
    ) 
    )
)


SELECT
    employee_id
FROM
    employees
WHERE
    manager_id IN (
        SELECT 
            employee_id 
        FROM 
            employees
        WHERE 
            manager_id IN (
                SELECT
                    employee_id
                        FROM
                            employees
                                WHERE manager_id = 1)
    ) 
    AND employee_id <> 1

*/

SELECT
    e.employee_id
FROM
    employees e
LEFT JOIN employees m1 ON e.manager_id = m1.employee_id
LEFT JOIN employees m2 ON m1.manager_id = m2.employee_id
LEFT JOIN employees m3 ON m2.manager_id = m3.employee_id
WHERE least(m1.employee_id, m2.employee_id, m3.employee_id) = 1
AND e.employee_id <> 1;
