# Write your MySQL query statement below
/*
SELECT
    CASE WHEN a.Salary IS NOT NULL THEN MAX(a.Salary)
    ELSE null
    END AS SecondHighestSalary
FROM
    Employee AS a
WHERE
    a.Salary < (SELECT MAX(Salary) FROM Employee)
ORDER BY a.Salary DESC
LIMIT 1;
*/


SELECT
    CASE
        # In order for us to make a result null, we have to use aggregate functions, such as MIN(), and MAX().
        WHEN p.Salary IS NOT NULL THEN MAX(p.Salary)
        ELSE NULL
    END AS SecondHighestSalary
FROM
    (
    SELECT
        Salary,
        DENSE_RANK() OVER (ORDER BY SALARY DESC) AS my_rank
    FROM
        Employee
    ORDER BY Salary DESC
    ) AS p
WHERE
    p.my_rank = 2;
