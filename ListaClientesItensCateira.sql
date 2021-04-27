-- Seleciosa o Banco de dados a ser usado
USE DB_BlockChain
GO
-- View para mostrar o Codigo do Cliente, Nome dos Clientes, Codigo das moesdas que o cliente possui
-- quantidade de moedas e o valor (valor= quantidade da moeda vezes a cotação daquela respctiva moeda).
CREATE VIEW sch_blockchain.ListaItensCliente 
AS
SELECT Cliente.CodigoCliente , Cliente.Nome, ItemCarteira.CodigoMoeda, ItemCarteira.Quantidade, 
	(dbo.CotacaoAtual(ItemCarteira.CodigoMoeda, Cliente.MoedaPrincipal) * ItemCarteira.Quantidade) AS Valor  
	FROM Cliente
	INNER JOIN
		Carteira ON Cliente.CodigoCliente = Carteira.CodigoCliente 
	INNER JOIN
		ItemCarteira ON ItemCarteira.Endereco = Carteira.Endereco	
	
-- Chama um elemento da view, passando como parametro de seleção o codigo do cliente
--SELECT * FROM ListaItensCliente WHERE CodigoCliente = 1

-- Chama todos os elementos da tabela e ordena pelo Codigo do cliente
--SELECT * FROM ListaItensCliente ORDER BY(CodigoCliente)
