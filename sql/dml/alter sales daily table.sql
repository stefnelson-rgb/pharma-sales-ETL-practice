  ALTER TABLE pharma_sales_daily
ADD COLUMN datum_date DATE;
 
 
 SET SQL_SAFE_UPDATES = 0;

UPDATE pharma_sales_daily
SET datum_date = STR_TO_DATE(Datum, '%m/%d/%Y')
WHERE datum_date IS NULL;

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE pharma_sales_daily
DROP datum;

ALTER TABLE pharma_sales_daily
RENAME COLUMN datum_date TO datum;



   



