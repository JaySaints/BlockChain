-- PROCEDURE CriaCadastroCliente --> Tem a Finalidade de facilita a inclus�o de um novo elemento na tabela cliente. Sendo que na cria��o do elemento
-- o campo PassHash � preenchido com o Hash da senha, utilizando a fun��o HASHBYTES.
-- A fun��o HASHBYTES cria uma assinatura da senha em MD5;
-- A fun��o CONVERT est� convertendo o conteudo da fun��o HASHBYTES que � do tipo VarBinary para o tipo VarChar;
-- CONVERT(VARCHAR(32), HASHBYTES('MD5', @senha), 2)
CREATE PROCEDURE CriaCadastroCliente(@nome VARCHAR(100), @email VARCHAR(100), @celular VARCHAR(20), @senha VARCHAR(34), @moeda VARCHAR(3))
AS
INSERT INTO Cliente 
	VALUES 
	(@nome, @email,	@celular, CONVERT(VARCHAR(32), HASHBYTES('MD5', @senha), 2), @moeda)
RETURN
GO

-- Chama a PROCEDURE CriaCadastroCliente e passa os valores para inser��o dos elementos na tabela Cliente;
EXEC CriaCadastroCliente 'JULIANA PAES', 'JUJU85@HOTMAIL.COM', '41 98756-2399', 'paz85', 'USD'
GO
EXEC CriaCadastroCliente 'PABLO JOTA SANTOS', 'JOTA@JOTAMAIL.COM.BR', '22 99001-2235', 'abc123', 'USD'
GO
EXEC CriaCadastroCliente 'CARLOS LUCAS MACEDO', 'M.MACEDO@HOTMAIL.COM', '41 95321-5552', 'kk22', 'USD'
GO
EXEC CriaCadastroCliente 'LARISSA MACEDO MACHADO', 'LARISSA.M@GMAIL.COM', '55 98876-1234', '1234', 'USD'
GO
EXEC CriaCadastroCliente 'ECLEIDIRA MARIA FONSECA PAES', 'DIRA_PIRES@HOTMAIL.COM.BR', '42 99871-5641', 'xyz', 'USD'
GO
EXEC CriaCadastroCliente 'FERNANDA MONTENEGRO', 'FER.MONTENEGRO@OUTLOOK.COM', '21 988766-3256', 'globo', 'USD' 
GO

