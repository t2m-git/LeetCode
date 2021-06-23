# Write your MySQL query statement below
SELECT
    DISTINCT s.buyer_id
FROM
    Sales AS s
INNER JOIN Product AS p ON s.product_id = p.product_id
WHERE
    p.product_name = 'S8' AND
    s.buyer_id NOT IN (
        
        SELECT 
            DISTINCT s1.buyer_id
        FROM
            Sales AS s1
        INNER JOIN Product AS p1 ON s1.product_id = p1.product_id
        WHERE
            p1.product_name = ('iPhone') AND
            s.quantity <> 0
    
    );
