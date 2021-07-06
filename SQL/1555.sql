SELECT
    u.user_id,
    u.user_name,
    SUM(s.credit) AS credit,
    CASE
        WHEN SUM(s.credit) < 0 THEN 'Yes' ELSE 'No' END AS credit_limit_breached
FROM
(
SELECT
    user_id,
    credit,
    DATE('2020-07-31') AS date
FROM
    Users
UNION ALL
SELECT
    paid_by,
    amount * (-1) AS credit,
    transacted_on
FROM
    Transactions
UNION ALL
SELECT
    paid_to,
    amount * (1) AS credit,
    transacted_on
FROM
    Transactions
) AS s
INNER JOIN Users AS u ON u.user_id = s.user_id
GROUP BY u.user_id;
