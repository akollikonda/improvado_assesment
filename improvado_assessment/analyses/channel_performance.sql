SELECT
    c.channel,
    SUM(f.spend) AS total_spend,
    SUM(f.conversions) AS total_conversions,
    (SUM(f.conversions) * 100.0) / NULLIF(SUM(f.spend), 0) AS roas
FROM
    {{ ref('fct_campaign_performance') }} f
JOIN
    {{ ref('dim_campaigns') }} c ON f.campaign_id = c.campaign_id
GROUP BY
    c.channel
ORDER BY
    roas DESC  
LIMIT 1;  
