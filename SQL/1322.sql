# Write your MySQL query statement below
/*
WITH tmp1 AS (
    
SELECT
    ad_id,
    SUM(CASE WHEN action IN ('Clicked') THEN 1 ELSE 0 END) AS cnt_enu,
    SUM(CASE WHEN action IN ('Clicked', 'Viewed') THEN 1 ELSE 0 END) AS cnt_den
FROM
    Ads
GROUP BY ad_id

)

SELECT
    ad_id,
    ROUND(IFNULL(cnt_enu / cnt_den * 100, 0), 2) AS ctr
    #*
FROM
    tmp1
ORDER BY ctr DESC, ad_id ASC;
*/

SELECT
    ad_id,
    ROUND(IFNULL(SUM(CASE WHEN action IN ('Clicked') THEN 1 ELSE 0 END)
    /
    SUM(CASE WHEN action IN ('Clicked', 'Viewed') THEN 1 ELSE 0 END) * 100, 0), 2) AS ctr
FROM
    Ads
GROUP BY ad_id
ORDER BY ctr DESC, ad_id ASC;
