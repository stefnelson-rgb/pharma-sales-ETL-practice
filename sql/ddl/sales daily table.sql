USE pharma_etl;

CREATE TABLE pharma_sales_daily (
	datum VARCHAR(10) NOT NULL,
    M01AB Float,
    M01AE float,
	N02BA float,
    N02BE float,
	N05B Int,
	N05C int,
	R03 int,
	R06 float,
	`Year` int,
	`Month`int,
	`Hour`int,
	`Weekday_Name` VARCHAR(10));
    
  

