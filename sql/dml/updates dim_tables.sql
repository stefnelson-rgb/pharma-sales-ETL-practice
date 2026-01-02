ALTER TABLE pharma_sales
ADD month_number int;



SET SQL_SAFE_UPDATES = 0;

UPDATE pharma_sales
SET month_number = CASE 
	month
	WHEN  'January' THEN 1
	WHEN  'February' THEN 2
	WHEN  'March' THEN 3
	WHEN  'April' THEN 4
	WHEN  'May' THEN 5
	WHEN  'June' THEN 6
	WHEN  'July' THEN 7
	WHEN  'August' THEN 8
	WHEN  'September' THEN 9
	WHEN  'October' THEN 10
	WHEN  'November' THEN 11
	WHEN 'December' THEN 12

END;

SET SQL_SAFE_UPDATES = 1;


ALTER TABLE dim_date
ADD month_number int;

ALTER TABLE dim_date 
MODIFY month VARCHAR(20);

ALTER TABLE dim_product
MODIFY product_name VARCHAR(40);


ALTER TABLE dim_customer
MODIFY customer_name VARCHAR(60);


