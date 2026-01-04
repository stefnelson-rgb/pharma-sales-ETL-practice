CREATE TABLE fact_sales AS
SELECT s.quantity, s.price, s.sales, d.date_id, p.product_id, c.customer_id, r.rep_id FROM pharma_sales s
JOIN dim_date d
	ON s.year = d.year
JOIN dim_product p
	ON s.`product name` = p.product_name
JOIN dim_customer c
	ON s.`customer name` = c.customer_name
JOIN dim_rep r
	ON s.manager = r.manager;
