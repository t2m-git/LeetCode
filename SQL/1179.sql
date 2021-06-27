# Write your MySQL query statement below
/*
SELECT 
    id,
    SUM(CASE WHEN month='Jan' THEN revenue ELSE NULL END) as Jan_Revenue,
    SUM(CASE WHEN month='Feb' THEN revenue ELSE NULL END) as Feb_Revenue,
    SUM(CASE WHEN month='Mar' THEN revenue ELSE NULL END) as Mar_Revenue,
    SUM(CASE WHEN month='Apr' THEN revenue ELSE NULL END) as Apr_Revenue,
    SUM(CASE WHEN month='May' THEN revenue ELSE NULL END) as May_Revenue,
    SUM(CASE WHEN month='Jun' THEN revenue ELSE NULL END) as Jun_Revenue,
    SUM(CASE WHEN month='Jul' THEN revenue ELSE NULL END) as Jul_Revenue,
    SUM(CASE WHEN month='Aug' THEN revenue ELSE NULL END) as Aug_Revenue,
    SUM(CASE WHEN month='Sep' THEN revenue ELSE NULL END) as Sep_Revenue,
    SUM(CASE WHEN month='Oct' THEN revenue ELSE NULL END) as Oct_Revenue,
    SUM(CASE WHEN month='Nov' THEN revenue ELSE NULL END) as Nov_Revenue,
    SUM(CASE WHEN month='Dec' THEN revenue ELSE NULL END) as Dec_Revenue
FROM Department
GROUP BY id;
*/

SELECT id,
    SUM(IF(month='Jan', revenue, null)) AS Jan_Revenue,
    SUM(IF(month='Feb', revenue, null)) AS Feb_Revenue,
    SUM(IF(month="Mar", revenue, null)) AS Mar_Revenue,
    SUM(IF(month="Apr", revenue, null)) AS Apr_Revenue,
    SUM(IF(month="May", revenue, null)) AS May_Revenue,
    SUM(IF(month="Jun", revenue, null)) AS Jun_Revenue,
    SUM(IF(month="Jul", revenue, null)) AS Jul_Revenue,
    SUM(IF(month="Aug", revenue, null)) AS Aug_Revenue,
    SUM(IF(month="Sep", revenue, null)) AS Sep_Revenue,
    SUM(IF(month="Oct", revenue, null)) AS Oct_Revenue,
    SUM(IF(month="Nov", revenue, null)) AS Nov_Revenue,
    SUM(IF(month="Dec", revenue, null)) AS Dec_Revenue
FROM
    Department
GROUP BY id;
