-- Seleciona o Banco de dados DB_BlockChain
USE DB_BlockChain
GO
-- PROCEDURE CriaCarteira  recebe dois valores do tipo inteiro--> Tem a finalidade de facilita a inser��o de novos elementos na tabela CARTEIRA
-- No campo Endere�o que tem como objetivo identificar a carteira na blockchain, seu valor � composto por um hash de 32bits.
-- O valor para calcular o hash � proposto por uma fun�a� randomica que agrega seu valor a variavel @rand que � passada como valor para fun��o HASHBYTES
CREATE PROCEDURE CriaCarteira (@corretora INT, @cliente INT)
AS
	DECLARE @endereco VARCHAR(32)
	DECLARE @rand VARCHAR(32)
	SET @rand = CONVERT(VARCHAR(32), RAND(),2)
	SET @endereco = CONVERT(VARCHAR(32), HASHBYTES('MD5', @rand),2)
	INSERT INTO Carteira 
		VALUES (@endereco, @corretora, @cliente)
RETURN
GO
-- Chama a PROCEDURE CriaCarteira e passa dois parametros. 
-- 1� parametro � o CodigoCorretora que se encontra na tabela Corretora
-- 2� parametro � o CodigoCliente que se encontra na tabela Cliente
EXEC CriaCarteira 2, 1
GO
EXEC CriaCarteira 2, 5
GO
EXEC CriaCarteira 4, 2
GO
EXEC CriaCarteira 1, 6
GO
EXEC CriaCarteira 4, 7
GO
EXEC CriaCarteira 2, 8
GO
