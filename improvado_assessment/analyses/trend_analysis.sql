WITH first_two_weeks AS (
    SELECT
        f.campaign_id,
        SUM(f.spend) AS total_spend_first_2_weeks,
        SUM(f.conversions) AS total_conversions_first_2_weeks
    FROM
        {{ ref('fct_campaign_performance') }} f
    WHERE
        f.date >= '2023-09-01'
        AND f.date <= '2023-09-14'  
    GROUP BY
        f.campaign_id
),
last_two_weeks AS (
    SELECT
        f.campaign_id,
        SUM(f.spend) AS total_spend_last_2_weeks,
        SUM(f.conversions) AS total_conversions_last_2_weeks
    FROM
        {{ ref('fct_campaign_performance') }} f
    WHERE
        f.date >= '2023-09-16'  
        AND f.date <= '2023-09-30'
    GROUP BY
        f.campaign_id
)
SELECT
    c.campaign_name,
    c.channel,
    f2w.total_spend_first_2_weeks,
    f2w.total_conversions_first_2_weeks,
    l2w.total_spend_last_2_weeks,
    l2w.total_conversions_last_2_weeks,
    (l2w.total_spend_last_2_weeks - f2w.total_spend_first_2_weeks) AS spend_difference,
    (l2w.total_conversions_last_2_weeks - f2w.total_conversions_first_2_weeks) AS conversions_difference
FROM
    first_two_weeks f2w
JOIN
    last_two_weeks l2w ON f2w.campaign_id = l2w.campaign_id
JOIN
    {{ ref('dim_campaigns') }} c ON f2w.campaign_id = c.campaign_id
-- WHERE
--     (l2w.total_spend_last_2_weeks < f2w.total_spend_first_2_weeks)
--     OR (l2w.total_conversions_last_2_weeks < f2w.total_conversions_first_2_weeks)
ORDER BY
    spend_difference ASC, conversions_difference ASC;  
