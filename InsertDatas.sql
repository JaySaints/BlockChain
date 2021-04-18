-- Seleciona o banco de dados a ser usado
USE DB_BlockChain
GO

--Insere dados na TABELA MOEDA
INSERT INTO Moeda VALUES ('USD', 'Dolar')
GO
INSERT INTO Moeda VALUES ('BRL', 'Real')
GO
INSERT INTO Moeda VALUES ('ETH', 'Ethereum')
GO
INSERT INTO Moeda VALUES ('BTC', 'Bitcoin')
GO
INSERT INTO Moeda VALUES ('LTC', 'Laitcoin')
GO

-- Insere dados na TABELA CORRETORA
INSERT INTO Corretora VALUES ('BitMex')
GO
INSERT INTO Corretora VALUES ('Binance')
GO
INSERT INTO Corretora VALUES ('CoinField')
GO
INSERT INTO Corretora VALUES ('CoinBase')
GO

--Insere os PARES DE MOEDAS com o valor das cotações referente ao dia 18/04/21
INSERT INTO ParesMoedas (CodigoMoedaBase, CodigoMoedaCotacao, Valor) VALUES ('USD', 'BRL', 5.59)
GO
INSERT INTO ParesMoedas (CodigoMoedaBase, CodigoMoedaCotacao, Valor) VALUES ('BTC', 'USD', 54015.11)
GO
INSERT INTO ParesMoedas (CodigoMoedaBase, CodigoMoedaCotacao, Valor) VALUES ('LTC', 'USD', 251.73)
GO
INSERT INTO ParesMoedas (CodigoMoedaBase, CodigoMoedaCotacao, Valor) VALUES ('ETH', 'USD', 2063.5)
GO


