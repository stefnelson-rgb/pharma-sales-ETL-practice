CREATE TABLE fact_sales (
    fact_id INTEGER NOT NULL AUTO_INCREMENT,
    date_id INT,
    product_id INT,
    customer_id INT,
    rep_id INT,
    quantity INT,
    price DECIMAL(10,2),
    sales DECIMAL(10,2),
    PRIMARY KEY (fact_id),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (rep_id) REFERENCES dim_rep(rep_id)
    );

