/* Changes to this template can be proposed at https://github.com/GregTrevellick/VsixItemTemplateSqlScriptFunction/blob/master/Src/ItemTemplate/ItemTemplate.sql */

IF NOT EXISTS 
			(SELECT 1 
			FROM sys.objects obj 
			WHERE obj.schema_id = SCHEMA_ID('dbo')
			AND obj.[Name] = 'MyFunction'
			AND obj.[Type] IN ( N'FN', N'IF', N'TF', N'FS', N'FT' )) 
BEGIN
	--Create dummy object
    EXECUTE('CREATE FUNCTION dbo.MyFunction() RETURNS INT AS BEGIN RETURN (SELECT 0) END')
END
GO

--Alter the object rather than delete and recreate so as to retain permissions, plans, history, etc
ALTER FUNCTION dbo.MyFunction()
RETURNS INT
AS
BEGIN
	RETURN (SELECT 1)
END