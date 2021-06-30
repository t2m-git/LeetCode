# Write your MySQL query statement below 
SELECT
    u.month,
    u.country,
    SUM(u.approved_count) AS approved_count,
    SUM(u.approved_amount) AS approved_amount,
    SUM(u.chargeback_count) AS chargeback_count,
    SUM(u.chargeback_amount) AS chargeback_amount
FROM
(   
(
SELECT
    SUBSTR(t.trans_date, 1, 7) AS month,
    t.country,
    SUM(CASE WHEN t.state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(CASE WHEN t.state = 'approved' THEN t.amount ELSE 0 END) AS approved_amount,
    0 AS chargeback_count,
    0 AS chargeback_amount
FROM
    Transactions AS t
GROUP BY month, t.country
)
UNION ALL
(
SELECT
    SUBSTR(c.trans_date, 1, 7) AS month,
    t.country,
    0 AS approved_count,
    0 AS approved_amount,
    SUM(CASE WHEN c.trans_id IS NOT NULL THEN 1 ELSE 0 END) AS chargeback_count,
    SUM(t.amount) AS chargeback_amount
FROM
    Transactions AS t
LEFT JOIN Chargebacks AS c ON c.trans_id = t.id
WHERE
    t.id IN (
        SELECT
            trans_id
        FROM
            Chargebacks
        )
GROUP BY month, t.country
)
) AS u
GROUP BY u.month, u.country
HAVING
    SUM(u.approved_count) <> 0
    OR SUM(u.approved_amount) <> 0
    OR SUM(u.chargeback_count) <> 0
    OR SUM(u.chargeback_amount) <> 0
ORDER BY u.month, u.country;
