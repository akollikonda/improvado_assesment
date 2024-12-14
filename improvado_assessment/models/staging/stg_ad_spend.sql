WITH raw AS (
    SELECT
        campaign_id,
        date,
        CAST(spend AS DECIMAL(10, 2)) AS spend 
    FROM {{ source('marketing_data', 'raw_ad_spend') }} 
    WHERE spend IS NOT NULL -- Filter out rows with null spend
)
SELECT
    campaign_id,
    date,
    spend
FROM raw
