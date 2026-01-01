CREATE TABLE dim_date (
	date_id  INTEGER NOT NULL AUTO_INCREMENT,
	month INT,
	month_name VARCHAR(10),
	quarter VARCHAR(5),
	year INT,
	PRIMARY KEY (date_id)
	) ;
	
CREATE TABLE dim_product (
	product_id  INTEGER NOT NULL AUTO_INCREMENT,
	product_name VARCHAR(20),
	product_class VARCHAR(20),
	PRIMARY KEY (product_id)
	);


CREATE TABLE dim_customer (
	customer_id  INTEGER NOT NULL AUTO_INCREMENT,
	customer_name VARCHAR(20),
	distributor VARCHAR(30),
	channel VARCHAR(10),
	subchannel VARCHAR(15),
	city VARCHAR(30),
	country VARCHAR(20),
	PRIMARY KEY (customer_id)
	) ;


CREATE TABLE dim_rep (
	rep_id  INTEGER NOT NULL AUTO_INCREMENT,
	name_of_sales_rep VARCHAR(20),
	manager VARCHAR(20),
	sales_team VARCHAR(20),
	country VARCHAR(20),
	PRIMARY KEY (rep_id)
	) ;
