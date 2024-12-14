WITH raw AS (
    SELECT
        campaign_id,
        date,
        COALESCE(conversions, 0) AS conversions -- Replace null conversions with 0
    FROM {{ source('marketing_data', 'raw_conversions') }} 
)
SELECT
    campaign_id,
    date,
    conversions
FROM raw
