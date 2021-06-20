# Write your MySQL query statement below
DELETE p1 FROM Person AS p1, Person AS p2
WHERE
    p1.Email = p2.Email AND
    # This is for deleting duplicate records that Id is higher than others.
    p1.Id > p2.Id
