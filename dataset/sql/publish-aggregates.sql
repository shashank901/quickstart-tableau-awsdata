DROP TABLE IF EXISTS sales_aggregates;

CREATE TABLE sales_aggregates AS
SELECT * FROM dblink( 'foreign_server' , 'SELECT * FROM sales_aggregates' ) AS
    t1 (
       	year SMALLINT,
	month CHAR(5),
	sum_qtysold BIGINT,
	sum_pricepaid DECIMAL(10,2),
	sum_commission DECIMAL(10,2)
    );

