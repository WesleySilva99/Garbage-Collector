<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Lista de Clientes</title>

<!-- Bootstrap -->
<link href="view/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<c:import url="/view/util/menu.jsp"/>
	<div class="container">
		<h2 align="middle">Lista de Usuários</h2>
		<br>
		<table class="table table-striped">

			<tr>
				<th>ID</th>
				<th>Nome</th>
				<th>Cpf</th>
				<th>Data de Nascimento</th>
				<th>login</th>
				<th>telefone</th>
				<th>Email</th>
				<th>Alterar/Remover</th>
				<th>Senha</th>
				<th>Rua</th>
				<th>Bairro</th>
				<th>Cep</th>
				<th>Número</th>
				<th>Complemento</th>


			</tr>


			<c:forEach var="u" items="${listaCliente}">


				<tr>
					<td>${u.id}</td>
					<td>${u.nome}</td>
					<td>${u.cpf}</td>
					<td><fmt:formatDate value="${u.dataNascimento}"
							pattern="dd/MM/yyyy" /></td>
					<td>${u.nomeUsuario}</td>
					<td>${u.telefone}</td>
					<td>${u.email}</td>

					<td><a href="alterarCliente?id=${u.id}">Alterar</a> &nbsp;</td>
					
					<td>${u.senha}</td>
				


					

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