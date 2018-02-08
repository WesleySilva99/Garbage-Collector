<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=iso-8859-1"
	pageEncoding="UTF-8"%>
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
<body>

<c:import url="/view/util/menu.jsp"/>
	<div class="container">
		<hr>
		<h2 align="center">Lista de Coletas Solicitadas</h2>
		<hr>
		<br>
		<div align="center"><h4 style="color:blue";>${msg}</h4></div>
		<table class="table table-striped">

			<tr>
				<th>Tipo da Coleta</th>
				<th>Descrição</th>
				<th>Quantidade</th>
				<th>Endereço da Coleta</th>
				<th>Número da Casa</th>
				<th>CEP</th>
				<th>Opções de coleta</th>
				


			</tr>


			<c:forEach var="u" items="${listaColeta}">


				<tr>
					<td>${u.tipoColeta}</td>
					<td>${u.descricao}</td>
					<td>${u.quantidade}</td>
					<td>${u.endereco}</td>
					<td>${u.numero}</td>
					<td>${u.cep}</td>

					<td><a href="cancelarColeta?id=${u.id}">Cancelar Coleta</a>|
					<a href="alteraColeta?id=${u.id}">Remarcar Coleta</a> &nbsp;</td>
					
				


					

				</tr>

			</c:forEach>
		</table>
	</div>

	<!-- jQuery (necessario para Bootsrap plungins Java Script) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="view/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>