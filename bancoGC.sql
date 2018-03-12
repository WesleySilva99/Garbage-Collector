CREATE DATABASE gc;
use gc;


create table tipo_coleta(

id int primary key auto_increment,
descricao varchar(45) not null
);

create table veiculo(

id int primary key auto_increment,
CHASI varchar(30) not null,
placa varchar(7) not null,
marca varchar(20) not null,
ano_veiculo varchar(4) not null
);

create table endereco(

id int primary key auto_increment,
bairro varchar(20) not null,
complemento varchar(10) not null,
rua varchar(50) not null,
numero varchar(6) not null,
cep varchar(9) not null
);

create table cliente(

id int primary key auto_increment,
nome varchar(40) not null,
cpf varchar(14) not null,
dt_nasc date not null,
login varchar(10) not null,
senha varchar(32) not null,
telefone varchar(15) not null,
email varchar(45) not null,
id_endereco int,
foreign key(id_endereco) references endereco(id)
);

create table motorista(

id int primary key auto_increment,
nome varchar(45) not null,
cpf varchar(14) not null,
rg varchar(10) not null,
telefone varchar(15) not null,
sexo varchar(15) not null,
n_abilitacao varchar(11) not null,
cat_abilitacao varchar(4) not null,
dataVencimento date not null,
email varchar(45) not null,
login varchar(10) not null,
senha varchar(32) not null,
id_endereco int not null,
id_veiculo int,
foreign key(id_endereco) references endereco(id),
foreign key(id_veiculo) references veiculo(id)
);

create table pedido(

id int primary key auto_increment,
descricao varchar(100) not null,
quantidade int not null,
endereco varchar(50) not null,
numero varchar(6) not null,
cep varchar(9) not null,
busca_material datetime,
id_endereco int,
id_tp_coleta int,
id_cliente int,
id_motorista int,
foreign key (id_endereco) references endereco(id),
foreign key (id_tp_coleta) references tipo_coleta(id),
foreign key (id_cliente) references cliente(id),
foreign key (id_motorista) references motorista(id)
);
