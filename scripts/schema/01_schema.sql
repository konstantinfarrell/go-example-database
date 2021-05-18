CREATE TABLE files(
    fileId UUID PRIMARY KEY NOT NULL,
    filename TEXT,
    filePath TEXT,
    permissions TEXT,
    created TIMESTAMP,
    modified TIMESTAMP,
    data BYTEA,
    received TIMESTAMP
);

GRANT SELECT,INSERT ON files TO goexampleapiuser;