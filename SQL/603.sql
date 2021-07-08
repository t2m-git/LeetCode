# Write your MySQL query statement below
WITH df AS (
    SELECT seat_id
        , free
        , LAG(seat_id) OVER (order by seat_id) as prev_free_seat
        , LEAD(seat_id) OVER (order by seat_id) as next_free_seat
    from 
        cinema
    where
        free = 1
)

SELECT
    seat_id
FROM
    df
WHERE
    prev_free_seat+1 = seat_id
    OR next_free_seat-1 = seat_id;
 
 /*
 # Write your MySQL query statement below
SELECT
    s.seat_id
FROM
(
SELECT
    *,
    LAG(free, 1) OVER (ORDER BY seat_id) AS lag1,
    LEAD(free, 1) OVER (ORDER BY seat_id) AS lead1
FROM
    cinema
) AS s
WHERE 
    (s.free = 1 AND s.lag1 = 1)
    OR (s.lead1 = 1 AND s.free = 1)
ORDER BY 1;
*/
