-- Seleciosa o Banco de dados a ser usado
USE DB_BlockChain
GO
-- Cria um novo schema para as tables, functions, views e procedures que fazem parte do sistema BlockChain
-- Está sendo criado um schema sem um usuário especifico, então o dono deste schema é o próprio usuário que a criar
CREATE SCHEMA sch_blockchain
GO
-- Cria trabela CORRETORA
CREATE TABLE sch_blockchain.Corretora
(
	CodigoCorretora int NOT NULL IDENTITY(1,1),
	Nome varchar(100),
	PRIMARY KEY (CodigoCorretora)
)
GO
-- Cria tabela MOEDA
CREATE TABLE sch_blockchain.Moeda
(
	CodigoMoeda varchar(3) NOT NULL,
	Nome varchar(100),
	PRIMARY KEY (CodigoMoeda)
)
GO
-- Cria tabela CLIENTE. Recebe uma chave estrangeira da tabela Moeda, alocando-a no atributo MoedaPrincipal.
CREATE TABLE sch_blockchain.Cliente
(
	CodigoCliente int NOT NULL IDENTITY(1,1),
	Nome varchar(100),
	Email varchar(100),
	Celular varchar(20),
	PassHash varchar(100),
	MoedaPrincipal varchar(3),
	PRIMARY KEY (CodigoCliente),
	FOREIGN KEY (MoedaPrincipal) REFERENCES sch_blockchain.Moeda (CodigoMoeda)
)
GO
-- Cria tabela CARTEIRA. Recebe uma chave estrangeira da tabela Corretora alocando no atributo CodigoCorretora e
-- uma chave da tabela Cliente e alocando-a no atributo CodigoCLiente.
CREATE TABLE sch_blockchain.Carteira
(
	Endereco varchar(100) NOT NULL,
	CodigoCorretora int NOT NULL,
	CodigoCliente int NOT NULL,
	PRIMARY KEY (Endereco),
	FOREIGN KEY (CodigoCorretora) REFERENCES sch_blockchain.Corretora (CodigoCorretora),
	FOREIGN KEY (CodigoCliente) REFERENCES sch_blockchain.Cliente (CodigoCliente)
)
GO
-- Cria tabela ITEM CARTEIRA. Recebe uma chave estrangeira da tabela carteira alocando no atributo Endereço e 
-- uma chave da tabela Moeda alocando no atributo CodigoMoeda
CREATE TABLE sch_blockchain.ItemCarteira
(
	CodigoItemCarteira int NOT NULL IDENTITY(1,1),
	Endereco varchar(100) NOT NULL,
	CodigoMoeda varchar(3) NOT NULL,
	Quantidade float,
	PRIMARY KEY (CodigoItemCarteira),
	FOREIGN KEY (Endereco) REFERENCES sch_blockchain.Carteira (Endereco),
	FOREIGN KEY (CodigoMoeda) REFERENCES sch_blockchain.Moeda (CodigoMoeda)
)
GO
-- Cria tabela PARES MOEDAS. Recebe duas chaves estrangeiras da tabela Moeda, 
-- um sendo alocada no atributo CodigoMoedaBase e a outra no atributo CodigoMoedaCotacao
CREATE TABLE sch_blockchain.ParesMoedas
(
	CodigoMoedaBase varchar(3) NOT NULL,
	CodigoMoedaCotacao varchar(3) NOT NULL,
	Valor float NOT NULL,
	PRIMARY KEY (Valor),
	FOREIGN KEY (CodigoMoedaBase) REFERENCES sch_blockchain.Moeda (CodigoMoeda),
	FOREIGN KEY (CodigoMoedaCotacao) REFERENCES sch_blockchain.Moeda (CodigoMoeda)
)

