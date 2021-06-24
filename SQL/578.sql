# Write your MySQL query statement below
WITH total AS (

SELECT
    q0.question_id,
    COUNT(*) AS cnt
FROM
    survey_log AS q0
GROUP BY q0.question_id
),

speci AS (

SELECT
    q1.question_id,
    COUNT(*) AS cnt_s
FROM
    survey_log AS q1
GROUP BY q1.question_id, q1.answer_id
HAVING q1.answer_id IS NOT NULL
)

SELECT
    DISTINCT question_id AS survey_log
FROM
    survey_log AS s
WHERE
    s.question_id = (
    
        SELECT
            t.question_id
        FROM
            total AS t
        INNER JOIN speci AS s ON s.question_id = t.question_id
        ORDER BY (s.cnt_s / t.cnt) DESC
        LIMIT 1
    );
