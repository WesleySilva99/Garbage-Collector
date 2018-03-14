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

	<c:import url="/view/util/menu.jsp" />
	<div class="container">
		<hr>
		<h2 align="center">Lista de Administradores</h2>
		<hr>
		<br>
		<h4 style="color: blue";>${msg}</h4>
		<table class="table table-striped">

			<tr>
				<th>Nome</th>
				<th>login</th>
				<th>telefone</th>
				<th>Email</th>
				<th>Alterar/Remover</th>
				
			</tr>


			<c:forEach var="u" items="${listaAdm}">


				<tr>
					<td>${u.nome}</td>
					<td>${u.login}</td>
					<td>${u.telefone}</td>
					<td>${u.email}</td>
					
					
					
					
					
					
					<td><a href="ExibitalterarAdm?id=${u.id}">Alterar</a> &nbsp;|
					<a href="removerAdm?id=${u.id}">Remover</a> &nbsp;</td>
 
				</tr>



			</c:forEach>
		</table>
	</div>





	<!-- jQuery (necessario para Bootsrap plungins Java Script) -->
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="view/assets/js/now-ui-kit.js"></script>
		<script src="view/assets/js/plugins/bootstrap-datepicker.js"></script>
		<script src="view/assets/js/plugins/bootstrap-switch.js"></script>
		<script src="view/assets/js/plugins/jquery.sharrre.js"></script>
		<script src="view/assets/js/plugins/nouislider.min.js"></script>
	<script src="view/bootstrap/js/bootstrap.min.js"></script>
	
	
</body>
</html>