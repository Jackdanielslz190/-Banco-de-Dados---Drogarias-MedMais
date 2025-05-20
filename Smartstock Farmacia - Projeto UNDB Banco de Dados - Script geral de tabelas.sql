-- TABELA: FILIAL
CREATE TABLE Filial (
    ID_Filial INT PRIMARY KEY AUTO_INCREMENT,
    NomeFilial VARCHAR(100) NOT NULL,
    Endereco VARCHAR(150),
    Telefone VARCHAR(20)
);

-- TABELA: FORNECEDOR
CREATE TABLE Fornecedor (
    ID_Fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CNPJ VARCHAR(18) UNIQUE NOT NULL,
    Telefone VARCHAR(20)
);

-- TABELA: PRODUTO
CREATE TABLE Produto (
    ID_Produto INT PRIMARY KEY AUTO_INCREMENT,
    NomeProduto VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Preco DECIMAL(10,2) CHECK (Preco > 0),
    ID_Fornecedor INT,
    FOREIGN KEY (ID_Fornecedor) REFERENCES Fornecedor(ID_Fornecedor)
);

-- TABELA: ESTOQUE (RELACIONAMENTO PRODUTO/FILIAL)
CREATE TABLE Estoque (
    ID_Filial INT,
    ID_Produto INT,
    Quantidade INT CHECK (Quantidade >= 0),
    DataAtualizacao DATE,
    PRIMARY KEY (ID_Filial, ID_Produto),
    FOREIGN KEY (ID_Filial) REFERENCES Filial(ID_Filial),
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto)
);

-- TABELA: CLIENTE
CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) UNIQUE NOT NULL,
    Telefone VARCHAR(20)
);

-- TABELA: VENDA
CREATE TABLE Venda (
    ID_Venda INT PRIMARY KEY AUTO_INCREMENT,
    ID_Cliente INT,
    ID_Filial INT,
    DataVenda DATE,
    ValorTotal DECIMAL(10,2),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_Filial) REFERENCES Filial(ID_Filial)
);

-- TABELA: ITEMVENDA
CREATE TABLE ItemVenda (
    ID_Venda INT,
    ID_Produto INT,
    Quantidade INT,
    PrecoUnitario DECIMAL(10,2),
    PRIMARY KEY (ID_Venda, ID_Produto),
    FOREIGN KEY (ID_Venda) REFERENCES Venda(ID_Venda),
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto)
);

-- TABELA: PEDIDO DE REPOSIÇÃO
CREATE TABLE PedidoReposicao (
    ID_Pedido INT PRIMARY KEY AUTO_INCREMENT,
    ID_Filial INT,
    ID_Fornecedor INT,
    DataPedido DATE,
    StatusPedido VARCHAR(30),
    FOREIGN KEY (ID_Filial) REFERENCES Filial(ID_Filial),
    FOREIGN KEY (ID_Fornecedor) REFERENCES Fornecedor(ID_Fornecedor)
);

-- TABELA: ITEM DO PEDIDO DE REPOSIÇÃO
CREATE TABLE ItemPedido (
    ID_Pedido INT,
    ID_Produto INT,
    Quantidade INT,
    PRIMARY KEY (ID_Pedido, ID_Produto),
    FOREIGN KEY (ID_Pedido) REFERENCES PedidoReposicao(ID_Pedido),
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto)
);