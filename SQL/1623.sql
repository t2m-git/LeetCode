# Write your MySQL query statement below
/*
SELECT
    s1.student_name AS member_A,
    s2.student_name AS member_B,
    s3.student_name AS member_C
FROM
    SchoolA AS s1,
    SchoolB AS s2,
    SchoolC AS s3
WHERE
    (s1.student_id <> s2.student_id AND s1.student_name <> s2.student_name)
    AND (s1.student_id <> s3.student_id AND s1.student_name <> s3.student_name)
    AND (s2.student_id <> s3.student_id AND s2.student_name <> s3.student_name);
*/


SELECT
    a.student_name as member_A,
    b.student_name as member_B,
    c.student_name as member_C
FROM 
    SchoolA AS a 
INNER JOIN SchoolB AS b on b.student_id !=a.student_id AND b.student_name !=a.student_name
INNER JOIN SchoolC AS c on (c.student_id !=b.student_id AND c.student_name !=b.student_name)
AND (a.student_id !=c.student_id AND a.student_name !=c.student_name);
