# Write your MySQL query statement below
SELECT
    b.book_id,
    b.name
FROM
    Books AS b
LEFT JOIN Orders AS o ON o.book_id = b.book_id
# The following code is to keep records with Null value in Books table.
AND o.dispatch_date BETWEEN '2019-06-23' - INTERVAL 1 YEAR AND '2019-06-23'
#AND DATEDIFF('2019-06-23', O.dispatch_date) < 365  
WHERE
    b.available_from < ('2019-06-23' - INTERVAL 30 DAY)
    #DATEDIFF('2019-06-23', B.available_from) > 30
GROUP BY b.book_id
HAVING
    
    SUM(coalesce(o.quantity,0)) < 10;
    #IFNULL(SUM(o.quantity),0) < 10;
