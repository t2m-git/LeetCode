# Write your MySQL query statement below
# The following CTE is correct in terms of its value, but redundant.

WITH cte AS (

    SELECT
        event_type,
        occurences,
        CASE WHEN event_type IN ('reviews') THEN AVG(occurences) ELSE 0 END AS avg_r,
        CASE WHEN event_type IN ('ads') THEN AVG(occurences) ELSE 0 END AS avg_a,
        CASE WHEN event_type IN ('page views') THEN AVG(occurences) ELSE 0 END AS avg_p
    FROM
        Events
    GROUP BY event_type
), a AS 
(
SELECT
    DISTINCT event_type AS et,
    AVG(occurences) OVER (PARTITION BY event_type) AS ae
FROM
    Events
)

SELECT
    e.business_id
FROM
    Events AS e
INNER JOIN a ON a.et = e.event_type
WHERE
    e.occurences > a.ae
GROUP BY 1
HAVING COUNT(e.event_type) > 1;
