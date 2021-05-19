CREATE OR REPLACE PROCEDURE create_file(
    fileId UUID,
    fileName TEXT,
    filePath TEXT,
    permissions TEXT,
    created TIMESTAMP,
    modified TIMESTAMP,
    data BYTEA,
    received TIMESTAMP
)
LANGUAGE plpgsql
AS $$ 
BEGIN
    INSERT INTO files
    VALUES (
        fileId,
        fileName,
        filePath,
        permissions,
        created,
        modified,
        data,
        received
    );
    COMMIT;
END
$$;
GRANT EXECUTE ON PROCEDURE create_file(UUID, TEXT, TEXT, TEXT, TIMESTAMP, TIMESTAMP, BYTEA, TIMESTAMP) TO goExampleAPIUser;

CREATE OR REPLACE PROCEDURE delete_file(
    fId UUID
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM files
    WHERE fileId = fId;
    COMMIT;
END
$$;
GRANT EXECUTE ON PROCEDURE delete_file(UUID) TO goExampleAPIUser;

CREATE OR REPLACE FUNCTION read_file(
    fId UUID
)
RETURNS TABLE(
    fileId UUID,
    fileName TEXT,
    filePath TEXT,
    permissions TEXT,
    created TIMESTAMP,
    modified TIMESTAMP,
    data BYTEA,
    received TIMESTAMP
)
AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM files fs
    WHERE fs.fileId = fId;
END
$$
LANGUAGE plpgsql;
GRANT EXECUTE ON FUNCTION read_file(UUID) TO goExampleAPIUser;


CREATE OR REPLACE FUNCTION read_all_files()
RETURNS TABLE(
    fileId UUID,
    fileName TEXT,
    filePath TEXT,
    permissions TEXT,
    created TIMESTAMP,
    modified TIMESTAMP,
    data BYTEA,
    received TIMESTAMP
)
AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM files;
END
$$
LANGUAGE plpgsql;
GRANT EXECUTE ON FUNCTION read_all_files() TO goExampleAPIUser;