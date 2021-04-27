-- Seleciona o banco de dados a ser usado
USE DB_BlockChain
GO

--Insere dados na TABELA MOEDA
INSERT INTO sch_blockchain.Moeda VALUES ('USD', 'Dolar')
GO
INSERT INTO sch_blockchain.Moeda VALUES ('BRL', 'Real')
GO
INSERT INTO sch_blockchain.Moeda VALUES ('ETH', 'Ethereum')
GO
INSERT INTO sch_blockchain.Moeda VALUES ('BTC', 'Bitcoin')
GO
INSERT INTO sch_blockchain.Moeda VALUES ('LTC', 'Laitcoin')
GO

-- Insere dados na TABELA CORRETORA
INSERT INTO sch_blockchain.Corretora VALUES ('BitMex')
GO
INSERT INTO sch_blockchain.Corretora VALUES ('Binance')
GO
INSERT INTO sch_blockchain.Corretora VALUES ('CoinField')
GO
INSERT INTO sch_blockchain.Corretora VALUES ('CoinBase')
GO

--Insere os PARES DE MOEDAS com o valor das cota��es referente ao dia 18/04/21
INSERT INTO sch_blockchain.ParesMoedas (CodigoMoedaBase, CodigoMoedaCotacao, Valor) VALUES ('USD', 'BRL', 5.59)
GO
INSERT INTO sch_blockchain.ParesMoedas (CodigoMoedaBase, CodigoMoedaCotacao, Valor) VALUES ('BTC', 'USD', 54015.11)
GO
INSERT INTO sch_blockchain.ParesMoedas (CodigoMoedaBase, CodigoMoedaCotacao, Valor) VALUES ('LTC', 'USD', 251.73)
GO
INSERT INTO sch_blockchain.ParesMoedas (CodigoMoedaBase, CodigoMoedaCotacao, Valor) VALUES ('ETH', 'USD', 2063.5)
GO

-- Insere informa��es de Clientes na tabela CLIENTE
-- Chama a PROCEDURE CriaCadastroCliente e passa os valores para inser��o dos elementos na tabela Cliente;
EXEC sch_blockchain.CriaCadastroCliente 'JULIANA PAES', 'JUJU85@HOTMAIL.COM', '41 98756-2399', 'paz85', 'USD'
GO
EXEC sch_blockchain.CriaCadastroCliente 'PABLO JOTA SANTOS', 'JOTA@JOTAMAIL.COM.BR', '22 99001-2235', 'abc123', 'USD'
GO
EXEC sch_blockchain.CriaCadastroCliente 'CARLOS LUCAS MACEDO', 'M.MACEDO@HOTMAIL.COM', '41 95321-5552', 'kk22', 'USD'
GO
EXEC sch_blockchain.CriaCadastroCliente 'LARISSA MACEDO MACHADO', 'LARISSA.M@GMAIL.COM', '55 98876-1234', '1234', 'USD'
GO
EXEC sch_blockchain.CriaCadastroCliente 'ECLEIDIRA MARIA FONSECA PAES', 'DIRA_PIRES@HOTMAIL.COM.BR', '42 99871-5641', 'xyz', 'USD'
GO
EXEC sch_blockchain.CriaCadastroCliente 'FERNANDA MONTENEGRO', 'FER.MONTENEGRO@OUTLOOK.COM', '21 988766-3256', 'globo', 'USD' 
GO
EXEC sch_blockchain.CriaCadastroCliente 'JULIANA PAES', 'JUJU85@HOTMAIL.COM', '41 98756-2399', 'paz85', 'USD'
GO

-- Insere dados na tabela CORRETORA
-- Chama a PROCEDURE CriaCarteira e passa dois parametros. 
-- 1� parametro � o CodigoCorretora que se encontra na tabela Corretora
-- 2� parametro � o CodigoCliente que se encontra na tabela Cliente
EXEC sch_blockchain.CriaCarteira 2, 1
GO
EXEC sch_blockchain.CriaCarteira 2, 5
GO
EXEC sch_blockchain.CriaCarteira 4, 2
GO
EXEC sch_blockchain.CriaCarteira 1, 6
GO
EXEC sch_blockchain.CriaCarteira 4, 7
GO

-- Insere dados na tabela ITEM CARTEIRA
-- Parametros CodCliente, CodMoeda, Quantidade 
EXEC sch_blockchain.InsereItensCarteira 1, 'BTC', 0.23
GO
EXEC sch_blockchain.InsereItensCarteira 1, 'ETH', 2.05
GO
EXEC sch_blockchain.InsereItensCarteira 1, 'LTC', 0.12
GO
EXEC sch_blockchain.InsereItensCarteira 2, 'BTC', 0.2
GO
EXEC sch_blockchain.InsereItensCarteira 2, 'LTC', 0.87
GO
