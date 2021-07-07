# Write your MySQL query statement below
SELECT
    s1.machine_id,
    ROUND(SUM(s2.timestamp - s1.timestamp) / COUNT(DISTINCT s1.machine_id, s1.process_id), 3) AS processing_time
FROM
(
SELECT
    a1.machine_id,
    a1.process_id,
    a1.timestamp
FROM
    Activity AS a1
WHERE
    activity_type = 'start'
) AS s1
LEFT JOIN
(
SELECT
    a2.machine_id,
    a2.process_id,
    a2.timestamp
FROM
    Activity AS a2
WHERE
    activity_type = 'end'
) AS s2 ON s2.machine_id = s1.machine_id
AND s2.process_id = s1.process_id
GROUP BY s1.machine_id;
