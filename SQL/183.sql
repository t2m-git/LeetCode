# Write your MySQL query statement below
/*
SELECT
    c.Name AS Customers
FROM
    Customers AS c
LEFT JOIN
    Orders AS o
ON
    c.Id = o.CustomerId
WHERE
    o.CustomerId IS NULL;
*/

SELECT
    p.`Customers`
FROM
    (
    
    SELECT
        c.Name AS `Customers`,
        COUNT(o.CustomerId)
    FROM
        Customers AS c
    LEFT JOIN Orders AS o ON o.CustomerId = c.Id
    GROUP BY c.id
    HAVING COUNT(o.CustomerId) = 0
    
    ) AS p;
