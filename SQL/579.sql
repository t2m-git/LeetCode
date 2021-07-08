# Write your MySQL query statement below
WITH cte AS (
    
SELECT
    *,
    MAX(month) OVER(PARTITION BY id) AS recent_month
FROM
    Employee

)

SELECT
    Id,
    Month,
    # Why rows between 2 preceding and current row?
    # This is because we are required to have cummulative sum of three months.
    SUM(salary) OVER(PARTITION BY id ORDER BY month ASC rows between 2 preceding and current row) AS Salary
FROM
    cte
WHERE
    Month < recent_month
ORDER BY
    id,
    Month DESC;
    
    # Write your MySQL query statement below
SELECT
    s.ID,
    s.Month,
    s.cum_sal AS Salary
FROM
(
SELECT
    *,
    SUM(Salary) OVER (PARTITION BY Id ORDER BY Month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS cum_sal,
    RANK() OVER (PARTITION BY Id ORDER BY Month DESC) AS my_rank
FROM
    Employee
) AS s
WHERE
    my_rank <> 1
ORDER BY 1, 2 DESC;
