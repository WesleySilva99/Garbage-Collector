<%@ page language="java" contentType="text/html; charset=iso-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="apple-touch-icon" sizes="76x76"
	href="view/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="view/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Garbage Collector</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<!-- CSS Files -->
<link href="view/assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="view/assets/css/now-ui-kit.css" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="view/assets/css/demo.css" rel="stylesheet" />
</head>

<title>Cadastro de Usuário</title>

<script type="text/javascript">
function validarCadastro(){
	var senha = document.formulario.senha.value;
	var passwd2 = document.formulario.passwd2.value;
	if (senha != passwd2){ 
	alert("As senhas não conferem. Repita a senha corretamente!");
	document.formulario.passwd2.focus();
	return false;
	}
	return true;
}

function validaCpf(){
	var cpf = document.formulario.cpf;
	if (cpf.value.length == 3 || cpf.value.length == 7) {
		cpf.value += ".";
	}
	if(cpf.value.length == 11){
		cpf.value += "-";
	}
}
function validaTelefone(){
	
	var tel = document.formulario.telefone;
	if (tel.value.length == 0) {
		tel.value += "(";
	}
	if (tel.value.length == 3) {
		tel.value += ")";
	}
	if (tel.value.length == 9) {
		tel.value += "-";
	}
}
function validaCep(){
var cep = document.formulario.cep;
if (cep.value.length == 5) {
	cep.value += "-";
}
}
function validaData(){
	var data = document.formulario.dataNascimento;
	if (data.value.length == 2) {
		data.value += "/";
	}
	if (data.value.length == 5) {
		data.value += "/";
	}
}
</script>


</head>
<body>
	<c:import url="/view/util/menu.jsp" />
	<!-- Formulario -->

	<br>
	<hr>
	<h1 align="center">Cadastro de Cliente</h1>
	<hr>
	<br>

	<fieldset>
		<legend>Informações Pessoais</legend>
		
		<div align="center"><h4 style="color:blue";>${msg}</h4></div>
		<form class="form-horizontal" action="cadastrarCliente" method="post"
			onsubmit="return validarCadastro();" name="formulario" id="formulario">
			<div class="form-group" align="left">
				<label for="exampleInputName" class="hora">Nome Completo:</label> <input
					type="text" class="form-control" id="exampleInputName"
					placeholder="João Melo Silva" style="width: 25%"
					;
					required="Para realizar o cadastro preencha este campo com o seu nome completo"
					maxlength="40" name="nome"
					pattern="[AÁÉÍÓÚÂÊÎÔÛ-ZáéíóúâêîôûçÁÉÍÓÚÂÊÎÔÛa-z ]+">

			</div>


			<div class="form-group">
				<label for="exampleInputName" class="hora">Nome do Usuário:</label>
				<input type="text" class="form-control" id="exampleInputName"
					placeholder="Mario15" pattern="[a-zA-Z0-9]+" style="width: 25%"
					;
					required="Para realizar o cadastro preencha este campo com seu nome de usuário"
					maxlength="15" name="nomeUsuario">
			</div>


			<div class="form-group">
				<label for="exampleInputCpf" class="hora">CPF:</label> <input
					type="text" class="form-control" id="exampleInputCpf"
					placeholder="000.000.000-00" min="14" maxlength="14"
					style="width: 25%"
					;
					required="Para realizar o cadastro preencha este campo com seu CPF"
					name="cpf" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}"
					onkeypress="validaCpf()">
			</div>
			<br> <br>

			<div class="form-group">
				<label for="exampleInputData">Data de Nascimento:</label> <input
					type="text" class="form-control" style="width: 25%"
					;
				id="exampleInputData"
					required="Para realizar o cadastro preencha este campo com sua data de nascimento"
					name="dataNascimento" onkeypress="validaData()" maxlength="10"
					placeholder="00/00/0000">
			</div>




			<div class="form-group">
				<label for="exampleInputTelefone" class="hora">Telefone:</label> <input
					type="text" class="form-control" id="exampleInputTelefone"
					placeholder="(00) 00000-0000" style="width: 25%"
					;
				required="Para realizar o cadastro preencha este campo com o endereço da sua rua"
					maxlength="15" name="telefone" onkeypress="validaTelefone()"
					pattern="\([0-9]{2}\) [0-9]{4,6}-[0-9]{3,4}$">
			</div>


			<div class="form-group">
				<label for="exampleInputEmail" class="hora">E-mail:</label> <input
					type="email" class="form-control" id="exampleInputEmail"
					style="width: 25%" ;
				placeholder="João@exemplo.com"
					required="Para realizar o cadastro preencha este campo com o seu email"
					pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" maxlength="50"
					name="email">
			</div>



			<div class="form-group">
				<label for="exampleInputEndereco" class="hora">Endereço:</label> <input
					type="text" class="form-control" id="exampleInputEndereco"
					style="width: 25%" ;
				placeholder="Rua Don Juno nº 425"
					required="required" maxlength="50" name="rua">
			</div>


			<div class="form-group">
				<label for="exampleInputName" class="hora">Complemento:</label> <input
					type="text" class="form-control" id="exampleInputName"
					style="width: 25%" ;
				placeholder="Casa" pattern="[a-zA-Z0-9]+"
					required="Para realizar o cadastro preencha este campo com o seu complemento"
					maxlength="15" name="complemento">
			</div>


			<div class="form-group">
				<label for="exampleInputEndereco" class="hora">Número do
					complemento:</label> <input type="text" class="form-control"
					id="exampleInputEndereco" style="width: 25%"
					;
				placeholder="Ex: 0000" required="required" maxlength="50"
					name="numero">
			</div>


			<div class="form-group">
				<label for="exampleInputEndereco" class="hora">Bairro:</label> <input
					type="text" class="form-control" id="exampleInputEndereco"
					style="width: 25%" ;
				placeholder="Ex: COHAB"
					required="required" maxlength="50" name="bairro">
			</div>


			<div class="form-group">
				<label for="exampleInputCep" class="hora">CEP:</label> <input
					type="text" class="form-control" id="exampleInputCep"
					placeholder="00000-000" style="width: 25%"
					;
				required="Para realizar o cadastro preencha este campo com o cep da sua rua"
					maxlength="9" name="cep" pattern="\d{5}-?\d{3}"
					onkeypress="validaCep()">
			</div>


			<div class="form-group">
				<label for="exampleInputPassword1" class="hora">Senha:</label> <input
					type="password" class="form-control" id="exampleInputPassword1"
					required="Para realizar o cadastro preencha este campo com sua senha"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"  minlength= "8" maxlength="32"
					name="senha" style="width: 25%" ; id="senha"
					title="A senha deve ter no mínimo 8 e 32 no máximo, que sejam de pelo menos um número e uma letra maiúscula e minúscula.">
			</div>


			<div class="form-group">

				<label for="exampleInputPassword1" class="hora">Repita sua
					senha:</label> <input type="password" class="form-control"
					id="exampleInputPassword1"
					required="Para realizar o cadastro preencha este campo repetindo novamente sua senha"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" style="width: 25%";
				 minlength="8" maxlength="32" id="passwd2"
					title="A senha deve ser igual a da campo anterior."
					name="passwd2">
			</div>




			<button type="reset" class="btn btn-warning">&nbsp; Limpar
				&nbsp;</button>
			&nbsp;
			<button type="submit" class="btn btn-success" onClick="validarCadastro()">Cadastrar</button>
		</form>

	</fieldset>

	<!-- jQuery (necessario para Bootsrap plungins Java Script) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="view/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>