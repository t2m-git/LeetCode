# Write your MySQL query statement below
SELECT
    DISTINCT l1.account_id
FROM
    LogInfo AS l1
INNER JOIN LogInfo AS l2 ON l2.account_id = l1.account_id
AND l2.ip_address <> l1.ip_address
WHERE
    l1.login < l2.login
    AND (l2.login BETWEEN l1.login AND l1.logout
    OR l2.logout BETWEEN l1.login AND l1.logout);
