
SELECT
    SUBSTR(s.pay_date, 1, 7) AS pay_month,
    e.department_id AS department_id,
    CASE
        WHEN ROUND(AVG(s.amount), 0) > a.avg_amount THEN 'higher'
        WHEN ROUND(AVG(s.amount), 0) = a.avg_amount THEN 'same'
        ELSE 'lower' END AS comparison
FROM
    salary AS s
INNER JOIN employee AS e ON e.employee_id = s.employee_id
INNER JOIN avg_salary AS a ON a.month = SUBSTR(s.pay_date, 1, 7) 
GROUP BY 1, 2
ORDER BY 1 DESC, 2 ASC;

/*
WITH cte AS ( 
    SELECT
        LEFT(pay_date, 7) pay_month,
        department_id,
		-- calculated company avg for each month
        AVG(amount) over(PARTITION BY LEFT(pay_date, 7)) company_avg,
		-- calculated department avg for each month
        AVG(amount) over(PARTITION BY LEFT(pay_date, 7), department_id) dep_avg
    FROM 
        salary AS s
    LEFT JOIN employee AS e ON s.employee_id = e.employee_id
    )

SELECT
    DISTINCT pay_month, department_id,
    CASE
        WHEN dep_avg > company_avg THEN 'higher'
        WHEN dep_avg < company_avg THEN 'lower'
        WHEN dep_avg = company_avg THEN 'same'
    END comparison
FROM
    cte
*/
