<%@ page language="java" contentType="text/html; charset=iso-8859-1"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<body>

	<c:import url="/view/util/menu.jsp" />

	<div align="center">
		<hr>
		<h3>Alterar Tipo da Coleta</h3>
		<hr>
	</div>
	<center>
		<form action="alterarTipoColeta" method="post">


			<input type="hidden" name="id" value="${p.id}">

			<div>


				<label for="exampleInputName" class="hora">Tipo da Coleta:</label> <input
					type="text" class="form-control" id="exampleInputName"
					placeholder="plastico" style="width: 25%" ; value="${p.descricao}"
					required="Para realizar o cadastro preencha este campo com o tipo da sua coleta"
					maxlength="45" name="descricao"
					pattern="[AÁÉÍÓÚÂÊÎÔÛ-ZáéíóúâêîôûçÁÉÍÓÚÂÊÎÔÛa-z ]+">

			</div>
			<br>
			<br>


			<button type="submit" class="btn btn-success">Alterar</button>
		</form>
	</center>

</body>
</html>