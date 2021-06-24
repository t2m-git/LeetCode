# Write your MySQL query statement below
WITH tmp_TIV_2015 AS (

SELECT
    PID
FROM
    insurance
WHERE
    TIV_2015 IN (
    
    SELECT
        TIV_2015
    FROM 
        insurance
    GROUP BY TIV_2015
    HAVING
        COUNT(TIV_2015) > 1    
    )

),

loc AS (

SELECT
    PID
FROM
    insurance
GROUP BY LAT, LON
HAVING
    COUNT(LAT & LON) = 1

)

SELECT
    SUM(i.TIV_2016) AS `TIV_2016`
FROM
    insurance AS i
WHERE
    i.PID IN (SELECT * FROM tmp_TIV_2015) AND
    i.PID IN (SELECT * FROM loc);

/*
SELECT
    SUM(TIV_2016) as TIV_2016
FROM
    insurance
WHERE
    TIV_2015 IN (
        
        SELECT
            TIV_2015
        FROM
            insurance
        GROUP BY TIV_2015
        HAVING
            COUNT(*) >= 2
        
    )
    AND (lat, lon) IN(
        
        SELECT
            lat,
            lon
        FROM
            insurance
        GROUP BY lat, lon
        HAVING
            COUNT(*) = 1
        
    );
 */
