-- Cria banco de dados (DB_BlockChain)com: 
-- Arquivo Primário (DB_BlockChain.mdf) com 4MB e crece a cada 1MB
-- Arquivo Log (LOG_BlockChain.ldf) com 1MB e crece a cada 1MB
CREATE DATABASE	DB_BlockChain 
ON 
	(NAME = 'DB_BlockChain', 
		FILENAME = 'D:\Documentos\arq_programs\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\DB_BlockChain.mdf',
		SIZE=4MB, 
		MAXSIZE=500MB, 
		FILEGROWTH=1MB)
LOG ON
	(NAME = 'LOG_BlockChain', FILENAME = 'D:\Documentos\arq_programs\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\LOG_BlockChain.ldf',
		SIZE=1MB, MAXSIZE=500MB, FILEGROWTH=1MB)
GO
-- Cria usuário para fazer login e acessar usuários
CREATE LOGIN PabloLogin WITH PASSWORD='abc123';
GO
-- Cria usuário para acessar os bancos de dados e atribui usuario de login
CREATE USER Usuario01 FOR LOGIN PabloLogin
GO
-- Concede permissões ao usuário Usuario01
GRANT UPDATE, INSERT, SELECT TO Usuario01
GO
-- Cria um Schema denominado BC->(Block Chain) para conter as tabelas do banco de dados DB_BlockChain
CREATE SCHEMA BC AUTHORIZATION Usuario01


