# Write your MySQL query statement below
/*
SELECT 
    CONCAT(CASE 
            WHEN dayofweek(day) = 1 THEN 'Sunday' 
            WHEN dayofweek(day) = 2 THEN 'Monday' 
            WHEN dayofweek(day) = 3 THEN 'Tuesday' 
            WHEN dayofweek(day) = 4 THEN 'Wednesday' 
            WHEN dayofweek(day) = 5 THEN 'Thursday' 
            WHEN dayofweek(day) = 6 THEN 'Friday' 
            WHEN dayofweek(day) = 7 THEN 'Saturday' End, 
           ', '  , monthname(day), 
           ' ', dayofmonth(day),
           ', ', year(day)
            ) as day
FROM
    Days;
*/

SELECT
    DATE_FORMAT(day, '%W, %M %e, %Y') AS day
FROM
    days;
