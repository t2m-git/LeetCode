# Write your MySQL query statement below
/*
SELECT
    s.employee_id AS employee_id,
    s.name AS name,
    s.cnt AS reports_count,
    ROUND(AVG(s.age), 0) AS average_age
FROM
    (
    SELECT
        e1.employee_id,
        e1.name,
        COUNT(e2.reports_to) AS cnt,
        AVG(e2.age) AS age
    FROM
        Employees AS e1
    LEFT JOIN Employees AS e2 ON e2.reports_to = e1.employee_id
    GROUP BY e1.employee_id
    HAVING COUNT(e2.reports_to) >= 1
    ) AS s
GROUP BY 1
ORDER BY 1;

SELECT
    e1.employee_id,
    e1.name, 
    COUNT(e2.employee_id) as reports_count,
    ROUND(AVG(e2.age)) as average_age
FROM
    Employees AS e1
#INNER JOIN Employees e2 ON e2.reports_to = e1.employee_id
LEFT JOIN Employees AS e2 ON e2.reports_to = e1.employee_id
GROUP BY e1.employee_id
HAVING COUNT(e2.reports_to) >= 1
ORDER BY e1.employee_id;

*/


WITH cte as (

SELECT
    reports_to,
    COUNT(employee_id) AS reports_count,
    round(AVG(age)) AS average_age
FROM 
    Employees
WHERE reports_to IS NOT NULL
GROUP BY reports_to

)

SELECT
    employee_id,
    name,
    reports_count,
    average_age
FROM
    cte
INNER JOIN Employees AS e on  e.employee_id = cte.reports_to
ORDER BY e.employee_id';
