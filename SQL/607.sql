# Write your MySQL query statement below
SELECT
    name
FROM
    salesperson
WHERE
    name NOT IN (
        
    SELECT 
        s.name
    FROM
        salesperson As s
    INNER JOIN orders AS o ON s.sales_id = o.sales_id
    INNER JOIN company AS c ON c.com_id = o.com_id
    WHERE
        o.amount > 0 AND
        c.name = "RED"
    );
