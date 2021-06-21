# Write your MySQL query statement below
/*SELECT
    p.customer_number
FROM
    (
    SELECT
        customer_number,
        COUNT(customer_number) AS cust_num
    FROM
        Orders
    GROUP BY customer_number
    ORDER BY cust_num DESC
    ) AS p
LIMIT 1;
*/

SELECT
    customer_number
FROM
    Orders
GROUP BY customer_number
ORDER BY COUNT(customer_number) DESC
LIMIT 1;
