# Write your MySQL query statement below
SELECT
    b.book_id,
    b.name
FROM
    Books AS b
LEFT JOIN Orders AS o ON o.book_id = b.book_id
AND o.dispatch_date BETWEEN '2019-06-23' - INTERVAL 1 YEAR AND '2019-06-23'
WHERE
    b.available_from < ('2019-06-23' - INTERVAL 30 DAY)
GROUP BY b.book_id
HAVING
    SUM(coalesce(o.quantity,0)) < 10;
