# Write your MySQL query statement below
SELECT
    DISTINCT Email AS Email
FROM
    Person
GROUP BY Email
HAVING
    COUNT(Email) > 1;
