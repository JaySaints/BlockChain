-- Seleciona o Banco de dados DB_BlockChain
USE DB_BlockChain
GO
-- PROCEDURE CriaCadastroCliente --> Tem a Finalidade de facilita a inclus�o de um novo elemento na tabela cliente. Sendo que na cria��o do elemento
-- o campo PassHash � preenchido com o Hash da senha, utilizando a fun��o HASHBYTES.
-- A fun��o HASHBYTES cria uma assinatura da senha em MD5;
-- A fun��o CONVERT est� convertendo o conteudo da fun��o HASHBYTES que � do tipo VarBinary para o tipo VarChar;
-- CONVERT(VARCHAR(32), HASHBYTES('MD5', @senha), 2)
CREATE PROCEDURE sch_bkc.CriaCadastroCliente(@nome VARCHAR(100), @email VARCHAR(100), @celular VARCHAR(20), @senha VARCHAR(34), @moeda VARCHAR(3))
AS
INSERT INTO sch_bkc.Cliente 
	VALUES 
	(@nome, @email,	@celular, CONVERT(VARCHAR(32), HASHBYTES('MD5', @senha), 2), @moeda)
RETURN
GO






