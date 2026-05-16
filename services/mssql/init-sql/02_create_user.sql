IF NOT EXISTS (SELECT name FROM sys.server_principals WHERE name = 'kanoa')
BEGIN
    CREATE LOGIN kanoa WITH PASSWORD = 'P@ssword1!';
END
GO

USE kanoa;
GO

IF NOT EXISTS (SELECT name FROM sys.database_principals WHERE name = 'kanoa')
BEGIN
    CREATE USER kanoa FOR LOGIN kanoa;
    ALTER ROLE db_owner ADD MEMBER kanoa;
END
GO
