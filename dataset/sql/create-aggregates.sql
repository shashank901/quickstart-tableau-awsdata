DROP VIEW IF EXISTS store_sales_aggregates;

CREATE VIEW store_sales_aggregates AS
SELECT
  cd_credit_rating,
  i_category,
  cd_education_status,
  ca_state,
  d_date_week,
  count(ss_ticket_number) as ss_ticket_number,
  sum(1) as "number of rows",
  sum(ss_ext_discount_amt) as ss_ext_discount_amt,
  sum(ss_net_paid) as ss_net_paid
FROM
  store_sales
  GROUP BY 1,2,3,4,5
;
