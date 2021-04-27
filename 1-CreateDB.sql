-- Cria banco de dados (DB_BlockChain)com: 
-- Arquivo Primário (DB_BlockChain.mdf) com 3MB e crece a cada 1MB
-- Arquivo Log (LOG_BlockChain.ldf) com 1MB e crece a cada 1MB
CREATE DATABASE	DB_BlockChain 
ON PRIMARY
	(NAME = 'DB_BlockChain', 
		FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\DB_BlockChain.mdf',
		SIZE=3MB, 		 
		FILEGROWTH=1MB)
LOG ON
	(NAME = 'LOG_BlockChain', FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\LOG_BlockChain.ldf',
		SIZE=1MB, FILEGROWTH=1MB)
GO


