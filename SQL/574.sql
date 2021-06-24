# Write your MySQL query statement below
WITH cand AS (

SELECT
    c.id,
    c.Name,
    COUNT(v.CandidateId) AS cnt_cand
FROM
    Candidate AS c
LEFT JOIN Vote AS v ON c.id = v.CandidateId
GROUP BY c.id
)


SELECT
    Name
FROM
    cand
WHERE
    cnt_cand = (
    
        SELECT
            MAX(cnt_cand)
        FROM
            cand
        
    );
