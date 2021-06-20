# Write your MySQL query statement below
SELECT
    t.`Day`,
    CAST((t.`CancelByClient`+ t.`CancelByDriver`)/ t.`Total` AS DECIMAL(20, 2)) AS `Cancellation Rate`
FROM
(
    SELECT 
        `Request_at` as `Day`, 
        COUNT(`Id`) `Total`, 
        COUNT(IF(`Status`="cancelled_by_client",`Id`,null)) AS `CancelByClient`, 
        COUNT(IF(`Status`="cancelled_by_driver",`Id`,null)) AS `CancelByDriver`
    FROM `Trips`
    WHERE `Request_at` between "2013-10-01" and "2013-10-03"
    AND `Client_Id` not in (SELECT `Users_Id` FROM `Users` WHERE `Banned` = "Yes") 
    AND `Driver_Id` not in (SELECT `Users_Id` FROM `Users` WHERE `Banned` = "Yes")
    GROUP BY `Request_at`
    ORDER BY `Request_at`
) t;
