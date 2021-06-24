# Write your MySQL query statement below
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
