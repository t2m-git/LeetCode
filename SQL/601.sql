# Write your MySQL query statement below
SELECT
    s.id,
    s.visit_Date,
    s.people
FROM
(
SELECT
    *,
    CASE
        WHEN ((LAG(people, 1) OVER (ORDER BY visit_date ASC) >= 100) AND (LAG(people, 2) OVER (ORDER BY visit_date ASC) >= 100) AND (people >= 100)) THEN 1
        WHEN ((LEAD(people, 1) OVER (ORDER BY visit_date ASC) >= 100) AND (LAG(people, 1) OVER (ORDER BY visit_date ASC) >= 100) AND (people >= 100)) THEN 1
        WHEN ((LEAD(people, 2) OVER (ORDER BY visit_date ASC) >= 100) AND (LEAD(people, 1) OVER (ORDER BY visit_date ASC) >= 100) AND (people >= 100)) THEN 1
        ELSE 0
    END as c
FROM Stadium
) as s
WHERE s.c = 1
