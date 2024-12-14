WITH raw AS (
    SELECT
        campaign_id,
        TRIM(LOWER(campaign_name)) AS campaign_name, -- Standardize campaign names
        TRIM(LOWER(channel)) AS channel -- Standardize channel names
    FROM {{ source('marketing_data', 'raw_campaigns') }}
)
SELECT
    campaign_id,
    campaign_name,
    channel
FROM raw
