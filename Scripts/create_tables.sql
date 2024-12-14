-- raw_campaigns:
-- • campaign_id (INT) - Unique identifier for each campaign.
-- • campaign_name (VARCHAR) - Name of the campaign.
-- • channel (VARCHAR) - Marketing channel (e.g., Google Ads, Facebook Ads, Instagram).

CREATE TABLE landing.raw_campaigns (
    campaign_id SERIAL PRIMARY KEY, 
    campaign_name VARCHAR(255) NOT NULL, 
    channel VARCHAR(50) NOT NULL 
);

-- raw_ad_spend:
-- • campaign_id (INT) - Foreign key referencing campaign_id in raw_campaigns.
-- • date (DATE) - Dates covering from 2023-09-01 to 2023-09-30.
-- • spend (DECIMAL) - Daily spend amount per campaign.

CREATE TABLE landing.raw_ad_spend (
    campaign_id INT NOT NULL, 
    date DATE NOT NULL, 
    spend DECIMAL(10, 2) NOT NULL, 
    FOREIGN KEY (campaign_id) REFERENCES landing.raw_campaigns (campaign_id)
);

-- raw_conversions:
-- • campaign_id (INT) - Foreign key referencing campaign_id in raw_campaigns.
-- • date (DATE) - Dates covering the same one-month period.
-- • conversions (INT) - Daily number of conversions per campaign.

CREATE TABLE landing.raw_conversions (
    campaign_id INT NOT NULL, 
    date DATE NOT NULL, 
    conversions INT NOT NULL, 
    FOREIGN KEY (campaign_id) REFERENCES landing.raw_campaigns (campaign_id)
);
