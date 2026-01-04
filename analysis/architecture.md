# Intro
 This architecture describes the ETL pipeline used to transform raw pharmaceutical sales data into a dimensional data warehouse optimized for analytics. The pipeline includes a staging layer, transformation logic, and a star‑schema warehouse.


# Data flow diagram:

Raw CSV → pharma_sales (raw table)
            ↓
        stg_sales (staging)
            ↓
   Transformations (cleaning, validation)
            ↓
   Dimension Tables (dim_date, dim_product, dim_customer, dim_rep)
            ↓
        fact_sales


# ETL process

## Raw Layer
- Source: pharmaceutical_sales.csv
- Purpose: preserve original data structure
- Notes: contains messy fields, inconsistent casing, unnecessary columns


## Staging Layer
- Table: stg_sales
- Purpose: clean, standardize, validate
- Excludes: latitude/longitude
- Operations: missing value checks, normalization, date standardization


## Transformation Layer
- Month → month_number
- Quarter calculation
- Product name normalization
- Duplicate detection
- Data type corrections


## Warehouse Layer (Star Schema)
- Dimensions: date, product, customer, rep
- Fact: sales
- Surrogate keys used for all dimensions
- Measures: quantity, price, sales


# Technology Stack
Visual Studio for md
MySQL
GitHub


# Design Decisions
- Excluded latitude/longitude due to no geo dimension
- Chose star schema for simplicity and performance
- Used surrogate keys for all dimensions
- Normalized product names to avoid duplicates
