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

CREATE TABLE motorista (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    rg VARCHAR(10) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    sexo VARCHAR(15) NOT NULL,
    n_abilitacao VARCHAR(11) NOT NULL,
    cat_abilitacao VARCHAR(4) NOT NULL,
    dataVencimento DATE NOT NULL,
    email VARCHAR(45) NOT NULL,
    login VARCHAR(10) NOT NULL,
    senha VARCHAR(32) NOT NULL,
    id_endereco INT NOT NULL,
    id_veiculo INT,
    FOREIGN KEY (id_endereco)
        REFERENCES endereco (id),
    FOREIGN KEY (id_veiculo)
        REFERENCES veiculo (id)
);

create table pedido(

id int primary key auto_increment,
descricao varchar(100) not null,
quantidade int not null,
endereco varchar(50) not null,
numero varchar(6) not null,
cep varchar(9) not null,
<<<<<<< HEAD
busca_material datetime,
=======
material_dt_hr datetime,
>>>>>>> versao-3-gleibson
id_endereco int,
id_tp_coleta int,
id_cliente int,
id_motorista int,
foreign key (id_endereco) references endereco(id),
foreign key (id_tp_coleta) references tipo_coleta(id),
foreign key (id_cliente) references cliente(id),
foreign key (id_motorista) references motorista(id)
);

create table administrador(
id int primary key auto_increment,
nome varchar(40) not null,
login varchar(10) not null,
senha varchar(32) not null,
telefone varchar(15) not null,
email varchar(45) not null
);

select * from administrador;


