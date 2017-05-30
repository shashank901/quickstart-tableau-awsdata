drop table IF EXISTS store_sales;

CREATE TABLE public.store_sales
(
	ss_item_sk INTEGER NOT NULL ENCODE delta32k,
	ss_addr_sk INTEGER ENCODE runlength,
	ss_ticket_number INTEGER NOT NULL ENCODE runlength,
	ss_quantity INTEGER ENCODE delta,
	ss_wholesale_cost NUMERIC(7, 2) ENCODE delta32k,
	ss_list_price NUMERIC(7, 2) ENCODE delta32k,
	ss_sales_price NUMERIC(7, 2) ENCODE delta32k,
	ss_ext_discount_amt NUMERIC(7, 2) ENCODE lzo,
	ss_ext_sales_price NUMERIC(7, 2) ENCODE lzo,
	ss_ext_wholesale_cost NUMERIC(7, 2) ENCODE lzo,
	ss_ext_list_price NUMERIC(7, 2) ENCODE lzo,
	ss_ext_tax NUMERIC(7, 2) ENCODE mostly16,
	ss_coupon_amt NUMERIC(7, 2) ENCODE lzo,
	ss_net_paid NUMERIC(7, 2) ENCODE lzo,
	ss_net_paid_inc_tax NUMERIC(7, 2) ENCODE lzo,
	ss_net_profit NUMERIC(7, 2) ENCODE lzo,
	d_date DATE ENCODE lzo,
	i_item_id CHAR(16) ENCODE lzo DISTKEY,
	i_category CHAR(50) ENCODE lzo,
	i_brand CHAR(50) ENCODE lzo,
	cd_gender CHAR(1) ENCODE lzo,
	cd_marital_status CHAR(1) ENCODE lzo,
	cd_education_status CHAR(20),
	cd_purchase_estimate INTEGER ENCODE lzo,
	cd_credit_rating CHAR(10) ENCODE lzo,
	cd_dep_count INTEGER ENCODE lzo,
	ca_city VARCHAR(60) ENCODE lzo,
	ca_state CHAR(2) ENCODE runlength,
	s_manager VARCHAR(40) ENCODE lzo,
	s_floor_space INTEGER ENCODE lzo,
	s_market_desc VARCHAR(100) ENCODE lzo,
	s_market_manager VARCHAR(40) ENCODE lzo,
	s_state CHAR(2) ENCODE lzo,
	s_store_closed_date DATE ENCODE lzo,
	s_store_id CHAR(16) ENCODE lzo,
	s_store_name VARCHAR(50) ENCODE lzo,
	p_cost NUMERIC(15, 2) ENCODE lzo,
	hd_buy_potential CHAR(15) ENCODE bytedict,
	hd_income_band_sk INTEGER ENCODE delta,
	ib_lower_bound INTEGER ENCODE bytedict,
	ib_upper_bound INTEGER ENCODE bytedict,
	d_date_week DATE ENCODE lzo
)
SORTKEY
(
	cd_education_status,
	cd_credit_rating,
	d_date,
	i_category
);

ALTER TABLE public.store_sales
ADD CONSTRAINT store_sales_pkey
PRIMARY KEY (ss_item_sk, ss_ticket_number);

copy store_sales FROM '<S3Location>content/flat-store-sales.manifest'
credentials 'aws_iam_role=<IAM_ROLE_ARN>'
manifest csv gzip dateformat 'auto' delimiter '|' timeformat 'HH12:MI:SS' region as '<REGION>';
