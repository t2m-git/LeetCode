# Write your MySQL query statement below
SELECT
    DISTINCT title
FROM
    TVProgram AS t
INNER JOIN Content AS c ON c.content_id = t.content_id
WHERE
    c.Kids_content = 'Y'
    AND c.content_type = 'Movies'
    AND YEAR(t.program_date) = 2020
    AND MONTH(t.program_date) = 06;
