-- Seleciosa o Banco de dados a ser usado
USE DB_BlockChain
GO
-- Será criado dois index do tipo nonclustered para acelera nas pesquiasas das tabelas Cliente e ParesMoedas
CREATE INDEX idx_Cliente ON sch_blockchain.Cliente(CodigoCliente)
GO
CREATE INDEX idx_ParesMoedas ON sch_blockchain.ParesMoedas(CodigoMoedaBase, CodigoMoedaCotacao)



SELECT corr.Nome AS Corretora, cart.Endereco AS Edr_Carteira, cli.Nome
	FROM sch_blockchain.Carteira cart 
		INNER JOIN sch_blockchain.Cliente cli ON cli.CodigoCliente = cart.CodigoCliente
		INNER JOIN sch_blockchain.Corretora corr ON corr.CodigoCorretora = cart.CodigoCorretora

