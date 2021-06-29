# Write your MySQL query statement below
SELECT
    DISTINCT p.viewer_id AS id
FROM
    (
    SELECT
        view_date,
        viewer_id,
        COUNT(DISTINCT article_id)
    FROM
        Views
    GROUP BY view_date, viewer_id
    HAVING COUNT(DISTINCT article_id) > 1
        ) AS p
ORDER BY id;
