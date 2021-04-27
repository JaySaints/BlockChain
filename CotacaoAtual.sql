-- Seleciosa o Banco de dados a ser usado
USE DB_BlockChain
GO
-- Cria função para pegar a cotação atual da moeda desejada na tabela ParesMoedas. É passado dois parametros: 
-- 1° é passado o código da moeda base
-- 2° é passado o código da moeda principal do cliente
CREATE FUNCTION sch_blockchain.CotacaoAtual(@CodMoedaBase VARCHAR(3), @CodMoedaPrincipal VARCHAR(3))
RETURNS FLOAT
AS 
BEGIN
	DECLARE @ValorCotacao FLOAT;
	SELECT @ValorCotacao = Valor FROM ParesMoedas 
		WHERE CodigoMoedaBase = @CodMoedaBase 
			AND CodigoMoedaCotacao = @CodMoedaPrincipal
	RETURN @ValorCotacao
END

-- Chamada da função para obter o valor da moeda Ethereum
--SELECT dbo.CotacaoAtual('ETH', 'USD')

