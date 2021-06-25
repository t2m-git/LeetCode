# Write your MySQL query statement below
/*SELECT
    (CASE
        WHEN MOD(id, 2) <> 0 AND seat_counts.counts != id THEN id + 1
        WHEN MOD(id, 2) <> 0 AND seat_counts.counts = id THEN id
        ELSE id - 1
    END) AS id,
    student
FROM
    seat,
    (
    
    SELECT
        COUNT(*) AS counts
    FROM
        seat
    
    ) AS seat_counts
    
ORDER BY id ASC;
*/

SELECT
    (CASE
        # When id is even number, just replace id with id -1
        WHEN id % 2 = 0 THEN id - 1
        # When id is odd number, replace id with id + 1 except for the last record
        WHEN MOD(id, 2) = 1 AND id < (SELECT COUNT(*) from seat) then id+1
        ELSE id
    END) AS id,
    student
FROM
    seat
ORDER BY id;
