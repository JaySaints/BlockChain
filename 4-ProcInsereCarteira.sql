-- Seleciona o Banco de dados DB_BlockChain
USE DB_BlockChain
GO
-- PROCEDURE CriaCarteira  recebe dois valores do tipo inteiro--> Tem a finalidade de facilita a inserção de novos elementos na tabela CARTEIRA
-- No campo Endereço que tem como objetivo identificar a carteira na blockchain, seu valor é composto por um hash de 32bits.
-- O valor para calcular o hash é proposto por uma funçaõ randomica que agrega seu valor a variavel @rand que é passada como valor para função HASHBYTES
CREATE PROCEDURE sch_bkc.CriaCarteira (@corretora INT, @cliente INT)
AS
	DECLARE @endereco VARCHAR(32)
	DECLARE @rand VARCHAR(32)
	SET @rand = CONVERT(VARCHAR(32), RAND(),2)
	SET @endereco = CONVERT(VARCHAR(32), HASHBYTES('MD5', @rand),2)
	INSERT INTO sch_bkc.Carteira 
		VALUES (@endereco, @corretora, @cliente)
RETURN
GO
