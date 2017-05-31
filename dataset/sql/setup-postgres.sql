CREATE EXTENSION IF NOT EXISTS postgres_fdw;
CREATE EXTENSION IF NOT EXISTS dblink;
DROP SERVER IF EXISTS foreign_server CASCADE;
CREATE SERVER foreign_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (host '<redshifthost>' , port '<RedshiftDatabasePort>' , dbname '<RedshiftDBName>' , sslmode 'require');
DROP USER MAPPING IF EXISTS FOR <RDSDBUser> SERVER foreign_server;
CREATE USER MAPPING FOR <RDSDBUser> SERVER foreign_server OPTIONS (user '<RedshiftDBUser>' , password '<RedshiftUserDBPassword>');

DROP table IF EXISTS store_sales_agg;

CREATE TABLE public.store_sales_agg
(
    cd_credit_rating character(10) COLLATE pg_catalog."default",
    i_category character varying(50) COLLATE pg_catalog."default",
    cd_education_status character(20) COLLATE pg_catalog."default",
    ca_state character(2) COLLATE pg_catalog."default",
    d_date_week date,
    ss_ticket_number integer,
    "number of rows" integer,
    ss_ext_discount_amt numeric,
    ss_net_paid numeric
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;
