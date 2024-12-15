SELECT
    f.campaign_id,
    c.channel,
    SUM(f.spend) AS total_spend,
    SUM(f.conversions) AS total_conversions
FROM
    {{ ref('fct_campaign_performance') }} f
JOIN
    {{ ref('dim_campaigns') }} c 
ON f.campaign_id = c.campaign_id
GROUP BY
    f.campaign_id,
    c.channel
ORDER BY
    total_spend DESC;  
