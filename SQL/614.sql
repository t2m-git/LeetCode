# Write your MySQL query statement below
SELECT
    f1.followee AS follower,
    COUNT(DISTINCT f1.follower) AS num
FROM
    follow AS f1
GROUP BY f1.followee
HAVING
    f1.followee IN (
    
        SELECT
            f2.follower
        FROM
            follow AS f2
    
    )
ORDER BY f1.followee ASC;
