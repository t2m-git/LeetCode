# Write your MySQL query statement below
/*
SELECT
    actor_id AS ACTOR_ID,
    director_id AS DIRECTOR_ID
FROM
    ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;
*/


SELECT
    DISTINCT actor_id, director_id 
FROM
    (
    SELECT 
        *, 
        ROW_NUMBER() OVER(PARTITION BY actor_id, director_id ORDER BY timestamp) AS rn 
    FROM
        actordirector
    ) AS a
WHERE
    rn >= 3;
