SELECT 
    [Nome Tabela] = t.NAME,
    [Qtde. Registros] = p.rows,
    [Espa�o Total (MB)] = ((SUM(a.total_pages) * 8) / 1024), 
    [Espa�o Utilizado (MB)]   = ((SUM(a.used_pages) * 8) / 1024), 
    [Espa�o N�o utilizado (MB)]  =  ( ((SUM(a.total_pages) - SUM(a.used_pages)) * 8) / 1024)
FROM 
    sys.tables t
INNER JOIN      
    sys.indexes i ON t.OBJECT_ID = i.object_id
INNER JOIN 
    sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN 
    sys.allocation_units a ON p.partition_id = a.container_id
WHERE 
    t.NAME NOT LIKE 'dt%' 
    AND t.is_ms_shipped = 0
    AND i.OBJECT_ID > 255 
GROUP BY 
    t.Name, p.Rows
ORDER BY 
    3 desc

--TRUNCATE TABLE LOG_SISTEMA
--TRUNCATE TABLE LOG_GERADOR
--TRUNCATE TABLE LOG_SISTEMA_TEXTO
--TRUNCATE TABLE ARQUIVO_EDI_LOG_SISTEMA
--TRUNCATE TABLE LOG_MSG

TRUNCATE TABLE TEMP_ABSORCAO

--TRUNCATE TABLE LOCALIZACAO_VEICULO
--TRUNCATE TABLE LOG_EXECUCAO
--TRUNCATE TABLE ANOMALIA_EDI
--TRUNCATE TABLE TEMP_LOG_INTEGRA
--TRUNCATE TABLE LOG_GERADOR
--TRUNCATE TABLE DDLEvents
--TRUNCATE TABLE Absorcao_Xml

--ALTER TABLE PENSKE_BID.dbo.LOG_SISTEMA_TEXTO DROP CONSTRAINT FK__LOG_SISTE__LOG_S__2E1F9ACD
--ALTER TABLE PENSKE_BID.dbo.ARQUIVO_RECEBIDO_EDI DROP CONSTRAINT FK__ARQUIVO_R__LOG_G__23E1A417
--ALTER TABLE PENSKE_BID.dbo.ANOMALIA_EDI DROP CONSTRAINT FK__ANOMALIA___LOG_G__2E8C7D18

--ALTER TABLE DIGIAIMO.dbo.MENSAGEM_VEICULO DROP CONSTRAINT FK__MENSAGEM___LOCAL__6E221E15
--ALTER TABLE DIGIAIMO.dbo.STATUS_VEICULO DROP CONSTRAINT FK__STATUS_VE__LOCAL__324E5A1B

--ALTER TABLE RODOMEU.dbo.TEMP_ABSORCAO_CAMPO DROP CONSTRAINT FK_TEMP_ABSORCAO_CAMPO01
--ALTER TABLE LOCALIZACAO_VEICULO DROP CONSTRAINT PK__LOCALIZACAO_VEIC__405A880E
--ALTER TABLE MENSAGEM_VEICULO DROP CONSTRAINT FK__MENSAGEM___LOCAL__6E221E15

--SELECT * FROM sys.key_constraints WHERE parent_object_id = object_id ('LOCALIZACAO_VEICULO')

--SELECT TOP 50 * FROM ARQUIVO_EDI_LOG_SISTEMA

SELECT *
FROM	DOCTO_TRANSPORTE
WHERE	CAST(DATA_EMISSAO AS HOUR) = '15:00'

--SELECT CONVERT(VARCHAR(5), GETDATE(), 108)

--SELECT DATEPART(HOUR, GETDATE())
--SELECT DATEPART(MINUTE, GETDATE())
--SELECT CAST(GETDATE() AS INT)


ALTER TABLE VALIDACAO.dbo.ARQUIVO_RECEBIDO_EDI DROP CONSTRAINT FK_LOG_GERADOR_ID
--ALTER TABLE VALIDACAO.dbo.DOCTO_TRANSPORTE DROP CONSTRAINT FK13COD_AGEND_ARQ_SO
--ALTER TABLE VALIDACAO.dbo.LOG_ENVIO_EMAIL DROP CONSTRAINT FK_LOG_ENVIO_EMAIL_LOG_GERADOR
--ALTER TABLE VALIDACAO.dbo.LOG_GERADOR_ARQ DROP CONSTRAINT FK1058LOG_GERADOR_ID
--ALTER TABLE VALIDACAO.dbo.LOG_GERADOR_MSG DROP CONSTRAINT FK_997_LOG_GERADOR_ID
--ALTER TABLE VALIDACAO.dbo.ORDEM_SERVICO_TIPO DROP CONSTRAINT FK511COD_AGEND_ARQ_PO