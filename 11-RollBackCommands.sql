-- SELECIONA O BANCO DE DADOS A SER USADO
USE DB_BlockChain
GO

-------DROPA OS INDEX-------
DROP INDEX sch_blockchain.Cliente.idx_Cliente
DROP INDEX sch_blockchain.ParesMoedas.idx_ParesMoedas

-------DROPA TODAS AS TABELAS DO BANCO DE DADOS DB_BlockChain-------
-- EXCLUI A TABELA PARES MOEDAS
DROP TABLE sch_blockchain.ParesMoedas
GO
-- EXCLUI A TABELA ITEM CARTEIRA
DROP TABLE sch_blockchain.ItemCarteira
GO
-- EXCLUI A TABELA CATEIRA
DROP TABLE sch_blockchain.Carteira
GO
-- EXCLUI A TABELA CLIENTE
DROP TABLE sch_blockchain.Cliente
GO
-- EXCLUI A TABELA MOEDA
DROP TABLE sch_blockchain.Moeda
GO
-- EXCLUI A TABELA CORRETORA
DROP TABLE sch_blockchain.Corretora
GO

-------DROPA AS PROCEDURES-------
-- DROPA A PROCEDURE CRIA CARTEIRA
DROP PROCEDURE sch_blockchain.CriaCarteira
GO
-- DROPA A PROCEDURE CRIA CADASTRO CLIENTE
DROP PROCEDURE sch_blockchain.CriaCadastroCliente
GO
-- DROPA A PROCEDURE INSERE INTENS NA CARTEIRA
DROP PROCEDURE sch_blockchain.InsereItensCarteira
GO

-------DROPA AS VIEWS-------
-- DROA A VIEW QUE MOSTRA:
-- NOME CLIENTE, ITENS MOEDAS, QUANTIDADE DE MOEDAS POR TIPO E O VALOR TOTAL DE CADA MOEDA
DROP VIEW sch_blockchain.ListaItensCliente
GO

-------DROPA AS FUN??ES-------
-- DROPA A FUN??O QUE VERIFICA A COTA?AO DA MOEDA
DROP FUNCTION sch_blockchain.CotacaoAtual

-------DROPA SCHEMA-------
-- DROPA O SCHEMA QUE COTINHA AS TABELAS DO SISTEMA BLOCK CHAIN
DROP SCHEMA sch_blockchain
GO

-------DROPA O BANCO DE DADOS-------
-- DROPA O BANCO DE DADOS DB_BlockChain
-- DROP DATABASE DB_BlockChain

