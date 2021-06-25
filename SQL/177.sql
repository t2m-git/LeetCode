# Version 1
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      SELECT
        e.Salary AS getNthHighestSalary
      FROM
        (
            SELECT 
                DENSE_RANK() OVER (order by a.Salary DESC) AS my_rank,
                a.Salary 
            FROM 
                EMPLOYEE AS a
        ) AS e
            WHERE
                e.my_rank = N
            LIMIT 1
    );
END

/*
# Version 2
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE temp INT;
SET temp = N -1;
  RETURN (
      # Write your MySQL query statement below.
      SELECT
        DISTINCT e.Salary AS getNthHighestSalary
      FROM
        Employee AS e
      ORDER BY e.Salary DESC
      LIMIT temp, 1
        );
END
*/
