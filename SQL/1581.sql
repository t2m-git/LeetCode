# Write your MySQL query statement below
/*
SELECT
    v.customer_id,
    COUNT(v.visit_id) AS count_no_trans
FROM
    Visits AS v
WHERE v.visit_id NOT IN (

    SELECT
        visit_id
    FROM
        Transactions

) 
GROUP BY v.customer_id;
*/

SELECT
    v.customer_id,
    COUNT(v.visit_id) as 'count_no_trans'
FROM
    Visits as v
LEFT JOIN
    Transactions as t
USING (visit_id)
WHERE
    t.transaction_id IS NULL
GROUP BY v.customer_id;
