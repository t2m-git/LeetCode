# Write your MySQL query statement below
/*
SELECT
    f1.followee AS follower,
    # Why do I have to use "DISTINCT fi.follower"?
    # This is for a case in which there are two duplicated records in data.
    # For example, if there are two records written in the following.
    # followee, follower
    # ["bkwz","xlxeg"]
    # ["bkwz","xlxeg"]
    # ["bkwz","nhrry"]
    # When using COUNT(f.followee), the result becomes three.
    # When using COUNT(f.follower), the result becomes three.
    # When using COUNT(DISTINCT f.followee), the result becomes one.
    # When using COUNT(DISTINCT f.follower), the result becomes two.
    # Thus, I have to use COUNT(DISTINCT f.follower).
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

SELECT
    followee AS follower,
    COUNT(DISTINCT follower) AS num
FROM
    follow
WHERE
    followee IN (
    
    SELECT
        follower
    FROM
        follow
        
    )
GROUP BY 1
ORDER BY 1;
*/

SELECT
    f2.followee AS follower,
    COUNT(DISTINCT f2.follower) AS num
FROM
    follow f1
INNER JOIN follow f2 ON f1.follower= f2.followee
GROUP BY f2.followee
ORDER BY f2.followee;
