# Write your MySQL query statement below

SELECT
    ROUND(d2.cnt / COUNT(d1.order_date) * 100, 2) AS immediate_percentage
FROM
    Delivery AS d1,
    (
        
    SELECT
        COUNT(*) AS cnt
    FROM
        Delivery
    WHERE
        order_date = customer_pref_delivery_date
        
    ) AS d2;
