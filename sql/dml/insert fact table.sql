
INSERT INTO fact_sales (
    date_id, product_id, customer_id, rep_id,
    quantity, price, sales)
SELECT
    d.date_id,
    p.product_id,
    c.customer_id,
    r.rep_id,
    s.Quantity,
    s.Price,
    s.Sales
FROM pharma_sales s
LEFT JOIN dim_date d
    ON s.month = d.month
    AND s.year = d.year
LEFT JOIN dim_product p
    ON s.`Product Name` = p.product_name
    AND s.`Product Class` = p.product_class
LEFT JOIN dim_customer c
    ON s.`Customer Name` = c.customer_name
    AND s.Distributor = c.distributor
    AND s.Channel = c.channel
    AND s.`Sub-channel` = c.subchannel
    AND s.City = c.city
    AND s.Country = c.country
LEFT JOIN dim_rep r
    ON s.`Name of Sales Rep` = r.name_of_sales_rep
    AND s.Manager = r.manager
    AND s.`Sales Team` = r.sales_team
    AND s.Country = r.country;
