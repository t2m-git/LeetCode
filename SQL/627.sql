# Write your MySQL query statement below
UPDATE 
    Salary AS s
SET
    s.sex = CASE 
                WHEN s.sex = 'm' THEN 'f'
                WHEN s.sex = 'f' THEN 'm' END
WHERE
    s.sex IN ('m', 'f');
