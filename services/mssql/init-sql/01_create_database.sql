IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'kanoa')
BEGIN
    CREATE DATABASE kanoa;
END
GO
