# Write your MySQL query statement below
SELECT
    x,
    y,
    z,
    # Based on a definition of triangle, the longest line segment is less than the sum of the others.
    # This idea cannot be used since culculations are hard to generalize.
    # Therefore, I will use another idea that the sum of any two line segments is always longer than the other to form a triangle.
    CASE WHEN (x + y) > z AND (y + z) > x AND (z + x) > y THEN 'Yes'
    ELSE 'No' END AS triangle
FROM
    triangle;
