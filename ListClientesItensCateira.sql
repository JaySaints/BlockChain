-- Seleciosa o Banco de dados a ser usado
USE DB_BlockChain
GO
-- View para mostrar o Codigo do Cliente, Nome dos Clientes, Codigo das moesdas que o cliente possui
-- quantidade de moedas e o valor (valor= quantidade da moeda vezes a cotação daquela respctiva moeda).
CREATE VIEW ListaItensCliente AS
SELECT Cliente.CodigoCliente , Cliente.Nome, ItemCarteira.CodigoMoeda, ItemCarteira.Quantidade, 
	(dbo.CotacaoAtual(ItemCarteira.CodigoMoeda, Cliente.MoedaPrincipal) * ItemCarteira.Quantidade) AS Valor  
	FROM Cliente
	INNER JOIN
		Carteira ON Cliente.CodigoCliente = Carteira.CodigoCliente 
	INNER JOIN
		ItemCarteira ON ItemCarteira.Endereco = Carteira.Endereco	
	
-- Chama a view criada e ordena a saida para agrupar os intens de cada cliente
SELECT * FROM ListaItensCliente ORDER BY(CodigoCliente)