# Write your MySQL query statement below
/*
SELECT
    p.session_id
FROM
    Playback AS p
INNER JOIN Ads AS a ON a.customer_id = p.customer_id
GROUP BY p.session_id
HAVING SUM(CASE WHEN a.timestamp NOT BETWEEN p.start_time AND p.end_time THEN 0 ELSE 1 END) = 0
UNION
SELECT
    p2.session_id
FROM
    Playback AS p2
LEFT JOIN Ads AS a2 ON a2.customer_id = p2.customer_id
WHERE a2.customer_id IS NULL;

*/

SELECT
    p.session_id
FROM
    Playback AS p
LEFT JOIN Ads AS a ON a.customer_id = p.customer_id
GROUP BY p.session_id
HAVING SUM(CASE WHEN a.timestamp BETWEEN p.start_time AND p.end_time THEN 1 ELSE 0 END) = 0;
