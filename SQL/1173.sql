# Write your MySQL query statement below
/*
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
*/  
 
SELECT   
    ROUND(SUM(test) / COUNT(test)*100, 2) AS immediate_percentage
FROM
    (
    SELECT 
        CASE 
            WHEN order_date = customer_pref_delivery_date THEN 1 
            ELSE 0 
        END AS test 
    from 
        Delivery
    ) AS temp;
