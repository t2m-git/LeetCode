# Write your MySQL query statement below
SELECT
    s.Department,
    s.Employee,
    s.Salary
FROM
    (
    SELECT
        d.Name AS 'Department',
        e.Name AS 'Employee',
        e.Salary AS 'Salary',
        DENSE_RANK() OVER (PARTITION BY e.DepartmentId ORDER BY e.Salary DESC) AS my_rank
    FROM
        Employee AS e
    INNER JOIN
        Department AS d
    ON
        e.DepartmentId = d.Id
    
    ) AS s
WHERE
    s.my_rank < 4 ;
