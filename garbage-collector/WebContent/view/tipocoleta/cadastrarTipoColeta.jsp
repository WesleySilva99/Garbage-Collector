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

<title>Cadastro de Usuário</title>

<script type="text/javascript">
	
</script>


</head>
<body>
	<c:import url="/view/util/menu.jsp" />
	<!-- Formulario -->

	<br>
	<hr>
	<h1 align="center">Cadastro de Tipos de Coletas</h1>
	<hr>
	<br>
	<center>



		<h4 style="color: blue";>${msg}</h4>
		</div>
		<form class="form-horizontal" action="cadastrarTipoColeta"
			method="post" onsubmit="return validarCadastro();" name="formulario"
			id="formulario">

			
				
					<div class="col-4">
						<label for="exampleInputName" class="hora">Tipo da Coleta:</label>
						<input type="text" class="form-control" id="exampleInputName"
							placeholder="Plástico" style="width: 50%"
							''
					required="Para realizar o cadastro preencha este campo com o tipo da coleta desejado"
							maxlength="40" name="descricao"
							pattern="[AÁÉÍÓÚÂÊÎÔÛ-ZáéíóúâêîôûçÁÉÍÓÚÂÊÎÔÛa-z ]+">
					</div>
				
			
			<br><br><br>



			<button type="reset" class="btn btn-warning">&nbsp; Limpar
				&nbsp;</button>
			&nbsp;
			<button type="submit" class="btn btn-success"
				onClick="validarCadastro()">Cadastrar</button>
		</form>

		
	</center>
	<!-- jQuery (necessario para Bootsrap plungins Java Script) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="view/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>