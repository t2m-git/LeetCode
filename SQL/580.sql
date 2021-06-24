# Write your MySQL query statement below
SELECT
    d.dept_name,
    COUNT(s.student_id) AS student_number
FROM
    student AS s
RIGHT OUTER JOIN department AS d ON d.dept_id = s.dept_id
GROUP BY 1
ORDER BY 2 DESC;
