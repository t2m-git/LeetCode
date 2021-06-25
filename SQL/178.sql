# Write your MySQL query statement below
/*
SELECT
    Score, 
    DENSE_RANK() OVER (ORDER BY Score DESC) AS `Rank`
FROM
    Scores;
*/

Select 
    Score AS `score`,
    (SELECT 
        COUNT(*)
     FROM 
        (SELECT DISTINCT Score AS S FROM Scores) AS TMP
    WHERE S >= Score
    ) AS `Rank`
FROM
    Scores
ORDER BY Score DESC;
