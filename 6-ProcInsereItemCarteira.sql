-- Seleciona o Banco de dados DB_BlockChain
USE DB_BlockChain
GO
-- PROCEDURE InsereItensCarteira tem a finalidade de inserir elementos na tabela ItemCarteira
-- � passado 3 parametros para a procedure:
-- 1� @codCliente = Informar o CodigoCliente que contem o identificador do cliente informa��o contida na tabela Cleinte
-- uma vez passado o codigo do cliente para localizar o endere�o da carteira que sera refistrado na tabela ItemCarteira.
-- 2� @codMoeda = Iformar o codigo da moeda que o cliente esta adiquirindo, codigo da moeda pode ser obtido na tabela Moeda.
-- 3� @quantidade = Informar a quantidade de daquele tipo de moeda que o cliente esta adiquirindo.
CREATE PROCEDURE sch_blockchain.InsereItensCarteira(@CodigoCliente INT, @CodigoMoeda VARCHAR(3), @Quantidade FLOAT)
AS	
	DECLARE @Endereco VARCHAR(32);	
	DECLARE @ItemAtual VARCHAR(3);		
	DECLARE @QuantidadeAtual FLOAT;
	
	-- Para facilitar � mais viavel informar o CodigoCliente do que o Endereco da Carteira.
	-- Aqui � informado o CodigoCliente para obter o Endereco da carteira do respectivo cliente.
	SELECT  @Endereco = Endereco FROM sch_blockchain.Carteira 
		WHERE CodigoCliente = @CodigoCliente
	
	
	-- Nesse ponto � feita uma query para pegar a quantidade atual do item e � passado para a v�riavel @QuantidadeAtual.
	SELECT @QuantidadeAtual = Quantidade FROM sch_blockchain.ItemCarteira 
		WHERE Endereco = @Endereco AND CodigoMoeda = @ItemAtual
	

	-- Ap�s ter obtido a quantidade atual do item � somada a quantidade atual com a quantidade desejada a ser inserida.
	-- Se o tipo do item J� EXISTIR na carteira do cliente ser� realizado o update no valor da quantidade.
	-- Se o tipo do item N�O EXISTIR na carteira n�o sera feito nada.
	UPDATE sch_blockchain.ItemCarteira 
		SET Quantidade = (@QuantidadeAtual + @Quantidade) 
			WHERE Endereco = @Endereco AND CodigoMoeda = @ItemAtual
		

	-- No bloco acima foi tentado realizar o update da tupla se o item existente na carteira. 
	-- O comando @@ROWCOUNT verifica se o comando UPDATE deu certo ou falha. 
	-- Se o update deu certo � por que o item ja existia na carteira do cliente e foi possivel atualizar a quantidade;
	-- Se o update deu fala isso quer dizer que o item n�o existia na carteira do cliente.
	-- Como o item n�o existia na carteira agora sera inserido.
	IF (@@ROWCOUNT = 0)
	BEGIN
		INSERT INTO sch_blockchain.ItemCarteira VALUES (@Endereco, @CodigoMoeda, @Quantidade)		
	END
RETURN


