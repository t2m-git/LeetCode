# Write your MySQL query statement below
SELECT
    s.person1,
    s.person2,
    SUM(s.call_count) AS call_count,
    SUM(s.total_duration) AS total_duration
FROM
(
SELECT
    DISTINCT from_id AS person1, to_id AS person2,
    COUNT(from_id & to_id) AS call_count,
    SUM(duration) AS total_duration
FROM
    Calls
WHERE from_id <= to_id
GROUP BY from_id, to_id
UNION ALL
SELECT
    DISTINCT to_id AS person1, from_id AS person2,
    COUNT(to_id & from_id) AS call_count,
    SUM(duration) AS total_duration
FROM
    Calls
WHERE from_id > to_id
GROUP BY to_id, from_id
) AS s
GROUP BY 1, 2;
