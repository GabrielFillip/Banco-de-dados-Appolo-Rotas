# Banco-de-dados-Appolo-Rotas

Um projeto de banco de dados feito no SQLSERVER com intuito de uma avaliação de primeiro semestre da faculdade.

## Instruções

Trabalho Final - Modelagem de Banco de Dados

Para este Trabalho Final, você deverá demonstrar todo o conhecimento adquirido durante o semestre na disciplina de Modelagem de Banco de Dados. Siga as etapas abaixo para desenvolver a Modelagem de Dados Completa:

Cenário: Se passando por uma empresa/usuário, crie um cenário descrevendo a necessidade de um sistema (exemplos: sistema comercial, biblioteca, bancário etc.). Faça um texto detalhado identificando entidades, atributos e relacionamentos. É obrigatório ter no mínimo 5 entidades e todos os tipos de atributos (simples, compostos, multivalorados, derivados e atributos chave) e relacionamentos (UM PARA UM (1:1), UM PARA MUITOS (1:N) e MUITOS PARA MUITOS (N:N)).

Modelagem Conceitual: Faça o Diagrama de Entidade-Relacionamento (DER) completo do cenário criado. Respeite todas as regras do Modelo Entidade-Relacionamento (MER).

Modelagem Lógica: Faça o Modelo Lógico do cenário criado, demonstrando os tipos de dados esperados em cada atributo (varchar, int etc.). Apresente de forma clara as chaves primárias e estrangeiras, bem como a relação entre as tabelas.

Modelagem Física: Faça a implementação desse cenário em algum Sistema de Gerenciamento de Banco de Dados (SGBD) de sua escolha (SQL Server, MySQL etc.).

Dados: Faça a inserção de dados em todas as tabelas, com pelo menos 20 dados em cada tabela.

CRUD: Demonstre por meio de prints o CRUD dentro do SGBD (Inserção de dados, Leitura de Dados, Deleção e Alteração de Dados).

Relatórios: Utilizando a Seleção, Filtro e Ordenação, crie 10 consultas para exibir os dados do seu Banco de Dados, demonstrando principalmente a relação entre as tabelas.

O que deverá ser entregue:

Link do GitHub contendo todos os códigos SQL criados.
README bem estruturado contendo textos e prints demonstrando domínio nos 7 itens acima solicitados.
Separe as seções do README usando os títulos: Cenário, Modelagem Conceitual, Modelagem Lógica, Dados, CRUD e Relatórios.


## Cenario

Desenvolva um banco de dados de uma empresa de viagens o sistema precisa possuir, clientes, funcionários, hospedagem, voos e pacotes. Os clientes podem comprar pacotes voos e hospedagens e os funcionários criam e organizam hotel voos e pacotes.
- Os clientes podem se cadastrar no site e comprar passagens, estadia, etc... Cada cliente deve possuir nome, CPF, endereço, número de telefone e e-mail.
- Os funcionários também devem ser cadastrados no sistema, cada funcionário possui, nome, cargo, salário, data de contratação e se tiver data de demissão 
- Cada hotel deve ter: nome, endereço, quantidade de quartos, preço no meio da semana, preço no final de semana e feriados.
- Cada voo deve ter: localização, destino, preço, tempo de voo, quantidade de passageiros, horário de saída e quantidade de passageiros.
- Cada pacote deve ter: nome, hotel, voo, preço, quantidade de pessoas data ida e data de volta

# Entidades

- Cliente
- Funcionario
- Pacotes
- Voos
- Hoteis

# Atributos  

### CLIENTE - 
- nome
- CPF
- id_cliente
- Telefone
- Email
- Data_nasc
- endereço

### FUNCIONARIO - 
- nome
- cargo
- salario
- data_contratacao
- id_func
- data_demissao

### VOOS - 
- aeroporto
- num_voo
- quant_passagens
- hora_voo
- nome
- preco
- destino

### PACOTES - 
- nome
- hotel
- voo
- preco
- quant_max_pess
- data_ida
- data_volta
- id_pac

### HOTEIS - 
- nome
- endereco
- quant_quartos
- preco_fsem
- preco_sem
- id_hotel

# Relacionamentos

### Cliente e hoteis
  - relacionamento de 1:N
  - Cliente reserva hoteis

### Clientes e pacotes -
  - relacionamento de 1:N
  - Clientes reservam pacotes
 
### Clientes e voos
  - relacionamento de 1:N
  - Clientes reservam voos

### Funcionarios e hoteis
  - relacionamento de N:N
  - Funcionarios anunciam hoteis

### Funcionarios e pacotes

  - relacionamento de 1:1
  - Funcionarios anunciam pacotes

### Funcionarios e voos 
  - relacionamento de 1:N
  - Funcionarios anunciam voos

  
# Modelo Conceitual

![DER](https://github.com/GabrielFillip/Banco-de-dados-Appolo-Rotas/assets/142547884/4f9e33eb-7970-47ab-a4a2-7546f2d18a60)


# Modelo Logico 

![Modelo logico](https://github.com/GabrielFillip/Banco-de-dados-Appolo-Rotas/assets/142547884/6376cbb4-b0a9-4e63-ab5e-1e23ad7c3b95)

---
### Modelagem fisica: 
A modelagem fisica esta em: "Banco de dados prova/AppoloRotas.sql"

---
### Dados: 
TODAS as inserção de dados esta em: "Banco de dados prova/AppoloRotas.sql



---
### CRUD: 

Os CRUDS estão em: "Banco de dados prova/AppoloRotas.sql

---

## Consultas

### Consulta 1: - Informa o nome o CPF e a data de nascimento dos Clientes em ordem alfabética.

### Consulta 2: - Informa o nome salario e o cargo Funcionarios cujo o salário é maior que 7.000,00.

### Consulta 3: - Informa os Voos cujo o destino comece com a letra "P".

### Consulta 4: - Informa todos os dados dos Funcionarios que foram admitidos em 2022.

### Consulta 5: - Informa nome CPF e data de nascimento dos Clientes do mais novo ao mais velho.

### Consulta 6: - Informa com quais os id_cliente estao relacionados com os id_hoteis de 1 ate 8.

### Consulta 7: - Informa todos os dados dos hoteis que o nome começam com 'O. 

### Consulta 8: - Informa nome, cidade e estado dos clientes que moram no estado de SAO PAULO.

### Consulta 9: - Informa todos os dados dos Funcionarios com o cargo com nome de "Analista".

### Consulta 10: - Informa todos os dados dos pacotes que tem o nome começando com "A.









