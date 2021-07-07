# Write your MySQL query statement below
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
