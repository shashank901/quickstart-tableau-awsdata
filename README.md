# quickstart-tableau-awsdata
## Data Warehouse with Tableau Server, Amazon Redshift, and Amazon RDS on the AWS Cloud

This Quick Start helps you deploy a modern enterprise data warehouse (EDW) environment that is based on Amazon Redshift and includes the analytics and data visualization capabilities of Tableau Server.

This AWS-validated architecture includes an Amazon Redshift data warehouse, which is an enterprise-class relational database query and management system. Amazon Redshift achieves efficient storage and optimum query performance through massively parallel processing, columnar data storage, and efficient, targeted data compression encoding schemes.

The Quick Start deploys Tableau Server for BI and data visualization capabilities. With Tableau Server deployed on AWS, enterprises can take advantage of collaborative analytics and the price/performance economies and agility provided by the cloud. The Quick Start includes a sample dataset that's loaded to an Amazon Redshift cluster to support efficient creation of aggregates at large data scale. You can also choose to load your own dataset.

The AWS CloudFormation templates included with the Quick Start automate the following:

- Deploying Tableau Server with AWS services into a new VPC
- Deploying Tableau Server with AWS services into an existing VPC 

You can also use the AWS CloudFormation templates as a starting point for your own implementation.

![Quick Start architecture for data warehouse modernization on AWS](https://d0.awsstatic.com/partner-network/QuickStart/datasheets/tableau-awsdata-architecture.png)

For architectural details, best practices, step-by-step instructions, and customization options, see the [deployment guide](https://s3.amazonaws.com/quickstart-reference/tableau/awsdata/latest/doc/data-warehouse-modernization-on-aws-with-tableau-and-redshift.pdf).

To post feedback, submit feature ideas, or report bugs, use the **Issues** section of this GitHub repo.
If you'd like to submit code for this Quick Start, please review the [AWS Quick Start Contributor's Kit](https://aws-quickstart.github.io/). 
