Autor: Pablo Juliano Santos --> @jaysaints
# BlockChain
Banco de dados SQL Server 2008


Objetivos:
- Criar o BANCO DE DADOS. --> OK
- Criar um ESQUEMA para conter as tabelas do banco de dados.
- Criação das TABELAS contidas no diagrama relacional. --> OK
- Criação dos ÍNDICES para as colunas que serão mais consultadas.
- INSERIR dados consistentes (popular) nas tabelas recém-criadas. --> OK
- LISTAR os dados (comando SELECT) inseridos nas tabelas recém-criadas.
- Criar consulta dos dados como VISÕES e FUNÇÕES.
- Listar saldo atual por usuário cadastrado, mostrando a descrição da moeda e o valor da carteira.
- Criação de outro script para desfazer todas as ações de criação anteriores (rollback). Atenção 
para a consistência dos dados.

### LISTA DE PROCEDURES CRIADAS
- CriaCarteira (@corretora INT, @cliente INT)
- CriaCadastroCliente(@nome VARCHAR(100), @email VARCHAR(100), @celular VARCHAR(20), @senha VARCHAR(34), @moeda VARCHAR(3))
- InsereItensCarteira(@CodigoCliente INT, @CodigoMoeda VARCHAR(3), @Quantidade FLOAT)
