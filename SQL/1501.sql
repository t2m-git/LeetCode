# Write your MySQL query statement below
WITH cte_l AS (
    
SELECT
    co.name,
    AVG(ca.duration) AS mean_lduration
FROM
    (
    (
    SELECT
        caller_id AS id,
        duration
    FROM
        Calls
    )
    UNION ALL
    (
    SELECT
        callee_id AS id,
        duration
    FROM
        Calls
    
    )  
    ) AS ca
INNER JOIN Person AS p ON p.id = ca.id
INNER JOIN Country AS co ON co.country_code = SUBSTR(p.phone_number, 1, 3)
GROUP BY co.name
)

SELECT
    name AS country
FROM
    cte_l AS c1
WHERE
    mean_lduration > (
    
    SELECT
        AVG(duration) AS mean_duration
    FROM
        Calls
    );
