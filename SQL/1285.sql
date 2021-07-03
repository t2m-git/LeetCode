# Write your MySQL query statement below
SELECT 
    l1.log_id AS start_id,
    MIN(l2.log_id) as end_id
FROM 
    (
        SELECT
            log_id
        FROM
            Logs
        WHERE 
            log_id - 1 NOT IN (
                SELECT 
                    log_id
                FROM
                    Logs
            )
    ) AS l1,
    (
        SELECT
            log_id
        FROM
            Logs
        WHERE log_id + 1 NOT IN (
                SELECT
                    log_id
                FROM
                    Logs
            )
    ) as l2
WHERE
    l1.log_id <= l2.log_id
GROUP BY l1.log_id;
