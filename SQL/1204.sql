# Write your MySQL query statement below
SELECT
    p.person_name
FROM
    (
    
    SELECT
        person_id,
        person_name,
        turn,
        SUM(weight) OVER (ORDER BY turn) AS weight_acc_sum
    FROM
        Queue
    
    ) AS p
WHERE
    p.weight_acc_sum <= 1000
ORDER BY weight_acc_sum DESC
LIMIT 1;

/*
WITH cte AS (
SELECT
    person_id,
    person_name,
    turn,
    SUM(weight) OVER (ORDER BY turn) AS weight_acc_sum
FROM
    Queue
)

SELECT
    person_name
FROM
    cte
WHERE
    weight_acc_sum <= 1000
    AND turn = (

        SELECT
            MAX(turn)
        FROM
            cte
        WHERE
            weight_acc_sum <= 1000
    
    );
*/
