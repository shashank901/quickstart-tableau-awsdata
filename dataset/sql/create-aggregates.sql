DROP VIEW IF EXISTS sales_aggregates;

CREATE VIEW sales_aggregates AS
SELECT
    d.year,
    d.month,
    SUM(s.qtysold) as sum_qtysold,
    SUM(s.pricepaid) as sum_pricepaid,
    SUM(s.commission) as sum_commission
FROM sales s
INNER JOIN date d
ON s.dateid=d.dateid
GROUP BY d.year, d.month
ORDER BY d.year, d.month
;
