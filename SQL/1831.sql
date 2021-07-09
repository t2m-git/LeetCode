# Write your MySQL query statement below
/*
SELECT
    transaction_id
FROM
    Transactions
WHERE
    (SUBSTR(day, 1, 10), amount) IN
(
SELECT
    SUBSTR(day, 1, 10),
    MAX(amount)
FROM
    Transactions
GROUP BY 1
)
ORDER BY 1;
*/

SELECT
  s.transaction_id  
FROM
(
SELECT
    transaction_id,
    #RANK() OVER (PARTITION BY SUBSTR(day, 1, 10) ORDER BY amount DESC) AS my_rank
    RANK() OVER (PARTITION BY DATE(day) ORDER BY amount DESC) AS my_rank
FROM
    Transactions
) AS s
WHERE
    s.my_rank = 1
ORDER BY 1;
