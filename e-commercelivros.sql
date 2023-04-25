create database livros;
use livros;

CREATE TABLE `autores` (
  `PK_Autor` int(11) NOT NULL,
  `Nome` varchar(200) NOT NULL,
  `Sobrenome` varchar(200) NOT NULL,
  `Genero` enum('H','M','O') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `autores` (`PK_Autor`, `Nome`, `Sobrenome`, `Genero`) VALUES
(1, 'Ana', 'Claudia', 'M'),
(2, 'João', 'Nunes', 'H'),
(3, 'Celia', 'Tavares', 'M'),
(4, 'Eduardo', 'Santos', 'H'),
(5, 'Hermes', 'Macedo', 'H'),
(6, 'Geraldo', 'Francisco', 'H'),
(7, 'Leda', 'Silva', 'M'),
(8, 'Marco', 'Alcantara', 'H'),
(9, 'Clara', 'Mafra', 'M');


CREATE TABLE `cadastros` (
  `PK_Cadastro` int(11) NOT NULL,
  `FK_Cliente` int(11) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Data_Cadastro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `cadastros` (`PK_Cadastro`, `FK_Cliente`, `Email`, `Data_Cadastro`) VALUES
(1, 1, 'jojo@gmail.com', '2000-01-20'),
(2, 2, 'ba1997fs@gmail.com', '2001-05-23'),
(3, 3, 'mca199@gmail.com', '1999-06-23'),
(4, 4, 'fran2525@hotmail.com', '2011-05-01'),
(5, 5, 'Andrecarneiro111@bol.com', '2001-03-14'),
(6, 6, 'rick09@bol.com', '1999-02-03'),
(7, 7, 'fernandesangelo@outlook.com', '2012-03-12'),
(8, 8, 'mag101@gmail.com', '2000-05-23');

CREATE TABLE `clientes` (
  `PK_Cliente` int(11) NOT NULL,
  `Nome` varchar(30) DEFAULT NULL,
  `Sobrenome` varchar(50) DEFAULT NULL,
  `Data_Nasc` date DEFAULT NULL,
  `CPF` varchar(11) DEFAULT NULL,
  `Gênero` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `clientes` (`PK_Cliente`, `Nome`, `Sobrenome`, `Data_Nasc`, `CPF`, `Gênero`) VALUES
(1, 'João', 'Ferreira', '1986-06-26', '13606636930', 'M'),
(2, 'Bruna', 'Almeida', '1997-02-16', '14512236530', 'F'),
(3, 'Maria', 'Carvalho Pinto', '1999-01-03', '14526636790', 'F'),
(4, 'Francisca', 'Souza Ferreira', '1989-07-28', '69866253690', 'F'),
(5, 'André', 'Campos', '1999-05-06', '25798536940', 'M'),
(6, 'Ricardo', 'Souza Rodrigues', '1969-05-17', '12325869543', 'M'),
(7, 'Angelo', 'Fernandes', '2002-09-15', '14815236830', 'M'),
(8, 'Margarida', 'Favero', '1999-05-13', '12575843019', 'F');


CREATE TABLE `editoras` (
  `PK_Editora` int(11) NOT NULL,
  `Nome` varchar(200) NOT NULL,
  `UF` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `editoras` (`PK_Editora`, `Nome`, `UF`) VALUES
(1, 'Atlas', 'RJ'),
(2, 'Addison', 'SP'),
(3, 'Beta', 'RJ'),
(4, 'Bubba', 'MG'),
(5, 'Insignia', 'ES'),
(6, 'Larson', 'RS'),
(7, 'Continental', 'RS');

CREATE TABLE `itens_pedido` (
  `PK_Item` int(11) NOT NULL,
  `FK_Livro` int(11) DEFAULT NULL,
  `FK_Pedido` int(11) DEFAULT NULL,
  `Quant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `livros` (
  `PK_Livro` int(11) NOT NULL,
  `FK_Autor` int(11) NOT NULL,
  `FK_Editora` int(11) NOT NULL,
  `Nome` varchar(500) NOT NULL,
  `Num_Pag` int(4) NOT NULL,
  `Valor` float NOT NULL,
  `Ano_Publi` year(4) NOT NULL,
  `Estoque` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `livros` (`PK_Livro`, `FK_Autor`, `FK_Editora`, `Nome`, `Num_Pag`, `Valor`, `Ano_Publi`, `Estoque`) VALUES
(1, 1, 1, 'Cavaleiro Real', 465, 49.9, 2009, 5),
(2, 2, 2, 'SQL para Leigos', 450, 98, 2018, 200),
(3, 3, 1, 'Receitas Caseiras', 210, 45, 2008, 130),
(4, 4, 3, 'Pessoas Efetivas', 390, 78.99, 2018, 300),
(5, 4, 3, 'Habitos Saúdaveis', 630, 150.98, 2019, 63),
(6, 5, 4, 'A Casa Marrom', 250, 60, 2016, 9),
(7, 6, 5, 'Estacio Querido', 310, 100, 2015, 132),
(8, 7, 5, 'Pra Sempre amigas', 510, 78.98, 2011, 126),
(9, 8, 6, 'Copas Inesqueciveis', 200, 130.98, 2018, 115),
(10, 9, 7, 'O poder da mente', 120, 56.58, 2017, 15);

CREATE TABLE `pagamentos` (
  `PK_Pag` int(11) NOT NULL,
  `FK_Pedido` int(11) DEFAULT NULL,
  `Data_Pag` date DEFAULT NULL,
  `Valor_Pag` decimal(6,2) DEFAULT NULL,
  `Tipo_Pag` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `pedidos` (
  `PK_Pedido` int(11) NOT NULL,
  `FK_Cadastro` int(11) DEFAULT NULL,
  `Data_Pedi` date DEFAULT NULL,
  `Status_Pedi` varchar(20) DEFAULT NULL,
  `Valor_Tot` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `autores`
  ADD PRIMARY KEY (`PK_Autor`);

ALTER TABLE `cadastros`
  ADD PRIMARY KEY (`PK_Cadastro`),
  ADD UNIQUE KEY `FK_Cliente` (`FK_Cliente`);
  
 ALTER TABLE `clientes`
  ADD PRIMARY KEY (`PK_Cliente`);
  
  ALTER TABLE `editoras`
  ADD PRIMARY KEY (`PK_Editora`);

ALTER TABLE `itens_pedido`
  ADD PRIMARY KEY (`PK_Item`),
  ADD KEY `FK_Livro` (`FK_Livro`),
  ADD KEY `FK_Pedido` (`FK_Pedido`);

ALTER TABLE `livros`
  ADD PRIMARY KEY (`PK_Livro`),
  ADD KEY `FK_Autor` (`FK_Autor`),
  ADD KEY `FK_Editora` (`FK_Editora`);
  
 ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`PK_Pag`),
  ADD KEY `FK_Pedido` (`FK_Pedido`);

ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`PK_Pedido`),
  ADD KEY `FK_Cadastro` (`FK_Cadastro`);

ALTER TABLE `autores`
  MODIFY `PK_Autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `cadastros`
  MODIFY `PK_Cadastro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `clientes`
  MODIFY `PK_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `editoras`
  MODIFY `PK_Editora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
  
ALTER TABLE `livros`
  MODIFY `PK_Livro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
  
ALTER TABLE `cadastros`
  ADD CONSTRAINT `cadastros_ibfk_1` FOREIGN KEY (`FK_Cliente`) REFERENCES `clientes` (`PK_Cliente`);

ALTER TABLE `itens_pedido`
  ADD CONSTRAINT `itens_pedido_ibfk_1` FOREIGN KEY (`FK_Livro`) REFERENCES `livros` (`PK_Livro`),
  ADD CONSTRAINT `itens_pedido_ibfk_2` FOREIGN KEY (`FK_Pedido`) REFERENCES `pedidos` (`PK_Pedido`);
  
ALTER TABLE `livros`
  ADD CONSTRAINT `livros_ibfk_1` FOREIGN KEY (`FK_Autor`) REFERENCES `autores` (`PK_Autor`),
  ADD CONSTRAINT `livros_ibfk_2` FOREIGN KEY (`FK_Editora`) REFERENCES `editoras` (`PK_Editora`);

ALTER TABLE `pagamentos`
  ADD CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`FK_Pedido`) REFERENCES `pedidos` (`PK_Pedido`);


ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`FK_Cadastro`) REFERENCES `cadastros` (`PK_Cadastro`);
COMMIT;

 
INSERT INTO PEDIDOS VALUES (01,01,'2022-02-02','APROVADO','98.00');
INSERT INTO PEDIDOS VALUES (02,02,'2022-03-01','APROVADO','45.00');
INSERT INTO PEDIDOS VALUES (03,02,'2022-03-01','APROVADO','130.98');
INSERT INTO PEDIDOS VALUES (04,02,'2023-02-01','APROVADO','98.00');
INSERT INTO PEDIDOS VALUES (05,02,'2022-02-25','APROVADO','130.98');
INSERT INTO PEDIDOS VALUES (06,02,'2022-03-13','APROVADO','49.90');
INSERT INTO PEDIDOS VALUES (07,02,'2022-02-05','APROVADO','98.00');
INSERT INTO PEDIDOS VALUES (08,02,'2022-03-01','APROVADO','60.00');


INSERT INTO PEDIDOS VALUES (09,03,'2022-05-10','APROVADO','130.98');
INSERT INTO PEDIDOS VALUES (10,04,'2022-03-25','APROVADO','49.9');
INSERT INTO PEDIDOS VALUES (11,05,'2022-03-25','APROVADO','78.98');

INSERT INTO PEDIDOS VALUES (12,05,'2022-03-25','APROVADO','100.00');
INSERT INTO PEDIDOS VALUES (13,07,'2023-02-01','APROVADO','60.00');

INSERT INTO PEDIDOS VALUES (14,08,'2023-02-01','APROVADO','78.99');
INSERT INTO PEDIDOS VALUES (15,08,'2023-02-01','APROVADO','150.98');
INSERT INTO PEDIDOS VALUES (16,08,'2023-03-15','APROVADO','60.00');
INSERT INTO PEDIDOS VALUES (17,08,'2023-02-23','APROVADO','56.58');
INSERT INTO PEDIDOS VALUES (18,08,'2023-02-16','APROVADO','130.98');
INSERT INTO PEDIDOS VALUES (19,07,'2023-02-18','APROVADO','130.98');
INSERT INTO PEDIDOS VALUES (20,04,'2023-03-01','APROVADO','56.58');


INSERT INTO ITENS_PEDIDO VALUES (01,02,01,1);
INSERT INTO ITENS_PEDIDO VALUES (02,03,02,1);
INSERT INTO ITENS_PEDIDO VALUES (03,09,03,1);
INSERT INTO ITENS_PEDIDO VALUES (04,02,04,1);
INSERT INTO ITENS_PEDIDO VALUES (05,09,05,1);
INSERT INTO ITENS_PEDIDO VALUES (06,01,06,1);
INSERT INTO ITENS_PEDIDO VALUES (07,02,07,1);
INSERT INTO ITENS_PEDIDO VALUES (08,06,08,1);
INSERT INTO ITENS_PEDIDO VALUES (09,09,09,1);
INSERT INTO ITENS_PEDIDO VALUES (10,01,09,1);
INSERT INTO ITENS_PEDIDO VALUES (11,08,11,1);
INSERT INTO ITENS_PEDIDO VALUES (12,07,12,1);
INSERT INTO ITENS_PEDIDO VALUES (13,06,13,1);
INSERT INTO ITENS_PEDIDO VALUES (14,04,14,1);
INSERT INTO ITENS_PEDIDO VALUES (15,05,15,1);
INSERT INTO ITENS_PEDIDO VALUES (16,06,16,1);
INSERT INTO ITENS_PEDIDO VALUES (17,10,17,1);
INSERT INTO ITENS_PEDIDO VALUES (18,09,18,1);
INSERT INTO ITENS_PEDIDO VALUES (19,09,19,1);
INSERT INTO ITENS_PEDIDO VALUES (20,10,20,1);


INSERT INTO PAGAMENTOS VALUES (01,01,'2022-02-02','98.00','PIX');
INSERT INTO PAGAMENTOS VALUES (02,02,'2022-03-01','45.00','CREDITO');
INSERT INTO PAGAMENTOS VALUES (03,03,'2022-03-01','130.98','CREDITO');
INSERT INTO PAGAMENTOS VALUES (04,04,'2023-02-01','98,00','CREDITO');
INSERT INTO PAGAMENTOS VALUES (05,05,'2022-02-25','130.98','CREDITO');
INSERT INTO PAGAMENTOS VALUES (06,06,'2022-03-13','49.90','CREDITO');
INSERT INTO PAGAMENTOS VALUES (07,07,'2022-02-05','98.00','CREDITO');
INSERT INTO PAGAMENTOS VALUES (08,08,'2022-03-01','60.00','CREDITO');
INSERT INTO PAGAMENTOS VALUES (09,09,'2022-05-10','130.98','BOLETO');
INSERT INTO PAGAMENTOS VALUES (10,10,'2022-03-25','130.98','BOLETO');
INSERT INTO PAGAMENTOS VALUES (11,11,'2022-03-25','78.98','BOLETO');
INSERT INTO PAGAMENTOS VALUES (12,12,'2022-03-25','100.00','BOLETO');
INSERT INTO PAGAMENTOS VALUES (13,13,'2023-02-01','60.00','BOLETO');
INSERT INTO PAGAMENTOS VALUES (14,14,'2023-02-01','78.99','PIX');
INSERT INTO PAGAMENTOS VALUES (15,15,'2023-02-01','150.98','PIX');
INSERT INTO PAGAMENTOS VALUES (16,16,'2023-03-15','60.00','CREDITO');
INSERT INTO PAGAMENTOS VALUES (17,17,'2023-02-23','56.58','CREDITO');
INSERT INTO PAGAMENTOS VALUES (18,18,'2023-02-16','130.98','CREDITO');
INSERT INTO PAGAMENTOS VALUES (19,19,'2023-02-18','130.98','CREDITO');
INSERT INTO PAGAMENTOS VALUES (20,20,'2023-03-01','56.58','PIX');



SELECT *  FROM PEDIDOS
	INNER JOIN PAGAMENTOS
		ON PEDIDOS.PK_PEDIDO = PAGAMENTOS.FK_PEDIDO
	INNER JOIN ITENS_PEDIDO
		ON PEDIDOS.PK_PEDIDO = ITENS_PEDIDO.FK_PEDIDO;
		
SELECT *  FROM PEDIDOS
	INNER JOIN PAGAMENTOS
		ON PEDIDOS.PK_PEDIDO = PAGAMENTOS.FK_PEDIDO
	INNER JOIN ITENS_PEDIDO
		ON PEDIDOS.PK_PEDIDO = ITENS_PEDIDO.FK_PEDIDO
	INNER JOIN LIVROS
		ON LIVROS.PK_LIVRO = ITENS_PEDIDO.FK_LIVRO;

