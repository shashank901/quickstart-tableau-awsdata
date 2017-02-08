drop table IF EXISTS users;
drop table IF EXISTS venue;
drop table IF EXISTS category;
drop table IF EXISTS date;
drop table IF EXISTS event; 
drop table IF EXISTS listing ; 
drop table IF EXISTS sales; 


create table users(
	userid integer not null distkey sortkey,
	username char(8),
	firstname varchar(30),
	lastname varchar(30),
	city varchar(30),
	state char(2),
	email varchar(100),
	phone char(14),
	likesports boolean,
	liketheatre boolean,
	likeconcerts boolean,
	likejazz boolean,
	likeclassical boolean,
	likeopera boolean,
	likerock boolean,
	likevegas boolean,
	likebroadway boolean,
	likemusicals boolean);

create table venue(
	venueid smallint not null distkey sortkey,
	venuename varchar(100),
	venuecity varchar(30),
	venuestate char(2),
	venueseats integer);

create table category(
	catid smallint not null distkey sortkey,
	catgroup varchar(10),
	catname varchar(10),
	catdesc varchar(50));

create table date(
	dateid smallint not null distkey sortkey,
	caldate date not null,
	day character(3) not null,
	week smallint not null,
	month character(5) not null,
	qtr character(5) not null,
	year smallint not null,
	holiday boolean default('N'));

create table event(
	eventid integer not null distkey,
	venueid smallint not null,
	catid smallint not null,
	dateid smallint not null sortkey,
	eventname varchar(200),
	starttime timestamp);

create table listing(
	listid integer not null distkey,
	sellerid integer not null,
	eventid integer not null,
	dateid smallint not null  sortkey,
	numtickets smallint not null,
	priceperticket decimal(8,2),
	totalprice decimal(8,2),
	listtime timestamp);

create table sales(
	salesid integer not null,
	listid integer not null distkey,
	sellerid integer not null,
	buyerid integer not null,
	eventid integer not null,
	dateid smallint not null sortkey,
	qtysold smallint not null,
	pricepaid decimal(8,2),
	commission decimal(8,2),
	saletime timestamp);
copy users from '<S3Location>/users/allusers_pipe.txt' credentials 'aws_iam_role=<IAM_ROLE_ARN>' delimiter '|' region '<REGION>' ;
copy venue from '<S3Location>/venue/venue_pipe.txt' credentials 'aws_iam_role=<IAM_ROLE_ARN>' delimiter '|' region '<REGION>' ;
copy category from '<S3Location>/category/category_pipe.txt' credentials 'aws_iam_role=<IAM_ROLE_ARN>' delimiter '|' region '<REGION>' ;
copy date from '<S3Location>/date/date2008_pipe.txt' credentials 'aws_iam_role=<IAM_ROLE_ARN>' delimiter '|' region '<REGION>' ;
copy event from '<S3Location>/event/allevents_pipe.txt' credentials 'aws_iam_role=<IAM_ROLE_ARN>' delimiter '|' timeformat 'YYYY-MM-DD HH:MI:SS' region '<REGION>';
copy listing from '<S3Location>/listing/listings_pipe.txt' credentials 'aws_iam_role=<IAM_ROLE_ARN>' delimiter '|' region '<REGION>' ;
copy sales from '<S3Location>/sales/sales_tab.txt' credentials 'aws_iam_role=<IAM_ROLE_ARN>' delimiter '\t' timeformat 'MM/DD/YYYY HH:MI:SS' region '<REGION>';