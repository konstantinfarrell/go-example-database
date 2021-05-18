CREATE USER goExampleAPIAdmin WITH PASSWORD 'adminFoo';
GRANT ALL PRIVILEGES ON DATABASE filestore TO goExampleAPIAdmin;


CREATE USER goexampleapiuser WITH PASSWORD 'foo';
GRANT CONNECT ON DATABASE filestore TO goexampleapiuser;