# Table List
- dim_date
- dim_product
- dim_customer
- dim_rep
- fact_sales


# Table definitions

## dim_date
    
    |    Column    | Type                            | Description                        |
    | :----------: | :-----------------------------: | :--------------------------------: |
    |    date_id   | INTEGER NOT NULL AUTO_INCREMENT | Primary key                        |
    |    month     | string                          | month name                         |
    | month_number | INT                             | number of the month                |
    |   quarter    |string                           | quarter calculated by month_number |
    |  year        |INT                              | year                               |
      
      

    

## dim_product
       
    |    Column    | Type                            | Description                        |
    | :----------: | :-----------------------------: | :--------------------------------: |
    |product_id    | INTEGER NOT NULL AUTO_INCREMENT | Primary key                        |
    |product_name  | string                          | product name                       |
    |product_class | string                          | class of the product               |
    
    

## dim_customer 

    |    Column    | Type                            | Description                        |
    | :----------: | :-----------------------------: | :--------------------------------: |
    |customer_id   | INTEGER NOT NULL AUTO_INCREMENT | Primary key                        |
    |customer_nam  | string                          | customer name                      |
    |distributor   | string                          | distributor name                   |
    | channel      |string                           | channel name                       |
    | subchannel   |string                           | subchannel name                    |
    | city         |string                           | city name                          |
    | country      |string                           | country name                       |



## dim_rep 

    |       Column      | Type                            | Description                        |
    | :---------------: | :-----------------------------: | :--------------------------------: |
    |rep_id             | INTEGER NOT NULL AUTO_INCREMENT | Primary key                        |
    |name_of_sales_rep  | string                          | Sales representative's name        |
    |manager            | string                          | manager name                       |
    | sales_team        |string                           | sales and managers team name       |
    | country           |string                           | country name                       |


       


## fact_sales
    date_id
    product_id
    customer_id
    rep_id


# Business rules
- Quarter = CEIL(month_number / 3)
- Sales = Quantity × Price
- Product names normalized to title case
- Customer represents the pharma company purchasing from distributor


# Known Limitations
- No geographic dimension
- No daily granularity (month/year only)
- No product hierarchy














