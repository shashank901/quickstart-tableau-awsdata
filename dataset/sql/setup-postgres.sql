CREATE EXTENSION IF NOT EXISTS postgres_fdw;
CREATE EXTENSION IF NOT EXISTS dblink; 
DROP SERVER IF EXISTS foreign_server CASCADE; 
CREATE SERVER foreign_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (host '<redshifthost>' , port '<RedshiftDatabasePort>' , dbname '<RedshiftDBName>' , sslmode 'require');
DROP USER MAPPING IF EXISTS FOR <RDSDBUser> SERVER foreign_server;
CREATE USER MAPPING FOR <RDSDBUser> SERVER foreign_server OPTIONS (user '<RedshiftDBUser>' , password '<RedshiftUserDBPassword>'); 

DROP table IF EXISTS venue; 
create table venue (venueid smallint,venuename varchar(100), venuecity varchar(30), venuestate char(2), venueseats integer);
insert into venue select * from dblink( 'foreign_server' , 'select * from venue' ) as 
t1 (venueid smallint,venuename varchar(100), venuecity varchar(30), venuestate char(2), venueseats integer);
