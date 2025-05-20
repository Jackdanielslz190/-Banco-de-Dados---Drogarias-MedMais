SELECT * FROM Fornecedor;

INSERT INTO Produto (Nome, Preco, ID_Fornecedor)
VALUES ('Produto X', 29.90, 1);

SELECT * FROM Filial;
SELECT * FROM Produto;

INSERT INTO Estoque (ID_Filial, ID_Produto, Quantidade)
VALUES (1, 1, 100);
