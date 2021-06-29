# Write your MySQL query statement below
/*
SELECT
    ROUND(AVG(d1.flg_immediate) * 100, 2) AS immediate_percentage
FROM
    (
    SELECT
        SUM(CASE WHEN d.order_date = d.customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(d.delivery_id) AS     flg_immediate
    FROM
        (
        SELECT
            *,
            ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date ASC) AS my_row
        FROM
            Delivery
        ) AS d
    WHERE
        my_row = 1
    GROUP BY d.customer_id) AS d1
*/

WITH cte AS (

SELECT 
    *,
    RANK() OVER (PARTITION BY customer_id ORDER BY order_date) AS rk
FROM Delivery
    )
    
SELECT
    ROUND(AVG(CASE WHEN order_date=customer_pref_delivery_date THEN 1 ELSE 0 END)*100,2) AS immediate_percentage
FROM
    cte
WHERE
    rk = 1;
