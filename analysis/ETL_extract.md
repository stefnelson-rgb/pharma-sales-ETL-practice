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


# ETL
## Cleaning of data:
I checked for missing mandatory fields, invalid dates, duplicates, Standardized date formats and normalized product names



## Create a staging table for Pharma_sales
To avoid transforming the raw dataset directly, I created a **staging table** named `stg_sales` and loaded it with the same records from the original `pharma_sales` table. The staging layer serves as an intermediate workspace where data can be standardized and cleaned before loading it into the dimensional model. The raw dataset includes *Latitude* and *Longitude*, but these fields are not required for any analytical use case in the warehouse. Since no geographic dimension is being modeled, these columns are intentionally excluded from the staging table to keep the schema focused and efficient



## Create Dimension Tables
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

> Issues: While assembing the fact table i realised that I didn't make the dimension tables with DISTINCT, so i didn't have unique values to make the JOIN. I had to re do the dim tables. 


## Fact Table Creation
The fact table is the central component of the star schema. It stores the **quantitative, numerical measures** of the business process, in this case, sales metrics such as `quantity`, `price`, and `sales`. These measures are recorded at the lowest level of detail available in the dataset (one row per transaction).

To make the fact table analytically useful, I included **foreign keys** that link each fact row to the corresponding dimension tables:

- `date_id` → `dim_date`
- `product_id` → `dim_product`
- `customer_id` → `dim_customer`
- `rep_id` → `dim_rep`

These foreign keys allow the fact table to be enriched with descriptive attributes (for example: product class, customer city, sales rep team) without duplicating that information inside the fact table. This keeps the schema normalized, efficient, and easy to query.


### Why the joins were necessary
When loading the fact table, I used joins to *look up* the surrogate keys from each dimension. Each dimension contains one unique row per business entity, so the join ensures that every transaction in the fact table is linked to the correct dimension entry.

#### Why I used LEFT JOINs
LEFT JOINs ensure that every sales record from the source data is preserved, even if a matching dimension row is missing. 


### Why including foreign keys
Adding foreign key constraints is good practice because it:

- Enforces referential integrity between the fact table and dimensions.
- Prevents orphaned fact rows that reference non‑existent dimension entries.
- Ensures the star schema remains consistent as data grows.
- Makes analytical queries more reliable and predictable.

Overall, the fact table acts as the numerical core of the model, while the dimension tables provide the descriptive context. The foreign keys and joins together create a clean, well‑structured star schema suitable for reporting and analytics.



### Calculate derived metrics

## Data Reconciliation Queries (ETL Testing)
### Row count comparison
### Sum comparison






