# Campaign Performance Analysis and Recommendations

## Overview
This project involves analyzing marketing campaign data to evaluate performance, identify key trends, and provide actionable recommendations to improve Return on Ad Spend (ROAS) and overall campaign efficiency. The solution includes building a pipeline using dbt, creating visualizations in Power BI, and delivering a comprehensive report for strategic insights.

---

## Project Components

### Analysis Queries in dbt
- All analysis queries used for deriving insights, including top-performing campaigns, trends, and decreasing performance, are located in the **`analyses`** directory of the dbt project.

### **1. Data Preparation and Modeling**
#### **1.1 dbt Models**
- **Raw Tables**:
  - `raw_campaigns`: Contains raw data on campaign attributes (e.g., `campaign_id`, `campaign_name`, `channel`).
  - `raw_ad_spend`: Stores daily spend data for campaigns.
  - `raw_conversions`: Tracks daily conversion counts per campaign.

- **Staging Models** (Schema: `staging`):
  - `stg_campaigns`: Cleans and standardizes campaign data.
  - `stg_ad_spend`: Cleans and standardizes spend data.
  - `stg_conversions`: Cleans and standardizes conversion data.

- **Fact and Dimension Models** (Schema: `analytics`):
  - `dim_campaigns`: A dimension table containing descriptive attributes for each campaign.
  - `fct_campaign_performance`: A fact table aggregating daily spend, conversions, ROAS, and other performance metrics.

#### **1.2 dbt Tests**
Tests were implemented to ensure data integrity:
- `unique` and `not_null` tests for primary keys.
- Foreign key relationship tests between `fct_campaign_performance` and `dim_campaigns`.

---

### **2. Visualizations in Power BI**
#### **2.1 Dashboard Components**
- **KPIs**:
  - Total Spend
  - Total Conversions
  - Average ROAS
- **Bar Chart**:
  - Total Spend vs. Total Conversions per Campaign.
- **Line Graph**:
  - Daily Spend and Conversions over time for the top-performing campaign.
- **Filters**:
  - Campaign Name
  - Channel
  - Date Range
- **Summary Table**:
  - Spend, Conversions, and ROAS per Campaign.

---

## Instructions

### **1. Data Pipeline Setup**
1. **Initialize dbt Project**:
   - Use `dbt init` to create a new project.
   - Configure connection details in `profiles.yml`.

2. **Run dbt Models**:
   - Execute `dbt run` to build staging and analytics models.
   - Test models using `dbt test` to validate data integrity.

3. **Verify Outputs**:
   - Ensure the `staging` schema contains cleaned raw data.
   - Verify the `analytics` schema includes fact and dimension tables.

---

### **2. Power BI Dashboard**
1. **Load Data**:
   - Import `fct_campaign_performance` and `dim_campaigns` from the database into Power BI.

2. **Create Visuals**:
   - Add KPI cards for Total Spend, Total Conversions, and ROAS.
   - Build a clustered bar chart for Total Spend vs. Conversions.
   - Add a line chart for Daily Spend and Conversions.
   - Add slicers for Campaign Name, Channel, and Date Range.

3. **Publish**:
   - Publish the dashboard to Power BI Service for client access.

---

## Analysis Summary
- **Which channel has the highest Return on Ad Spend (ROAS)?** The analysis reveals that Google Ads has the highest ROAS, making it the most efficient channel for driving returns relative to spend.
The analysis identified:
- **Top-performing campaigns** with high ROAS and conversions.
- **Channels with highest ROAS** (e.g., Google Ads, Facebook).
- Opportunities for optimizing **underperforming campaigns**.
- Seasonal trends and daily patterns in spend and conversions. Additionally, there were no campaigns identified with decreasing performance over the last two weeks compared to the first two weeks of the analysis period.

---

## Recommendations
1. **Reallocate Budgets**: Focus more spend on campaigns and channels with high ROAS.
2. **Optimize Content and Targeting**: Refine targeting strategies for underperforming campaigns.
3. **Seasonal Adjustments**: Increase budgets during high-performing periods.
4. **Proactive Monitoring**: Use weekly reviews to identify and address performance dips.

---

## Files and Artifacts
1. **Scripts**:
   - The create and insert scripts for tables are located in the `Scripts` folder.

1. **dbt Project**:
   - The dbt project is located in the `improvado_assessment` folder.
   - Includes raw, staging, fact, and dimension models.
   - Located in the `models/` directory with testing YAML files.

1. **dbt Project**:
   - Includes raw, staging, fact, and dimension models.
   - Located in the `models/` directory with testing YAML files.

2. **Power BI Dashboard**:
   - A `.pbix` file containing all visualizations and interactive filters.

3. **Analysis Report**:
   - Detailed summary and recommendations for the client.

---

## Conclusion
This project delivers a comprehensive analysis of campaign performance using dbt and Power BI. By following the recommendations, the client can improve ROAS, optimize spend, and ensure effective campaign management.

Feel free to reach out for further clarifications or enhancements!

