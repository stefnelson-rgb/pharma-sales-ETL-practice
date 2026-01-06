INSERT INTO dim_date (month, year, month_name, quarter)
SELECT DISTINCT
	month, 
	year, 
	MONTHNAME(STR_TO_DATE(CONCAT(year, '-', month, '-01'), '%Y-%m-%d')) AS month_name,
	CONCAT('Q', CEIL(month / 3)) AS quarter
 FROM pharma_sales;


INSERT INTO dim_product (product_name, product_class)
SELECT DISTINCT product_name, product_class FROM pharma_sales;



INSERT INTO dim_customer (customer_name, distributor, channel, subchannel, city, country)
SELECT DISTINCT customer_name, distributor, channel, subchannel, city, country FROM pharma_sales;



INSERT INTO dim_rep (name_of_sales_rep, manager, sales_team, country)
SELECT DISTINCT name_of_sales_rep, manager, sales_team, country FROM pharma_sales;
