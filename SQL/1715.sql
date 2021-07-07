# Write your MySQL query statement below
WITH box AS (

SELECT
    IFNULL(SUM(apple_count), 0) AS apple_count,
    IFNULL(SUM(orange_count), 0) AS orange_count
FROM
    Boxes
), chest AS (

SELECT
    SUM(CASE WHEN b.chest_id = c.chest_id THEN IFNULL(c.apple_count, 0) ELSE 0 END) AS apple_count,
    SUM(CASE WHEN b.chest_id = c.chest_id THEN IFNULL(c.orange_count, 0) ELSE 0 END) AS orange_count
FROM
    Boxes AS b
LEFT JOIN Chests AS c ON c.chest_id = b.chest_id

)

SELECT
    box.apple_count + chest.apple_count AS apple_count,
    box.orange_count + chest.orange_count AS orange_count
FROM
    box,
    chest;
