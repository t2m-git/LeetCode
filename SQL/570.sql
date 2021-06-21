# Write your MySQL query statement below
SELECT
    DISTINCT e2.name
FROM
        (SELECT 
            ManagerId,
            COUNT(ManagerId) OVER(PARTITION BY ManagerId ORDER BY Id) as cnt
        FROM
            Employee
        ) AS e1
INNER JOIN Employee e2 on e1.managerid = e2.id
WHERE 
    e1.cnt>4

/*
SELECT
    Name
FROM
    Employee
WHERE
    Id IN (
    
        SELECT 
            ManagerId
        FROM
            Employee
        GROUP BY ManagerId
        HAVING COUNT(*) >=5
    
    );
*/
