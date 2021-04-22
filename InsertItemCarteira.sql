-- Seleciona o Banco de dados DB_BlockChain
USE DB_BlockChain
GO
-- PROCEDURE InsereItensCarteira tem a finalidade de inserir elementos na tabela ItemCarteira
-- É passado 3 parametros para a procedure:
-- 1° @codCliente = Informar o CodigoCliente que contem o identificador do cliente informação contida na tabela Cleinte
-- uma vez passado o codigo do cliente para localizar o endereço da carteira que sera refistrado na tabela ItemCarteira.
-- 2° @codMoeda = Iformar o codigo da moeda que o cliente esta adiquirindo, codigo da moeda pode ser obtido na tabela Moeda.
-- 3° @quantidade = Informar a quantidade de daquele tipo de moeda que o cliente esta adiquirindo.
CREATE PROCEDURE InsereItensCarteira(@CodigoCliente INT, @CodigoMoeda VARCHAR(3), @Quantidade FLOAT)
AS	
	DECLARE @Endereco VARCHAR(32);	
	DECLARE @ItemAtual VARCHAR(3);	
	DECLARE @Flag INT;
	DECLARE @QuantidadeAtual FLOAT;
	-- Flag de controle para condição de nova inserção ou update na tabela.
	SET @Flag = 0;

	-- Para facilitar é mais viavel informar o CodigoCliente do que o Endereco da Carteira.
	-- Aqui é informado o CodigoCliente para obter o Endereco da carteira do respectivo cliente.
	SELECT  @Endereco = Endereco FROM Carteira WHERE CodigoCliente = @CodigoCliente;
	
	-- Aqui é criado um cursor para que seja posivel navegar apenas nos itens da carteira do respectivo cliente,
	-- o cursor irá seta apenas os itens que der match com a query
	DECLARE CursorItens CURSOR FOR 
		SELECT CodigoMoeda FROM ItemCarteira WHERE Endereco = @Endereco;
	
	-- Abre o cursor
	OPEN CursorItens;

	-- Aqui é passado um dos elementos do cursor para a variavel @ItemAtual
	FETCH NEXT FROM CursorItens INTO @ItemAtual;

	-- Laço de repetição para verificar todos os itens no cursor
	WHILE @@FETCH_STATUS = 0 
		BEGIN	
			-- Condição para verificar se o item desejado a se inserido na carteira ja existe na carteira do respectivo cliente.
			-- Se o item ja exitir não podera ser criado um novo item do mesmo tipo.
			-- Se o item ja exitir deverá pegar a quantidade atual do item e somar com a nova quantidade a ser inserida e atualizar o valor na tabela ItemCarteira.
			IF @ItemAtual = @CodigoMoeda			
			BEGIN				
				SELECT @QuantidadeAtual = Quantidade FROM ItemCarteira WHERE Endereco = @Endereco AND CodigoMoeda = @ItemAtual; 
				UPDATE ItemCarteira SET Quantidade = (@QuantidadeAtual + @Quantidade) WHERE Endereco = @Endereco AND CodigoMoeda = @ItemAtual; 
				--PRINT('Item Existente!!!')
				SET @flag = 1;
			END
			FETCH NEXT FROM CursorItens INTO @ItemAtual;
		END
	IF @Flag = 0
	BEGIN
		INSERT INTO ItemCarteira VALUES (@Endereco, @CodigoMoeda, @Quantidade);
		--PRINT('Item Adicionado a Cartira!!!');
	END
	-- Fecha o cursor CursorItens;
	CLOSE CursorItens;	
	-- Desaloca o CursoItens da memória;
	DEALLOCATE CursorItens;	
RETURN

-- CodCliente, CodMoeda, Quantidade 
EXEC InsereItensCarteira 1, 'BTC', 0.23
GO
EXEC InsereItensCarteira 1, 'ETH', 2.05
GO
EXEC InsereItensCarteira 1, 'LTC', 0.12
GO
EXEC InsereItensCarteira 2, 'BTC', 0.2
GO
EXEC InsereItensCarteira 2, 'LTC', 0.87
GO