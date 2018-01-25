<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Cadastro de Usuário</title>

<!-- Bootstrap -->
<link href="view/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript">
function validarCadastro(form){
	var senha = document.formulario.senha.value;
	var senhaRepetida = document.formulario.passwd2.value;
	var email = document.formulario.email.value;
	if (senha != senhaRepetida){ 
	alert("As senhas não conferem. Repita a senha corretamente!");
	document.formulario.passwd2.focus();
	return false;
	}
	if (senha.length < 8 || senha.length > 32) {
    	alert("As senhas estão abaixo ou acima do limite de caracteres! Senhas de 8 até 32 caracteres!");
        document.formulario.passwd2.focus();
        return false;
    }
	if (email == "" || email.indexOf('@')==-1 || email.indexOf('.')==-1 ){
    	alert ("Preencha corretamente o campo email!");
    	document.formulario.email.focus();
    	return false;
    }
}

</script>
<style type="text/css">
label.hora {

    display: inline-block;
    width: 120px;
}
</style>

</head>
<body>
	<!-- Formulario -->

	<br>
	<hr>
	<h1 align="center">Cadastro de Cliente</h1>
	<hr>
	<br>

	<fieldset>
    <legend>Informações Pessoais</legend>
	<form class="form-inline" action="cadastrarCliente" method="post" onsubmit="return validarSenha();" name="formulario">
		<div class="form-group">
			<label for="exampleInputName" class="hora">Nome Completo:</label> <input
				type="text" class="form-control" id="exampleInputName"
				placeholder="João Melo Silva"
				required="Para realizar o cadastro preencha este campo com o seu nome completo"
				maxlength="40" name="nome" style="width: 200px;"
				pattern="[AÁÉÍÓÚÂÊÎÔÛ-ZáéíóúâêîôûçÁÉÍÓÚÂÊÎÔÛa-z ]+">

		</div>
		<br> <br>

		<div class="form-group">
			<label for="exampleInputName" class="hora">Nome do Usuário:</label> <input
				type="text" class="form-control" id="exampleInputName"
				placeholder="Mario15" pattern="[a-zA-Z0-9]+" style="width: 200px;"
				required="Para realizar o cadastro preencha este campo com seu nome de usuário"
				maxlength="15" name="nomeUsuario">
		</div>
		<br> <br>

		<div class="form-group">
			<label for="exampleInputCpf" class="hora">CPF:</label> <input type="text"
				class="form-control" id="exampleInputCpf" style="width: 200px;"
				placeholder="000.000.000-00" min="14" maxlength="14"
				required="Para realizar o cadastro preencha este campo com seu CPF"
				name="cpf" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}"
				onkeypress="this.value = mascaraCpf(event)">
		</div>
		<br> <br>

		<div class="form-group">
			<label for="exampleInputData" class="hora" >Data de Nascimento:</label> <input
				type="text" class="form-control date-time-mask"
				id="exampleInputData" style="width: 200px;"
				required="Para realizar o cadastro preencha este campo com sua data de nascimento"
				name="dataNascimento" pattern="[0-9]{2}\/[0-9]{2}\/[0-9]{4}$"
				maxlength="10" min="1943-01-01" max="2008-12-12" placeholder="00/00/0000">
		</div>
		<br> <br>

		

		<div class="form-group" >
			<label for="exampleInputTelefone" class="hora">Telefone:</label> <input
				type="text" class="form-control" id="exampleInputTelefone"
				placeholder="(00) 00000-0000" style="width: 200px;"
				required="Para realizar o cadastro preencha este campo com o endereço da sua rua"
				maxlength="15" name="telefone"
				pattern="\([0-9]{2}\) [0-9]{4,6}-[0-9]{3,4}$">
		</div>
		<br> <br>

		<div class="form-group">
			<label for="exampleInputEmail" class="hora">E-mail:</label> <input type="email"
				class="form-control" id="exampleInputEmail"
				placeholder="João@exemplo.com" style="width: 200px;"
				required="Para realizar o cadastro preencha este campo com o seu email"
				pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" maxlength="50"
				name="email">
		</div>
		<br> <br>
		
		<div class="form-group" >
			<label for="exampleInputCep" class="hora">CEP:</label> <input type="text"
				class="form-control" id="exampleInputCep" placeholder="00000-000"
				maxlength="9" style="width: 200px;"
				required="Para realizar o cadastro preencha este campo com o cep da sua rua"
				maxlength="9" name="cep" pattern="\d{5}-?\d{3}">
		</div>
		<br> <br>
		
		<div class="form-group">
			<label for="exampleInputEndereco" class="hora">Endereço:</label> <input
				type="text" class="form-control" id="exampleInputEndereco"
				placeholder="Rua Don Juno nº 425" required="required" maxlength="50"
				name="rua" style="width: 200px;">
		</div>
		<br> <br>
		
		<div class="form-group">
			<label for="exampleInputEndereco" class="hora">Número:</label> <input
				type="text" class="form-control" id="exampleInputEndereco"
				placeholder="Ex: 0000" required="required" maxlength="50"
				name="numero" style="width: 200px;">
		</div>
		<br> <br>
		
		<div class="form-group">
			<label for="exampleInputEndereco" class="hora">Bairro:</label> <input
				type="text" class="form-control" id="exampleInputEndereco"
				placeholder="Ex: COHAB" required="required" maxlength="50"
				name="bairro" style="width: 200px;">
		</div>
		<br> <br>
		<div class="form-group">
			<label for="exampleInputName" class="hora">Complemento:</label> <input
				type="text" class="form-control" id="exampleInputName"
				placeholder="Casa" pattern="[a-zA-Z0-9]+" style="width: 200px;"
				required="Para realizar o cadastro preencha este campo com o seu complemento"
				maxlength="15" name="complemento">
		</div>
		<br> <br>

		<div class="form-group" >
			<label for="exampleInputPassword1" class="hora">Senha:</label> <input
				type="password" class="form-control" id="exampleInputPassword1"
				required="Para realizar o cadastro preencha este campo com sua senha"
				pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" maxlength="30"
				name="senha" style="width: 200px;"
				title="A senha deve ter no mínimo 8 e 32 no máximo, que sejam de pelo menos um número e uma letra maiúscula e minúscula.">
		</div>
		<br> <br>

		<div class="form-group">
			<label for="exampleInputPassword1" class="hora">Repita sua senha:</label> <input
				type="password" class="form-control" id="exampleInputPassword1"
				required="Para realizar o cadastro preencha este campo repetindo novamente sua senha"
				pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"  style="width: 200px;"
				maxlength="32" title="A senha deve ser igual a da campo anterior."
				oninput="validaCadastro(this)" name="passwd2">
		</div>
		<br> <br>


		<button type="reset" class="btn btn-warning"> &nbsp; Limpar &nbsp;</button> &nbsp;
		<button type="submit" class="btn btn-success">Cadastrar</button>
	</form>
	
	</fieldset>

	<!-- jQuery (necessario para Bootsrap plungins Java Script) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="view/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>