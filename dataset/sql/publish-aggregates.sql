TRUNCATE TABLE store_sales_agg;
DROP INDEX IF EXISTS idx_clustered_cover_query2_3;
DROP INDEX IF EXISTS idx_coverq1;
DROP INDEX IF EXISTS idx_date;

insert into store_sales_agg
select * from dblink('foreign_server','
  SELECT
    cd_credit_rating,
    i_category,
    cd_education_status,
    ca_state,
    d_date_week,
    ss_ticket_number,
    "number of rows",
    ss_ext_discount_amt,
    ss_net_paid
  FROM
    store_sales_aggregates')
  as t1 (
   	cd_credit_rating char(10),
  	i_category varchar(50),
  	cd_education_status char(20),
  	ca_state char(2),
  	d_date_week date,
  	ss_ticket_number integer,
  	"number of rows" integer,
  	ss_ext_discount_amt NUMERIC,
  	ss_net_paid  NUMERIC);

  CREATE INDEX idx_clustered_cover_query2_3
      ON public.store_sales_agg USING btree
      (cd_education_status COLLATE pg_catalog."default", cd_credit_rating COLLATE pg_catalog."default", d_date_week, i_category COLLATE pg_catalog."default")
      TABLESPACE pg_default;

  ALTER TABLE public.store_sales_agg
      CLUSTER ON idx_clustered_cover_query2_3;

  CREATE INDEX idx_coverq1
      ON public.store_sales_agg USING btree
      (cd_education_status COLLATE pg_catalog."default", ca_state COLLATE pg_catalog."default", cd_credit_rating COLLATE pg_catalog."default", d_date_week, i_category COLLATE pg_catalog."default")
      TABLESPACE pg_default;


  CREATE INDEX idx_date
      ON public.store_sales_agg USING btree
      (d_date_week)
      TABLESPACE pg_default;
