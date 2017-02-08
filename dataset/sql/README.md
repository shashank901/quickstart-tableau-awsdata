SQL EXPECTED BY TABLEAU AWSDATA QUICK START
===========================================

- *`setup-redshift.sql`* - Issued to Redshift.  Idempotent creation of required redshift tables, and COPY from S3 of data residing in the dataset's `content` directory.
- *`setup-postgres.sql`* - Issued to postgres RDS.  Idempotent creation of any required postgres RDS tables, and establishment of foreign database link from postgres to Redshift that is used when publishing aggregates into postgres RDS tables.
- *`create-aggregates.sql`* - Issued to Redshfit.  SQL to compute and manufacture aggregrates from raw events and granular data in fact tables.  Can be implemented to augment/maintain separate aggregate tables, or as a view that is periodically queried to trigger recomputation of aggregates.
- *`publish-aggregates.sql`* - Issued to postgres RDS.  SQL to pull aggregrates from Redshfit into postgres RDS and publish to aggregate tables suitable for dashboard requests with high availability and high read/query concurrency.

You can modify or replace each of the `.sql` files above as required by your dataset.
