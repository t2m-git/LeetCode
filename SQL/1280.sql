# Write your MySQL query statement below
SELECT
    s.student_id,
    s.student_name,
    s1.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM
    Students AS s
CROSS JOIN Subjects AS s1
LEFT JOIN Examinations AS e 
    ON e.student_id = s.student_id
    AND s1.subject_name = e.subject_name
GROUP BY s.student_id, s1.subject_name
ORDER BY s.student_id, s1.subject_name;
