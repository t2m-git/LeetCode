# Write your MySQL query statement below
SELECT
    o.company_id,
    o.employee_id,
    o.employee_name,
    ROUND(o.salary * (1 - s1.tax), 0) AS salary
FROM
    Salaries AS o
LEFT JOIN
(
SELECT
    s.company_id,
    CASE
        WHEN s.max_sal < 1000 THEN 0
        WHEN s.max_sal BETWEEN 1000 AND 10000 THEN 0.24
        ELSE 0.49 END AS tax
FROM
(
SELECT
    company_id,
    MAX(salary) AS max_sal
FROM
    Salaries
GROUP BY company_id
) AS s
) AS s1 ON s1.company_id = o.company_id;
