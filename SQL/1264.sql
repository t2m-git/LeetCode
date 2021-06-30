# Write your MySQL query statement below
SELECT
    DISTINCT page_id AS recommended_page
FROM
    Likes AS l
INNER JOIN
# friend list for user_id = 1
(
(
SELECT
    f1.user1_id AS user_id
FROM
    Friendship AS f1
WHERE
    f1.user2_id = 1
)
UNION ALL
(
SELECT
    f2.user2_id AS user_id
FROM
    Friendship AS f2
WHERE
    f2.user1_id = 1
)
) AS u ON u.user_id = l.user_id
WHERE page_id NOT IN (

SELECT
    page_id
FROM
    Likes
WHERE
    user_id = 1

);
