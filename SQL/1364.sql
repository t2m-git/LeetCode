# Write your MySQL query statement below
SELECT 
    i.invoice_id,
    c1.customer_name,
    i.price,
    COUNT(c2.contact_name) contacts_cnt,
    SUM(
        IF(
            c2.contact_name IN (
                SELECT
                    DISTINCT customer_name
                FROM
                    customers
            ), 1, 0)
    ) AS trusted_contacts_cnt
FROM
    invoices AS i
INNER JOIN Customers AS c1 ON c1.customer_id = i.user_id
LEFT JOIN Contacts AS c2 ON c2.user_id = c1.customer_id
GROUP BY i.invoice_id
ORDER BY i.invoice_id;
