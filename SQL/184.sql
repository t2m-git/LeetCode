# Write your MySQL query statement below
SELECT
    d.Name AS 'Department',
    e.Name AS 'Employee',
    e.Salary AS 'Salary'
FROM
    Employee AS e
INNER JOIN
    Department AS d
ON
    e.DepartmentId = d.Id
WHERE
    (e.DepartmentId , e.Salary) IN (
        SELECT DISTINCT DepartmentId,
        MAX(Salary)
    FROM
        Employee
    GROUP BY DepartmentId
    );
