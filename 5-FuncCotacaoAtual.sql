-- Seleciosa o Banco de dados a ser usado
USE DB_BlockChain
GO
-- Cria fun��o para pegar a cota��o atual da moeda desejada na tabela ParesMoedas. � passado dois parametros: 
-- 1� � passado o c�digo da moeda base
-- 2� � passado o c�digo da moeda principal do cliente
CREATE FUNCTION sch_blockchain.CotacaoAtual(@CodMoedaBase VARCHAR(3), @CodMoedaPrincipal VARCHAR(3))
RETURNS FLOAT
AS 
BEGIN
	DECLARE @ValorCotacao FLOAT;
	SELECT @ValorCotacao = Valor FROM sch_blockchain.ParesMoedas 
		WHERE CodigoMoedaBase = @CodMoedaBase 
			AND CodigoMoedaCotacao = @CodMoedaPrincipal
	RETURN @ValorCotacao
END

-- Chamada da fun��o para obter o valor da moeda Ethereum
--SELECT dbo.CotacaoAtual('ETH', 'USD')

