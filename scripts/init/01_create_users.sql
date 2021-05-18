CREATE USER goExampleAPIAdmin WITH PASSWORD 'wevik4%#$gj,,_jas]&&deB3';
GRANT ALL PRIVILEGES ON DATABASE filestore TO goExampleAPIAdmin;


CREATE USER goexampleapiuser WITH PASSWORD 'foo';
GRANT CONNECT ON DATABASE filestore TO goExampleAPIUser;