# Write your MySQL query statement below
SELECT
    employee_id,
    CASE
        #WHEN employee_id MOD 2 <> 0 AND SUBSTR(name, 1, 1) <> 'M' THEN Salary
        WHEN employee_id % 2 <> 0 AND SUBSTR(name, 1, 1) <> 'M' THEN Salary
        ELSE 0 END AS bonus
FROM
    Employees;
