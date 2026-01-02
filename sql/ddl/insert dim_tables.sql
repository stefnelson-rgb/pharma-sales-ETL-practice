
INSERT INTO dim_date (month_number, month, year, quarter)
SELECT 
	month_number, 
	month,
    year, 
	CONCAT('Q', CEIL(month_number / 3)) AS quarter
 FROM pharma_sales;
 
 INSERT INTO dim_product (product_name, product_class)
SELECT 
	`Product Name`, `Product Class` 
FROM pharma_sales;


INSERT INTO dim_customer (customer_name, distributor, channel, subchannel, city, country)
SELECT 
	`Customer Name`, Distributor, Channel, `Sub-channel`, City, Country 
FROM pharma_sales;


INSERT INTO dim_rep (name_of_sales_rep, manager, sales_team, country)
SELECT 
	`Name of Sales Rep`, Manager, `Sales Team`, Country 
FROM pharma_sales;
