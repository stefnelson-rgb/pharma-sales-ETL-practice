# Source files:

## salesdaily.csv
- Row count: 2107
## saleshourly.csv
- Row count: 50533
## salesweekly.csv
- Row count: 303
## salesmonthly.csv
- Row count: 71


# Column descriptions
- **datum**: Original timestamp of each sale (raw format from source)
- **Date**: Cleaned date of sale (YYYY-MM-DD), used for joins and filtering
- **Time**: Hour of sale (HH:MM), used for hourly analysis
- **M01AB**: Quantity sold of anti-inflammatory and anti-rheumatic products (non-steroids)
- **M01AE**: Quantity sold of propionic acid derivatives
- **N02BA**: Quantity sold of salicylic acid derivatives
- **N02BE**: Quantity sold of anilides products
- **N05B**: Quantity sold of anxiolytics
- **N05C**: Quantity sold of hypnotics and sedatives
- **R03**: Quantity sold of drugs for obstructive airway diseases
- **R06**: Quantity sold of antihistamines for systemic use
- **Year**: Year of sale (used for time-based aggregation)
- **Month**: Month of sale (used for seasonal analysis)
- **Hour**: Hour of sale (numeric, used for hourly trends)
- **Weekday Name**: Day of the week (e.g., Monday, Tuesday), useful for behavioral patterns

## Known issues (date formats, missing values, inconsistent casing)


## ETL
# Check for missing mandatory fields
- Check for invalid dates

SELECT datum FROM table123
WHERE datum IS NULL

- Check for duplicates

SELECT datum, COUNT(*) AS occurrences
FROM sales_daily
GROUP BY datum
HAVING COUNT(*) > 1;

- Standardize date formats



- Normalize product names
- Map NDC codes to product IDs (dimension lookup)
- Calculate derived metrics

Loading into Dimensions (Dim Loads)
- Insert new products into dim_product (SCD Type 1)
- Insert new territories into dim_territory


Loading the Fact Table (Fact Loads)
- Insert cleaned data into fact_sales

Incremental Load Logic (Professional-Level ETL)
- Show that you can load only new data.

Data Reconciliation Queries (ETL Testing)
- These are gold in interviews.
Row count comparison
Sum comparison

Error Logging Table (Bonus ETL Skill)



## How you imported them (Workbench wizard, LOAD DATA, etc.)
- I used workbench wizard for all except the sales_daily table that I created ("C:\Users\Tefi\OneDrive\Documentos\GitHub\data-analyst-practice\sql\ddl\sales daily table.sql")
