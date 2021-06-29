# Write your MySQL query statement below
SELECT
    s.id,
    s.name
FROM
    Students AS s
LEFT JOIN Departments AS d ON d.id = s.department_id
WHERE
d.id IS NULL
ORDER BY id ASC;
