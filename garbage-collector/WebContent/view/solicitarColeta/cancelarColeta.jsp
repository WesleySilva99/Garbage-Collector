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
<meta name="description" content="Free Bootstrap Theme by BootstrapMade.com">
  <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/style.css">
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
					<td>${u.tipocoleta.descricao}</td>
					<td>${u.descricao}</td>
					<td>${u.quantidade}</td>
					<td>${u.endereco}</td>
					<td>${u.numero}</td>
					<td>${u.cep}</td>

					<td><a href="cancelarColeta?id=${u.id}" class="label label-warning">Cancelar Coleta</a>|
					<a href="alteraColeta?id=${u.id}" class="btn btn-info btn-xs">Remarcar Coleta</a> &nbsp;</td>
					
				


					

				</tr>

			</c:forEach>
		</table>
	</div>

	<!-- jQuery (necessario para Bootsrap plungins Java Script) -->
		<script src="view/novoTemplate/js/jquery.min.js"></script>
  <script src="view/novoTemplate/js/jquery.easing.min.js"></script>
  <script src="view/novoTemplate/js/bootstrap.min.js"></script>
  <script src="view/novoTemplate/js/custom.js"></script>
  <script src="view/novoTemplate/contactform/contactform.js"></script>
</body>
</html>