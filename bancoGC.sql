create database gc;
use gc;


create table endereco(

id int auto_increment,
bairro varchar(50) not null,
complemento varchar(10) not null,
rua varchar(20) not null,
numero varchar(20) not null,
cep varchar(10) not null,
primary key (id)
);

create table cliente(

id int auto_increment,
nome varchar(45) not null,
cpf varchar(14) not null,
dt_nasc date not null,
login varchar(10) not null,
senha varchar(32) not null,
telefone varchar(15) not null,
email varchar(45) not null,
id_endereco int ,
primary key (id),
foreign key(id_endereco) references endereco(id)
);

create table motorista(

id int auto_increment,
nome varchar(45) not null,
cpf varchar(11) not null,
rg varchar(10) not null,
telefone varchar(14) not null,
n_abilitacao varchar(11) not null,
cat_abilitacao varchar(4) not null,
CHASI varchar(30) not null,
placa varchar(7) not null,
marca varchar(20) not null,
ano_veiculo date not null,
email varchar(45) not null,
id_endereco int not null,
primary key (id),
foreign key(id_endereco) references endereco(id)
);

create table pedido(

id int auto_increment,
tipoColeta varchar(30) not null,
descricao varchar(20) not null,
quantidade int not null,
endereco varchar(50) not null,
numero varchar(6) not null,
cep varchar(9) not null,
busca_material datetime,
primary key (id)

);

select * from pedido;
