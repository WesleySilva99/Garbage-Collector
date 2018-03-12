<%@ page language="java" contentType="text/html; charset=iso-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<title>Cadastro de Administradores</title>

<script type="text/javascript">
	function validarCadastro() {
		var senha = document.formulario.senha.value;
		var passwd2 = document.formulario.passwd2.value;
		if (senha != passwd2) {
			alert("As senhas não conferem. Repita a senha corretamente!");
			document.formulario.passwd2.focus();
			return false;
		}
		return true;
	}

	

	function validaTelefone() {

		var tel = document.formulario.telefone;
		if (tel.value.length == 0) {
			tel.value += "(";
		}
		if (tel.value.length == 3) {
			tel.value += ")";
		}
		if (tel.value.length == 4) {
			tel.value += " ";
		}

		if (tel.value.length == 10) {
			tel.value += "-";
		}
	}
	
	
	function validaEmail() {
		if (document.formulario.email.value == ""
				|| document.formulario.email.value.indexOf('@') == -1
				|| document.formulario.email.value.indexOf('.') == -1) {
			alert("Preencha corretamente o campo email!");
			document.formulario.email.focus();
			return false;
		}
	}
	
</script>


</head>
<body>
	<c:import url="/view/util/menu.jsp" />
	<!-- Formulario -->

	<br>
	<hr>
	<h1 align="center">Cadastro de Clientes</h1>
	<hr>
	<br>
	<center>
		<fieldset>
			<legend>Informações Pessoais</legend>


			<h4 style="color: blue";>${msg}</h4>
			</div>
			<form class="form-horizontal" action="cadastrarAdm" method="post"
				onsubmit="return validarCadastro();" name="formulario"
				id="formulario">

				<div align="center">
					<div class="form-row">
						<div class="col-4">
							<label for="exampleInputName" class="hora">Nome Completo:</label>
							<input type="text" class="form-control" id="exampleInputName"
								placeholder="João Melo Silva" style="width: 50%"
								''
					required="Para realizar o cadastro preencha este campo com o seu nome completo"
								maxlength="40" name="nome"
								pattern="[AÁÉÍÓÚÂÊÎÔÛ-ZáéíóúâêîôûçÁÉÍÓÚÂÊÎÔÛa-z ]+">
						</div>
					
						<div class="col-4">
							<label for="exampleInputTelefone" class="hora">Telefone:</label>
							<input type="text" class="form-control" id="exampleInputTelefone"
								placeholder="(00) 00000-0000" style="width: 50%"
								;
				required="Para realizar o cadastro preencha este campo com o endereço da sua rua"
								maxlength="15" name="telefone" onkeypress="validaTelefone()"
								>
						</div>

						<div class="col-4">
							<label for="exampleInputEmail" class="hora">E-mail:</label> <input
								type="email" class="form-control" id="exampleInputEmail"
								style="width: 50%" ;
				placeholder="João@exemplo.com"
								required="Para realizar o cadastro preencha este campo com o seu email"
								pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" maxlength="50"
								name="email">
						</div>
					</div>


							<label for="exampleInputName" class="hora">Login</label> <input type="text" class="form-control"
								id="exampleInputName" placeholder="Mario15"
								pattern="[a-zA-Z0-9]+" style="width: 50%"
								;
					required="Para realizar o cadastro preencha este campo com seu nome de usuário"
								maxlength="15" name="login">
						</div>
						<div class="col-4">
							<label for="exampleInputPassword1" class="hora">Senha:</label> <input
								type="password" class="form-control" id="exampleInputPassword1"
								required="Para realizar o cadastro preencha este campo com sua senha"
								pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" minlength="8"
								maxlength="32" name="senha" style="width: 50%" ; id="senha"
								title="A senha deve ter no mínimo 8 e 32 no máximo, que sejam de pelo menos um número e uma letra maiúscula e minúscula.">
						</div>
					</div>
					<!--     Fonts and icons     -->

					<div class="form-row">

						<div class="col-4">
							<label for="exampleInputPassword1" class="hora">Repita
								sua senha:</label> <input type="password" class="form-control"
								id="exampleInputPassword1"
								required="Para realizar o cadastro preencha este campo repetindo novamente sua senha"
								pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" style="width: 50%"
								;
				 minlength="8" maxlength="32" id="passwd2"
								title="A senha deve ser igual a da campo anterior."
								name="passwd2">
						</div>
					</div>



					<button type="reset" class="btn btn-warning">&nbsp; Limpar
						&nbsp;</button>
					&nbsp;
					<button type="submit" class="btn btn-success"
						onClick="validarCadastro()">Cadastrar</button>
			</form>

		</fieldset>
	</center>
	<!-- jQuery (necessario para Bootsrap plungins Java Script) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="view/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>