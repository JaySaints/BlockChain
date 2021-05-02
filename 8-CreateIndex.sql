-- Seleciosa o Banco de dados a ser usado
USE DB_BlockChain
GO
-- Será criado dois index do tipo nonclustered para acelera nas pesquiasas das tabelas Cliente e ParesMoedas
CREATE INDEX idx_Cliente ON sch_bkc.Cliente(CodigoCliente)
GO
CREATE INDEX idx_ParesMoedas ON sch_bkc.ParesMoedas(CodigoMoedaBase, CodigoMoedaCotacao)



SELECT corr.Nome AS Corretora, cart.Endereco AS Edr_Carteira, cli.Nome
	FROM sch_bkc.Carteira cart 
		INNER JOIN sch_bkc.Cliente cli ON cli.CodigoCliente = cart.CodigoCliente
		INNER JOIN sch_bkc.Corretora corr ON corr.CodigoCorretora = cart.CodigoCorretora

