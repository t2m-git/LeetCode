# Write your MySQL query statement below
/*
SELECT
    e1.id,
    e1.Company,
    e1.Salary
FROM
    Employee e1
LEFT JOIN Employee e2 ON e1.Company = e2.Company
GROUP BY    e1.Company,
            e1.Salary
HAVING SUM(
        CASE WHEN e1.Salary = e2.Salary then 1
        ELSE 0
        END
    ) >= ABS(SUM(sign(e1.Salary - e2.Salary)))
ORDER BY e1.Id;
*/

SELECT
    t1.Id,
    t1.Company,
    t1.Salary
FROM
(
    SELECT
        Id,
        Company,
        Salary,
        row_number() OVER(PARTITION BY Company ORDER BY Salary) AS rownum,
        COUNT(1) OVER(PARTITION BY Company) AS num
    FROM
        Employee
) t1
WHERE
    t1.rownum >= num / 2
    AND t1.rownum <= num / 2 + 1;
