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
<meta name="description" content="Free Bootstrap Theme by BootstrapMade.com">
  <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/style.css">
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
	 <script src="view/novoTemplate/js/jquery.min.js"></script>
  <script src="view/novoTemplate/js/jquery.easing.min.js"></script>
  <script src="view/novoTemplate/js/bootstrap.min.js"></script>
  <script src="view/novoTemplate/js/custom.js"></script>
  <script src="view/novoTemplate/contactform/contactform.js"></script>
</body>
</html>