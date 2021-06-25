# Write your MySQL query statement below
/*
SELECT
    e1.Name AS Employee
FROM
    Employee AS e1, Employee AS e2
WHERE
    e1.ManagerId = e2.Id AND
    e1.Salary > e2.Salary;
*/

SELECT
    e1.Name AS Employee
FROM
    Employee AS e1
LEFT JOIN Employee AS e2 ON e2.Id = e1.ManagerId
WHERE
    e1.Salary > e2.Salary;
