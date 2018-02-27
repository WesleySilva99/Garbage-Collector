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

<title>Página de Login</title>




</head>
<body>
	<c:import url="/view/util/menu.jsp" />
	<!-- Formulario -->

	<br>
	<hr>
	<h1 align="center">Tela de Login</h1>
	<hr>
	<br>
	<center>
		<fieldset>
			<legend>Login</legend>


			<h4 style="color: blue";>${msg}</h4>



			<form class="form-horizontal" action="efetuarLogin" method="post"
				name="formulario" id="formulario">

				<div class="col-4">
				<label for="exampleInputName" class="hora">Login:</label> <input
					type="text" class="form-control" id="exampleInputName"
					placeholder="Mario15" pattern="[a-zA-Z0-9]+" style="width: 50%"
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
				<br><br>




				<button type="submit" class="btn btn-success"
					onClick="validarCadastro()">Logar</button>
			</form>

		</fieldset>
	</center>
	<!-- jQuery (necessario para Bootsrap plungins Java Script) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="view/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>