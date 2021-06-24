# Write your MySQL query statement below
/*
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


SELECT
    c.Name
FROM
    Candidate AS c
WHERE
    id = (
    
        SELECT
            v.CandidateId
        FROM
            Vote AS v
        GROUP BY v.CandidateId
        ORDER BY COUNT(v.CandidateId) DESC
        LIMIT 1
    
    )
*/

SELECT
    c.Name
FROM
    Candidate AS c
INNER JOIN Vote v ON c.id = v.CandidateId
GROUP BY v.CandidateId
HAVING 
    COUNT(v.CandidateId) >= (
                            SELECT
                                COUNT(CandidateId) AS cnt
                            FROM
                                Vote
                            GROUP BY CandidateId
                            ORDER BY cnt DESC
                            LIMIT 1
                            );
