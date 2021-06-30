# Write your MySQL query statement below
SELECT
    eu.unique_id AS unique_id,
    e.name
FROM
    Employees AS e
LEFT JOIN EmployeeUNI AS eu ON eu.id = e.id;
