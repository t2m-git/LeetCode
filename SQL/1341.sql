# Write your MySQL query statement below
(
SELECT
    u.name AS results
FROM
    Movie_Rating AS m1
INNER JOIN Users AS u ON u.user_id = m1.user_id
GROUP BY 1
ORDER BY COUNT(m1.rating) DESC, 1
LIMIT 1
)
UNION ALL
(
SELECT
    m2.title AS results
FROM
    Movie_Rating AS m1
INNER JOIN Movies AS m2 ON m2.movie_id = m1.movie_id
WHERE
    SUBSTR(m1.created_at, 1, 7) = '2020-02'
GROUP BY 1
ORDER BY AVG(m1.rating) DESC, 1
LIMIT 1
);
