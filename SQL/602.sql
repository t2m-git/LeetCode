# Write your MySQL query statement below
SELECT
    u.id AS id,
    COUNT(u.id) AS num
FROM
    (
        (
        SELECT
            requester_id AS id
        FROM
            request_accepted
        )
    UNION ALL
        (
        SELECT
            accepter_id AS id
        FROM
            request_accepted   
        ) 
    ) AS u
GROUP BY u.id
ORDER BY num DESC
LIMIT 1;
