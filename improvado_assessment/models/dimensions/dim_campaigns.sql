SELECT
    campaign_id,
    campaign_name,
    channel
FROM {{ ref('stg_campaigns') }}
