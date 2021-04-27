-- Seleciona o Banco de dados DB_BlockChain
USE DB_BlockChain
GO
-- PROCEDURE InsereItensCarteira tem a finalidade de inserir elementos na tabela ItemCarteira
-- É passado 3 parametros para a procedure:
-- 1° @CodigoCliente = Informar o CodigoCliente que contem o identificador do cliente informação contida na tabela Cleinte
-- uma vez passado o codigo do cliente para localizar o endereço da carteira que sera refistrado na tabela ItemCarteira.
-- 2° @CodigoMoeda = Iformar o codigo da moeda que o cliente esta adiquirindo, codigo da moeda pode ser obtido na tabela Moeda.
-- 3° @Quantidade = Informar a quantidade de daquele tipo de moeda que o cliente esta adiquirindo.
CREATE PROCEDURE sch_blockchain.InsereItensCarteira(@CodigoCliente INT, @CodigoMoeda VARCHAR(3), @Quantidade FLOAT)
AS	
	DECLARE @Endereco VARCHAR(32);	
	DECLARE @ItemAtual VARCHAR(3);		
	DECLARE @QuantidadeAtual FLOAT;
	
	-- Para facilitar é mais viavel informar o CodigoCliente do que o Endereco da Carteira.
	-- Aqui é informado o CodigoCliente para obter o Endereco da carteira do respectivo cliente.
	SELECT  @Endereco = Endereco FROM Carteira WHERE CodigoCliente = @CodigoCliente;
	
	-- Nesse ponto é feita uma query para pegar a quantidade atual do item e é passado para a váriavel @QuantidadeAtual.
	SELECT @QuantidadeAtual = Quantidade FROM ItemCarteira 
		WHERE Endereco = @Endereco AND CodigoMoeda = @ItemAtual; 

	-- Após ter obtido a quantidade atual do item é somada a quantidade atual com a quantidade desejada a ser inserida.
	-- Se o tipo do item JÁ EXISTIR na carteira do cliente será realizado o update no valor da quantidade.
	-- Se o tipo do item NÃO EXISTIR na carteira não sera feito nada.
	UPDATE ItemCarteira 
		SET Quantidade = (@QuantidadeAtual + @Quantidade) 
			WHERE Endereco = @Endereco AND CodigoMoeda = @ItemAtual; 

	-- No bloco acima foi tentado realizar o update da tupla se o item existente na carteira. 
	-- O comando @@ROWCOUNT verifica se o comando UPDATE deu certo ou falha. 
	-- Se o update deu certo é por que o item ja existia na carteira do cliente e foi possivel atualizar a quantidade;
	-- Se o update deu fala isso quer dizer que o item não existia na carteira do cliente.
	-- Como o item não existia na carteira agora sera inserido.
	IF (@@ROWCOUNT = 0)
	BEGIN
		INSERT INTO ItemCarteira VALUES (@Endereco, @CodigoMoeda, @Quantidade);		
	END
RETURN

-- Parametros da Procedure --> InsereItensCarteira CodigoCliente, CodigoMoeda, Quantidade 
-- Inserindo itens na carteira do cliente de CodigoCliente = 1 
EXEC InsereItensCarteira 1, 'BTC', 0.23
GO
EXEC InsereItensCarteira 1, 'ETH', 2.05
GO
EXEC InsereItensCarteira 1, 'LTC', 0.12
GO
-- Inserindo itens na carteira do cliente de CodigoCliente = 2
EXEC InsereItensCarteira 2, 'BTC', 0.2
GO
EXEC InsereItensCarteira 2, 'LTC', 0.87
GO
