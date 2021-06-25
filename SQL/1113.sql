SELECT
    extra AS report_reason,
    # Why do I have to use DISTINCT for post_id?
    COUNT(DISTINCT post_id) AS report_count
FROM
    Actions
WHERE
    action_date = '2019-07-04' AND
    action = 'report'
GROUP BY extra;

/*
SELECT 
    x.extra AS report_reason,
    COUNT(x.extra) AS report_count 
FROM 
    (
    
        SELECT
            DISTINCT post_id,
            action_date,
            action,
            extra  
        FROM
            Actions
    
    ) AS x
    WHERE
        x.action_date = '2019-07-04' AND
        x.action = 'report'
    GROUP BY x.extra
    ORDER BY report_reason ASC;
*/
