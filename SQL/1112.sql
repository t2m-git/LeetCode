# Write your MySQL query statement below
SELECT
    p.student_id,
    p.course_id,
    p.grade
FROM
    (
    
    SELECT
        student_id,
        course_id,
        grade,
        ROW_NUMBER() OVER (PARTITION BY student_id ORDER BY grade DESC, course_id ASC) AS my_rank
    FROM
        Enrollments
    
    ) AS p
WHERE
    p.my_rank = 1;
