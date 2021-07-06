SELECT
    e.left_operand,
    #v1.value,
    e.operator,
    e.right_operand,
    #v2.value,
    CASE
        WHEN e.operator = '>' THEN IF(v1.value > v2.value, 'true', 'false')
        WHEN e.operator = '=' THEN IF(v1.value = v2.value, 'true', 'false')
        WHEN e.operator = '<' THEN IF(v1.value < v2.value, 'true', 'false')
        ELSE null END AS value
FROM
    Expressions AS e
INNER JOIN Variables AS v1 ON v1.name = e.left_operand
INNER JOIN Variables AS v2 ON v2.name = e.right_operand;
