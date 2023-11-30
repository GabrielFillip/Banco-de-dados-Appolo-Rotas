CREATE DATABASE Banco_de_Dados_Appolo;
USE Banco_de_Dados_Appolo;

--criação das 5 entidades--

CREATE TABLE Cliente ( 
id_cliente			int			primary key		identity,
CPF					varchar(11)		not null,
nome				varchar(120)	not null,		
data_nasc			date			not null, 
rua					varchar(60),
numero				varchar(20),
bairro				varchar(60),
cidade				varchar(60),
estado				varchar(60),
pais				varchar(60)		not null,

);


CREATE TABLE Pacotes ( 
id_pac				int			primary key		identity,
nome_voo			varchar(120)	not null,
preco				decimal(10,2)   not null,
quant_max_pess		int,					
data_ida			date,			
data_volta			date,
hotel				varchar(60),
nome				varchar(120),

);


CREATE TABLE Funcionarios ( 
id_func				int			primary key		identity,			 
id_pac              int,
cargo				varchar(60)					not null,
salario				decimal(10,2)				not null,
data_contratacao	date						not null,		
nome				varchar(120)				not null, 
data_demissao		date,
FOREIGN key (id_pac) REFERENCES Pacotes(id_pac)
);


CREATE TABLE Hoteis ( 
id_hotel			int			primary key		identity,
nome				varchar(120)	not null,		
rua					varchar(60)		not null,
numero				varchar(20)		not null,	
bairro				varchar(60)		not null,
cidade				varchar(60)		not null,
estado				varchar(60)		not null,
pais				varchar(60)		not null,
quant_quartos		int				not null,
preco_sem			decimal(10,2),
preco_fsem			decimal(10,2),
);


CREATE TABLE Voos ( 
num_voo				int			primary key		identity,
num_passageiro		int							not null,		
quant_passagens		int,
hora_voo			time						not null,
destino				varchar(60)					not null,
preco				decimal(10,2),
rua					varchar(60),
numero				varchar(20),
bairro				varchar(60),
cidade				varchar(60),
estado				varchar(60),
pais				varchar(60)					not null,
);

--criação das tabelas de relacionamento--

CREATE TABLE Pacotes_Clientes ( 
id_pac				int,
id_cliente			int,
FOREIGN key (id_cliente) REFERENCES Cliente(id_cliente),
FOREIGN key (id_pac) REFERENCES Pacotes(id_pac),
);

CREATE TABLE Cliente_Voos ( 
id_cliente			int,
num_voo				int,
FOREIGN key (id_cliente) REFERENCES Cliente(id_cliente),
FOREIGN key (num_voo) REFERENCES Voos(num_voo),
);

CREATE TABLE Funcionarios_hoteis ( 
id_func				int,
id_hotel			int,
FOREIGN key (id_hotel) REFERENCES Hoteis(id_hotel),
FOREIGN key (id_func) REFERENCES Funcionarios(id_func),
);

CREATE TABLE Hoteis_cliente ( 
id_hotel				int,
id_cliente				int,
FOREIGN key (id_cliente) REFERENCES Cliente(id_cliente),
FOREIGN key (id_hotel) REFERENCES Hoteis(id_hotel),
);

CREATE TABLE Funcionarios_voos ( 
id_func				int,
num_voo				int,
FOREIGN key (id_func) REFERENCES Funcionarios(id_func),
FOREIGN key (num_voo) REFERENCES Voos(num_voo)
);

--criação tabelas para atributos multivalorados cliente.--

CREATE TABLE Email ( 
id_cliente			int,
email				varchar(70),
FOREIGN key (id_cliente) REFERENCES Cliente(id_cliente),
);

CREATE TABLE Telefone ( 
id_cliente			int,
ddi					int,
ddd					int,
numero				int,
FOREIGN key (id_cliente) REFERENCES Cliente(id_cliente),
);

--INSERTS TABELA CLIENTES--

INSERT INTO Cliente ( cpf, nome, data_nasc, rua, numero, bairro, cidade, estado, pais)
VALUES 
( '98765432109', 'Aline Santos', '1983-03-25', 'Rua das Tulipas', '210', 'Barra Funda', 'São Paulo', 'SP', 'Brasil'),
( '12345678901', 'João da Silva', '1990-05-15', 'Avenida dos Ipês', '10', 'Centro', 'São Paulo', 'SP', 'Brasil'),
( '23456789012', 'Maria Santos', '1985-08-22', 'Travessa das Rosas', '20', 'Copacabana', 'Rio de Janeiro', 'RJ', 'Brasil'),
( '34567890123', 'Carlos Oliveira', '1998-02-10', 'Rua das Violetas', '30', 'Barra da Tijuca', 'Rio de Janeiro', 'RJ', 'Brasil'),
( '45678901234', 'Ana Souza', '1976-11-30', 'Alameda das Margaridas', '40', 'Jardins', 'São Paulo', 'SP', 'Brasil'),
( '56789012345', 'Pedro Fernandes', '2000-07-18', 'Avenida dos Girassóis', '50', 'Ipanema', 'Rio de Janeiro', 'RJ', 'Brasil'),
( '67890123456', 'Laura Costa', '1993-04-25', 'Praça das Orquídeas', '60', 'Leblon', 'Rio de Janeiro', 'RJ', 'Brasil'),
( '78901234567', 'Lucas Pereira', '1982-09-05', 'Travessa das Hortênsias', '70', 'Moema', 'São Paulo', 'SP', 'Brasil'),
( '89012345678', 'Luana Rodrigues', '1979-12-28', 'Rua dos Jasmims', '80', 'Pinheiros', 'São Paulo', 'SP', 'Brasil'),
( '90123456789', 'Guilherme Almeida', '1995-03-20', 'Alameda das Begônias', '90', 'Botafogo', 'Rio de Janeiro', 'RJ', 'Brasil'),
( '01234567890', 'Juliana Barbosa', '1987-06-12', 'Rua das Margaridas', '100', 'Centro', 'Belo Horizonte', 'MG', 'Brasil'),
( '12345098765', 'Gabriel Lima', '1980-01-01', 'Avenida dos Lírios', '110', 'Centro', 'Porto Alegre', 'RS', 'Brasil'),
( '23456098765', 'Sofia Gomes', '1996-04-05', 'Praça das Azaleias', '120', 'Barra Funda', 'São Paulo', 'SP', 'Brasil'),
( '34567098765', 'André Martins', '1974-09-17', 'Rua das Camélias', '130', 'Copacabana', 'Rio de Janeiro', 'RJ', 'Brasil'),
( '45678098765', 'Bruna Ferreira', '1992-12-25', 'Alameda dos Jasmins', '140', 'Leblon', 'Rio de Janeiro', 'RJ', 'Brasil'),
( '56789098765', 'Ricardo Cardoso', '1989-07-07', 'Avenida das Orquídeas', '150', 'Ipanema', 'Rio de Janeiro', 'RJ', 'Brasil'),
( '67890098765', 'Mariana Nunes', '1984-10-30', 'Rua dos Crisântemos', '160', 'Moema', 'São Paulo', 'SP', 'Brasil'),
( '78901098765', 'Daniel Castro', '1997-03-15', 'Alameda dos Antúrios', '170', 'Pinheiros', 'São Paulo', 'SP', 'Brasil'),
( '89012098765', 'Fernanda Carvalho', '1978-06-20', 'Praça das Dálias', '180', 'Botafogo', 'Rio de Janeiro', 'RJ', 'Brasil'),
( '90123098765', 'Diego Silva', '1990-11-05', 'Avenida das Hortênsias', '190', 'Centro', 'Belo Horizonte', 'MG', 'Brasil'),
( '01234098765', 'Renata Oliveira', '1975-08-08', 'Rua das Magnólias', '200', 'Centro', 'Porto Alegre', 'RS', 'Brasil');





--inserts tabela Pacotes--

INSERT INTO Pacotes (nome_voo, preco, quant_max_pess, data_ida, data_volta, hotel, nome)
VALUES 
('Voo A', 500.00, 20, '2023-12-01', '2023-12-08', 'Hotel X', 'Pacote A'),
('Voo B', 600.00, 15, '2023-12-03', '2023-12-10', 'Hotel Y', 'Pacote B'),
('Voo C', 700.00, 18, '2023-12-05', '2023-12-12', 'Hotel Z', 'Pacote C'),
('Voo D', 550.00, 22, '2023-12-07', '2023-12-14', 'Hotel W', 'Pacote D'),
('Voo E', 800.00, 25, '2023-12-09', '2023-12-16', 'Hotel V', 'Pacote E'),
('Voo F', 650.00, 19, '2023-12-11', '2023-12-18', 'Hotel U', 'Pacote F'),
('Voo G', 720.00, 16, '2023-12-13', '2023-12-20', 'Hotel T', 'Pacote G'),
('Voo H', 680.00, 21, '2023-12-15', '2023-12-22', 'Hotel S', 'Pacote H'),
('Voo I', 750.00, 17, '2023-12-17', '2023-12-24', 'Hotel R', 'Pacote I'),
('Voo J', 700.00, 23, '2023-12-19', '2023-12-26', 'Hotel Q', 'Pacote J'),
('Voo K', 820.00, 18, '2023-12-21', '2023-12-28', 'Hotel P', 'Pacote K'),
('Voo L', 670.00, 20, '2023-12-23', '2023-12-30', 'Hotel O', 'Pacote L'),
('Voo M', 730.00, 15, '2023-12-25', '2024-01-01', 'Hotel N', 'Pacote M'),
('Voo N', 790.00, 19, '2023-12-27', '2024-01-03', 'Hotel M', 'Pacote N'),
('Voo O', 680.00, 24, '2023-12-29', '2024-01-05', 'Hotel L', 'Pacote O'),
('Voo P', 840.00, 16, '2023-12-31', '2024-01-07', 'Hotel K', 'Pacote P'),
('Voo Q', 760.00, 21, '2024-01-02', '2024-01-09', 'Hotel J', 'Pacote Q'),
('Voo R', 710.00, 17, '2024-01-04', '2024-01-11', 'Hotel I', 'Pacote R'),
('Voo S', 770.00, 22, '2024-01-06', '2024-01-13', 'Hotel H', 'Pacote S'),
('Voo T', 850.00, 18, '2024-01-08', '2024-01-15', 'Hotel G', 'Pacote T');



--inserts tabela Funcionarios--

INSERT INTO Funcionarios ( cargo, salario, data_contratacao, nome, data_demissao)
VALUES 
( 'Analista de Marketing', 5500.00, '2022-01-05', 'José Silva', NULL),
( 'Engenheiro de Software', 6200.00, '2021-05-12', 'Ana Santos', NULL),
( 'Desenvolvedor Web', 7200.00, '2020-08-20', 'Carlos Oliveira', NULL),
( 'Gerente de Projetos', 5800.00, '2019-04-02', 'Amanda Ferreira', NULL),
( 'Analista Financeiro', 7900.00, '2018-12-15', 'Mariana Rodrigues', NULL),
( 'Designer UX/UI', 6300.00, '2017-11-28', 'Pedro Souza', NULL),
( 'Analista de Dados', 7100.00, '2016-10-07', 'Laura Almeida', NULL),
( 'Analista de Suporte', 6800.00, '2015-09-22', 'Bruno Costa', NULL),
( 'Recursos Humanos', 7500.00, '2014-08-14', 'Carolina Ramos', NULL),
( 'Administrativo', 7000.00, '2013-07-30', 'Fernando Pereira', NULL),
( 'Analista de Sistemas', 8200.00, '2012-06-18', 'Roberta Silva', NULL),
( 'Especialista em Redes', 6700.00, '2011-05-05', 'Gustavo Oliveira', NULL),
( 'Analista de Qualidade', 7300.00, '2010-04-22', 'Patrícia Santos', NULL),
( 'Suporte Técnico', 8000.00, '2009-03-10', 'Luciana Ferreira', NULL),
( 'Engenheiro de Dados', 8800.00, '2008-02-27', 'Ricardo Alves', NULL),
( 'Analista de Negócios', 7500.00, '2007-01-14', 'Juliana Lima', NULL),
( 'Consultor', 7700.00, '2006-12-01', 'Marcos Barbosa', NULL),
( 'Assistente Administrativo', 8400.00, '2005-10-19', 'Fábio Gomes', NULL),
( 'Analista de Projetos', 7200.00, '2004-09-05', 'Isabela Martins', NULL),
( 'Analista de Marketing', 7900.00, '2003-08-22', 'Renata Oliveira', NULL),
( 'Engenheiro de Software', 7300.00, '2002-07-09', 'Thiago Silva', NULL);

--inserts tabelas hoteis -- 

INSERT INTO Hoteis (nome, rua, numero, bairro, cidade, estado, pais, quant_quartos, preco_sem, preco_fsem)
VALUES 
('Hotel Oasis', 'Rua Augusta', '123', 'Consolação', 'São Paulo', 'São Paulo', 'Brasil', 50, 200.00, 240.00),
('Hotel 212', 'Avenida Paulista', '456', 'Bela Vista', 'São Paulo', 'São Paulo', 'Brasil', 60, 250.00, 290.00),
('Hotel Estrela', 'Rua Oscar Freire', '789', 'Jardins', 'São Paulo', 'São Paulo', 'Brasil', 45, 180.00, 220.00),
('Hotel Maravilha', 'Rua das Flores', '1011', 'Centro', 'Rio de Janeiro', 'Rio de Janeiro', 'Brasil', 70, 300.00, 330.00),
('Hotel Praia', 'Avenida Atlântica', '1213', 'Copacabana', 'Rio de Janeiro', 'Rio de Janeiro', 'Brasil', 55, 220.00, 260.00),
('Hotel Monte', 'Rua da Paz', '1415', 'Ipanema', 'Rio de Janeiro', 'Rio de Janeiro', 'Brasil', 65, 280.00, 320.00),
('Hotel Sol Nascente', 'Avenida Beira Mar', '1617', 'Praia de Iracema', 'Fortaleza', 'Ceará', 'Brasil', 48, 190.00, 230.00),
('Hotel Sertão', 'Rua do Comércio', '1819', 'Centro', 'Fortaleza', 'Ceará', 'Brasil', 75, 320.00, 360.00),
('Hotel Encantado', 'Rua das Pedras', '2021', 'Centro', 'Búzios', 'Rio de Janeiro', 'Brasil', 40, 160.00, 200.00),
('Hotel Paraíso', 'Avenida das Palmeiras', '2223', 'Ponta Negra', 'Natal', 'Rio Grande do Norte', 'Brasil', 80, 340.00, 380.00),
('Hotel Charme', 'Rua dos Coqueiros', '2425', 'Ponta Verde', 'Maceió', 'Alagoas', 'Brasil', 60, 250.00, 290.00),
('Hotel Brasil', 'Avenida Principal', '2627', 'Centro', 'Porto Seguro', 'Bahia', 'Brasil', 55, 200.00, 240.00),
('Hotel Tropical', 'Rua das Palmas', '2829', 'Praia do Forte', 'Salvador', 'Bahia', 'Brasil', 50, 230.00, 270.00),
('Hotel Atlântico', 'Avenida Beira Mar', '3031', 'Boa Viagem', 'Recife', 'Pernambuco', 'Brasil', 70, 280.00, 320.00),
('Hotel Encanto Verde', 'Rua das Dunas', '3233', 'Ponta Negra', 'João Pessoa', 'Paraíba', 'Brasil', 65, 290.00, 330.00),
('Hotel Serra Azul', 'Avenida das Montanhas', '3435', 'Centro', 'Gramado', 'Rio Grande do Sul', 'Brasil', 85, 360.00, 400.00),
('Hotel Sossego', 'Rua das Hortências', '3637', 'Centro', 'Canela', 'Rio Grande do Sul', 'Brasil', 45, 180.00, 220.00),
('Hotel do Vale', 'Avenida da Serra', '3839', 'Centro', 'Nova Friburgo', 'Rio de Janeiro', 'Brasil', 90, 400.00, 440.00),
('Hotel Verde Mar', 'Rua das Conchas', '4041', 'Jardim Atlântico', 'Florianópolis', 'Santa Catarina', 'Brasil', 55, 210.00, 250.00),
('Hotel das Flores', 'Avenida das Praias', '4243', 'Praia Brava', 'Balneário Camboriú', 'Santa Catarina', 'Brasil', 60, 220.00, 260.00);


--inserts da tabela Voos--

INSERT INTO Voos (num_passageiro, quant_passagens, hora_voo, destino, preco, rua, numero, bairro, cidade, estado, pais)
VALUES 
(150, 100, '08:00:00', 'Paris', 750.00, 'Avenue des Champs-Élysées', '123', 'Champs-Élysées', 'Paris', 'Île-de-France', 'França'),
(120, 80, '09:30:00', 'Nova Iorque', 850.00, '5th Avenue', '456', 'Manhattan', 'Nova Iorque', 'Nova Iorque', 'Estados Unidos'),
(200, 150, '11:15:00', 'Tóquio', 920.00, 'Ginza', '789', 'Chuo City', 'Tóquio', 'Tóquio', 'Japão'),
(155, 105, '08:45:00', 'Singapura', 980.00, 'Orchard Road', '4445', 'Downtown Core', 'Singapura', 'Singapura', 'Singapura'),
(180, 120, '10:00:00', 'Londres', 800.00, 'Oxford Street', '1011', 'Westminster', 'Londres', 'Inglaterra', 'Reino Unido'),
(100, 70, '13:20:00', 'Sydney', 1050.00, 'George Street', '1415', 'Sydney Central Business District', 'Sydney', 'Nova Gales do Sul', 'Austrália'),
(130, 90, '16:00:00', 'Cidade do México', 880.00, 'Paseo de la Reforma', '1617', 'Juárez', 'Cidade do México', 'CDMX', 'México'),
(110, 75, '17:30:00', 'Moscou', 920.00, 'Tverskaya Street', '1819', 'Tverskoy', 'Moscou', 'Moscou', 'Rússia'),
(170, 110, '19:00:00', 'Roma', 890.00, 'Via del Corso', '2021', 'Historic Centre', 'Roma', 'Lácio', 'Itália'),
(140, 95, '20:45:00', 'Pequim', 980.00, 'Wangfujing Street', '2223', 'Dongcheng District', 'Pequim', 'Pequim', 'China'),
(160, 105, '18:20:00', 'Toronto', 870.00, 'Yonge Street', '2425', 'Downtown Toronto', 'Toronto', 'Ontário', 'Canadá'),
(190, 125, '21:30:00', 'Berlim', 910.00, 'Kurfürstendamm', '2627', 'Charlottenburg', 'Berlim', 'Berlim', 'Alemanha'),
(105, 65, '22:15:00', 'Cairo', 930.00, '26th of July Street', '2829', 'Zamalek', 'Cairo', 'Cairo', 'Egito'),
(125, 85, '23:40:00', 'Bangcoc', 990.00, 'Sukhumvit Road', '3031', 'Sukhumvit', 'Bangcoc', 'Bangcoc', 'Tailândia'),
(145, 100, '00:25:00', 'Madri', 870.00, 'Gran Vía', '3233', 'Centro', 'Madri', 'Comunidade de Madri', 'Espanha'),
(155, 105, '01:50:00', 'Seul', 940.00, 'Myeong-dong', '3435', 'Jung-gu', 'Seul', 'Seul', 'Coreia do Sul'),
(115, 80, '03:30:00', 'Viena', 900.00, 'Kärntner Straße', '3637', 'Innere Stadt', 'Viena', 'Viena', 'Áustria'),
(135, 90, '04:45:00', 'Havana', 920.00, 'Malecón', '3839', 'Vedado', 'Havana', 'La Habana', 'Cuba'),
(165, 110, '06:20:00', 'Buenos Aires', 860.00, 'Avenida Corrientes', '4041', 'San Nicolás', 'Buenos Aires', 'Buenos Aires', 'Argentina'),
(175, 115, '07:10:00', 'Auckland', 990.00, 'Queen Street', '4243', 'CBD', 'Auckland', 'Auckland', 'Nova Zelândia');

--Insert das tabelas de relacionamento--


-- Associação de id da tabela pacotes_cliente--

INSERT INTO Pacotes_Clientes (id_pac, id_cliente)
VALUES 

(20, 2), 
(19, 3), 
(18, 4),
(17, 5),
(16, 6),
(15, 7),
(14, 8),
(13, 9),
(12, 10),
(11, 11),
(10, 12),
(9, 13),
(8, 14),
(7, 15),
(6, 16),
(5, 17),
(4, 18),
(3, 19),
(2, 20);


-- Associação de id da tabela Cliente_Voos--

INSERT INTO Cliente_Voos(id_cliente, num_voo)
VALUES 

(26, 1), 
(27, 2), 
(28, 3),
(29, 4),
(30, 5),
(31, 6),
(32, 7),
(33, 8),
(34, 9),
(35, 10),
(36, 11),
(37, 12),
(38, 13),
(39, 14),
(40, 15),
(41, 16),
(42, 17),
(43, 18),
(44, 19),
(45, 20);


-- Associação de id da tabela Hoteis_cliente--

INSERT INTO Hoteis_cliente (id_hotel, id_cliente)
VALUES
(1, 26), 
(2, 27), 
(3, 28),
(4, 29),
(5, 30),
(6, 31),
(7, 32),
(8, 33),
(9, 34),
(10, 35),
(11, 36),
(12, 37),
(13, 38),
(14, 39),
(15, 40),
(16, 41),
(17, 42),
(18, 43),
(19, 44),
(20, 45);

-- Associação de id da tabela Funcionarios-voos--

INSERT INTO Funcionarios_voos(id_func, num_voo)
VALUES
(8, 20),
(9, 19),
(10, 18),
(11, 17),
(12, 16),
(13, 15),
(14, 14),
(15, 13),
(16, 12),
(17, 11),
(18, 10),
(19, 9),
(20, 8),
(21, 7),
(22, 6),
(23, 5),
(24, 4),
(25, 3),
(26, 2),
(27, 1);

-- Associação de id da tabela Funcionarios-Hoteis--

INSERT INTO Funcionarios_hoteis(id_func, id_hotel)
VALUES
(8, 20),
(9, 19),
(10, 18),
(11, 17),
(12, 16),
(13, 15),
(14, 14),
(15, 13),
(16, 12),
(17, 11),
(18, 10),
(19, 9),
(20, 8),
(21, 7),
(22, 6),
(23, 5),
(24, 4),
(25, 3),
(26, 2),
(27, 1);


-- Associação de id da tabela Funcionarios_Voos--

--teste de selects--

SELECT nome, CPF, data_nasc FROM Cliente ORDER BY nome

SELECT nome, salario, cargo FROM Funcionarios WHERE  salario > 7000

SELECT * FROM Voos WHERE destino like 'P%'

SELECT * FROM Funcionarios WHERE data_contratacao between '2022-01-01' and '2022-12-31';

SELECT nome, CPF, data_nasc FROM Cliente ORDER BY data_nasc desc

SELECT * FROM Hoteis_cliente WHERE id_hotel between 1 and 8

SELECT * FROM Hoteis WHERE nome like 'Hotel O%'

SELECT nome, cidade, estado FROM Cliente WHERE estado like 'SP'

SELECT id_func, cargo, salario, data_contratacao, nome FROM Funcionarios WHERE cargo like 'Analista%' 

SELECT * FROM Pacotes WHERE nome like 'A%'
