# Write your MySQL query statement below
/*
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
*/

#Bad example, but this code works...
#This is because group by in the last summarizes data, fetching a first record implicitely.
WITH x AS
    (SELECT
        student_id,
        course_id,
        grade, 
        MAX(grade) over(PARTITION BY student_id ) as mgrade
    FROM
        Enrollments 
    ORDER BY student_id ASC, course_id ASC)

SELECT
    student_id,
    course_id,
    grade 
FROM
    x
WHERE grade = mgrade
GROUP BY student_id;
