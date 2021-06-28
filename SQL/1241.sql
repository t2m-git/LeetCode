# Write your MySQL query statement below
/*
SELECT
    s1.sub_id AS post_id,
    IFNULL(s2.cnt, 0) AS number_of_comments
FROM
    (
    
    SELECT
        DISTINCT sub_id
    FROM
        Submissions
    WHERE
        parent_id IS NULL
    
    ) AS s1
LEFT JOIN
    (

    SELECT
        DISTINCT parent_id,
        COUNT(DISTINCT sub_id) AS cnt
    FROM
        Submissions
    WHERE
        parent_id IS NOT NULL
    GROUP BY parent_id
    
    ) AS s2
ON s2.parent_id = s1.sub_id
ORDER BY s1.sub_id;

# So slow...
SELECT 
    s.sub_id as post_id,
    (
        SELECT
            COUNT(DISTINCT s1.sub_id)
        FROM
            Submissions s1
        WHERE
            s1.parent_id = s.sub_id
    ) AS number_of_comments
FROM
    Submissions s
WHERE
    s.parent_id is null
GROUP BY s.sub_id
ORDER BY s.sub_id;

*/

SELECT 
    s.sub_id AS post_id,
    COUNT(DISTINCT s1.sub_id) AS number_of_comments
FROM
    Submissions s
LEFT JOIN Submissions s1 ON s1.parent_id = s.sub_id
AND s1.parent_id IS NOT NULL
WHERE
    s.parent_id IS NULL
GROUP BY s.sub_id
ORDER BY s.sub_id;
