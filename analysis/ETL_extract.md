# Source files:

## Pharmaceutical_sales.csv
- Row count: 254,083



# Column descriptions 
## Pharma_sales
- **Distributor**: Company responsible for distributing the product
- **Customer Name**: Pharmaceutical company that owns the product
- **City**: City where the sale occurred
- **Country**: Country of the sale location
- **Latitude**: Geographic latitude of the customer location
- **Longitude**: Geographic longitude of the customer location
- **Channel**: Sales channel (e.g., hospital, pharmacy)
- **Sub-channel**: Subcategory of the channel (e.g., private, public, retail, government)
- **Product Name**: Commercial product name
- **Product Class**: Therapeutic or drug class
- **Quantity**: Units sold
- **Price**: Price per unit
- **Sales**: Total sales amount
- **Month**: Month of the transaction
- **Year**: Year of the transaction
- **Name of Sales Rep**: Sales representative handling the account
- **Manager**: Manager overseeing the sales representative
- **Sales Team**: Team or group assigned to the representative


## Known issues (date formats, missing values, inconsistent casing)
Month column is a string, so I added a month_number column:

UPDATE pharma_sales
SET month_number = CASE 
    month
    WHEN  'January' THEN 1
    WHEN  'February' THEN 2
    

etc...


## ETL
# Cleaning of data:
I checked for missing mandatory fields, invalid dates, duplicates, Standardized date formats and normalized product names



# Create a staging table for Pharma_sales
To avoid transforming the raw dataset directly, I created a **staging table** named `stg_sales` and loaded it with the same records from the original `pharma_sales` table. The staging layer serves as an intermediate workspace where data can be standardized and cleaned before loading it into the dimensional model. The raw dataset includes *Latitude* and *Longitude*, but these fields are not required for any analytical use case in the warehouse. Since no geographic dimension is being modeled, these columns are intentionally excluded from the staging table to keep the schema focused and efficient



# Create Dimension Tables
To support a star schema and improve analytical performance, I created 4 **dimension tables**. Each dimension isolates a specific business entity from the original dataset, enabling cleaner joins and more efficient queries

- `dim_date`: This table stores temporal attributes used for time‑based analysis. It includes:
    - month 
    - year 
    - date_id (surrogate key)
    - month_number 
    - quarter: The quarter value is derived using:

          CONCAT('Q', CEIL(month_number / 3)) AS quarter


- `dim_product`: Captures product‑related attributes: 
    - product_id
    - product_name
    - product class 

- `dim_customer`: Represents the customer entity: 
    - cutomer_id
    - customer name
    - distributor
    - channel
    - subchannel
    - city 
    - country



- `dim_rep`: Stores information about the sales representatives: 
    - rep_id
    - name
    - manager
    - team


## Created a fact table


### Calculate derived metrics

## Data Reconciliation Queries (ETL Testing)
### Row count comparison
### Sum comparison


# Create the fact table











































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
