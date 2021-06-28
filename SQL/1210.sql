# Write your MySQL query statement below
/*
SELECT
    q.query_name,
    q.quality AS quality,
    q.poor_query_percentage AS poor_query_percentage
FROM
    (
    
    SELECT
        DISTINCT query_name,
        ROUND(SUM(rating/position) / COUNT(*), 2) AS quality,
        ROUND(SUM(IF(rating<3, 1, 0))*100/COUNT(rating), 2) AS poor_query_percentage
    FROM
        Queries
    GROUP BY query_name
    
    ) AS q
ORDER BY q.query_name ASC;
*/

SELECT
    DISTINCT query_name,
    ROUND(SUM(rating/position) / COUNT(*), 2) AS quality,
    ROUND(SUM(IF(rating<3, 1, 0))*100/COUNT(rating), 2) AS poor_query_percentage
FROM
    Queries
GROUP BY query_name;
