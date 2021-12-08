create database petshop_db;
use petshop_db;

create table petshop(
cnpj varchar(14) not null,
nome varchar(100) not null,
razaosocial varchar(100) not null,
unidade varchar(100) not null,
qtdfuncionarios int not null,
nomefantasia  varchar(100) not null,
datafundacao date,
inscrmunicipal int not null,
inscrestadual int not null,
primary key(cnpj)
);

insert
into petshop (cnpj,nome,razaosocial,unidade,qtdfuncionarios,nomefantasia,datafundacao,inscrmunicipal,inscrestadual) 
values ("12345678963254","PetShop Osasco","Petshop","Osasco",20,"PetShop Osasco",str_to_date("03/08/1985", "%d/%m/%Y"),123456,563248);

select * from petshop;

create table servico(
nome int not null,
preco float not null,
descricao varchar(255) not null,
idservico int not null auto_increment,
idfuncionario int not null,
coleira int not null,
idprodutosusados int not null,
primary key (idservico),
constraint fk_coleira foreign key(coleira) references pets (coleira),
constraint idprodutosusados foreign key(idprodutosusados) references produto (idproduto),
constraint fk_idfuncionario foreign key(idfuncionario) references funcionario (idfuncionario)
);

create table consulta(
dignostico varchar(100) not null, 
receita varchar(100) not null,
idservico int not null,
constraint fk_idservico foreign key(idservico) references servico (idservico)
);

create table internacao(
codigointernacao int not null auto_increment,
causa varchar(100) not null,
duracao time,
numcercado int not null,
idservico int not null,
primary key (codigointernacao),
constraint idservico foreign key(idservico) references servico (idservico)
);

create table castracao(
registro varchar(100) not null,
idservico int not null,
constraint fkidservico foreign key(idservico) references servico (idservico)
);

create table exame(
idExame int not null auto_increment,
resultado varchar(100) not null,
tipo varchar(80) not null,
idservico int not null,
primary key (idExame),
constraint idservicofk foreign key(idservico) references servico (idservico)
);

create table cirurgia(
tipo varchar(100) not null,
horaInicio time not null,
horaFim time not null,
idservico int not null,
constraint idservico_fk foreign key(idservico) references servico (idservico)
);

create table banhotosa(
tipo varchar(100) not null,
observacoes varchar(200) not null,
idservico int not null,
constraint id_servico foreign key(idservico) references servico (idservico)
);

create table vacinacao(
nivel varchar(100) not null,
tipo varchar(200) not null,
lote int not null,
idservico int not null,
constraint fk_id_servico foreign key(idservico) references servico (idservico)
);

create table acomodacoes(
idacomodacoes int not null auto_increment,
tipoplano varchar(200) not null,
idservico int not null,
primary key (idacomodacoes),
constraint id_servico_fk foreign key(idservico) references servico (idservico)
);
