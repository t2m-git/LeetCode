# Write your MySQL query statement below
WITH temp1 AS (
SELECT contest_id, gold_medal AS medal FROM contests
UNION 
SELECT contest_id, silver_medal AS medal FROM contests
UNION
SELECT contest_id, bronze_medal AS medal FROM contests
)
,temp2 AS (
SELECT 
    DISTINCT t1.medal
FROM temp1 AS t1
INNER JOIN temp1 AS t2 ON t1.contest_id = t2.contest_id-1
INNER JOIN temp1 AS t3 ON t1.contest_id = t3.contest_id-2
WHERE
    t1.medal=t2.medal and t2.medal=t3.medal)
# Then second condition
,temp3 AS (
SELECT
    gold_medal AS medal
FROM
    contests
GROUP BY gold_medal
    HAVING COUNT(contest_id) >= 3
)

SELECT
    name,
    mail
FROM
    Users
WHERE
    user_id IN (SELECT medal FROM temp2)
    OR user_id IN (SELECT medal FROM temp3);
