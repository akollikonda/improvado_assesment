WITH performance AS (
    SELECT
        ad.campaign_id,
        ad.date,
        ad.spend,
        COALESCE(conv.conversions, 0) AS conversions,
        (COALESCE(conv.conversions, 0) / NULLIF(ad.spend, 0)) AS conversion_rate,
        ((COALESCE(conv.conversions, 0) * 100) / NULLIF(ad.spend, 0)) AS roas
    FROM {{ ref('stg_ad_spend') }} ad
    LEFT JOIN {{ ref('stg_conversions') }} conv
    ON ad.campaign_id = conv.campaign_id AND ad.date = conv.date
)
SELECT * FROM performance
