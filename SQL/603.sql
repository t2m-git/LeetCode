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
