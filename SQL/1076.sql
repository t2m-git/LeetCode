# Write your MySQL query statement below
/*
WITH TEMP AS (

SELECT
    project_id,
    COUNT(employee_id) AS count_e
FROM
    Project
GROUP BY project_id
    
)

SELECT
    project_id
FROM
    TEMP
WHERE
    count_e = (
    
        SELECT
            MAX(count_e)
        FROM
            TEMP

    );
*/


SELECT
    project_id
FROM
    (
    SELECT
        project_id,
        RANK() OVER (ORDER BY COUNT(employee_id) DESC) AS my_rank
    FROM
        Project
    GROUP BY project_id
    ) AS s
WHERE
    s.my_rank = 1;
