USE [master]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SaveAssembly]
		@assemblyName = N'SQL#.TypesAndAggregates',
		@destinationPath = N'F:\'

SELECT	'Return Value' = @return_value

GO

SELECT TOP 1 af.name, dbo.FileCreate('C:\Teste.dll', af.content, null) FROM sys.assemblies a INNER JOIN sys.assembly_files af ON a.assembly_id = af.assembly_id WHERE a.name = 'Signa.Utils.SQL.CLR'

SELECT 'DROP ' + CASE WHEN [TYPE] LIKE 'F%' THEN 'FUNCTION ' WHEN [TYPE] LIKE 'P%' THEN 'PROC ' WHEN [TYPE] LIKE 'A%' THEN 'AGGREGATE ' END + SCHEMA_NAME(SCHEMA_ID) + '.' + QUOTENAME(NAME), * FROM SYS.objects WHERE CREATE_DATE >= GETDATE()-1

SELECT 'DROP ASSEMBLY ' + QUOTENAME(NAME), * FROM sys.assemblies WHERE create_date >= GETDATE()-1

SELECT 'DROP TYPE ' + SCHEMA_NAME(SCHEMA_ID) + '.' + QUOTENAME(NAME), * FROM sys.types

