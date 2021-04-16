-- Seleciosa o Banco de dados a ser usado
USE DB_BlockChain
GO
-- Cria trabela CORRETORA
CREATE TABLE Corretora
(
	CodigoCorretora int NOT NULL IDENTITY(1,1),
	Nome varchar(100),
	PRIMARY KEY (CodigoCorretora)
)
GO
-- Cria tabela MOEDA
CREATE TABLE Moeda
(
	CodigoMoeda varchar(3) NOT NULL,
	Nome varchar(100),
	PRIMARY KEY (CodigoMoeda)
)
GO
-- Cria tabela CLIENTE. Recebe uma chave estrangeira da tabela Moeda, alocando-a no atributo MoedaPrincipal.
CREATE TABLE Cliente
(
	CodigoCliente int NOT NULL IDENTITY(1,1),
	Nome varchar(100),
	Email varchar(100),
	Celular varchar(20),
	PassHash varchar(100),
	MoedaPrincipal varchar(3),
	PRIMARY KEY (CodigoCliente),
	FOREIGN KEY (MoedaPrincipal) REFERENCES Moeda (CodigoMoeda)
)
GO
-- Cria tabela CARTEIRA. Recebe uma chave estrangeira da tabela Corretora alocando no atributo CodigoCorretora e
-- uma chave da tabela Cliente e alocando-a no atributo CodigoCLiente.
CREATE TABLE Carteira
(
	Endereco varchar(100) NOT NULL,
	CodigoCorretora int NOT NULL,
	CodigoCliente int NOT NULL,
	PRIMARY KEY (Endereco),
	FOREIGN KEY (CodigoCorretora) REFERENCES Corretora (CodigoCorretora),
	FOREIGN KEY (CodigoCliente) REFERENCES Cliente (CodigoCliente)
)
GO
-- Cria tabela ITEM CARTEIRA. Recebe uma chave estrangeira da tabela carteira alocando no atributo Endereço e 
-- uma chave da tabela Moeda alocando no atributo CodigoMoeda
CREATE TABLE ItemCarteira
(
	CodigoItemCarteira int NOT NULL IDENTITY(1,1),
	Endereco varchar(100) NOT NULL,
	CodigoMoeda varchar(3) NOT NULL,
	Quantidade decimal,
	PRIMARY KEY (CodigoItemCarteira),
	FOREIGN KEY (Endereco) REFERENCES Carteira (Endereco),
	FOREIGN KEY (CodigoMoeda) REFERENCES Moeda (CodigoMoeda)
)
GO
-- Cria tabela PARES MOEDAS. Recebe duas chaves estrangeiras da tabela Moeda, 
-- um sendo alocada no atributo CodigoMoedaBase e a outra no atributo CodigoMoedaCotacao
CREATE TABLE ParesMoedas
(
	CodigoMoedaBase varchar(3) NOT NULL,
	CodigoMoedaCotacao varchar(3) NOT NULL,
	Valor decimal NOT NULL,
	PRIMARY KEY (Valor),
	FOREIGN KEY (CodigoMoedaBase) REFERENCES Moeda (CodigoMoeda),
	FOREIGN KEY (CodigoMoedaCotacao) REFERENCES Moeda (CodigoMoeda)
)