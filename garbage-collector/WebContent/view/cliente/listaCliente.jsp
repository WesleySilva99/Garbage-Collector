<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
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
	<div class="container">
		<h2 align="middle">Lista de Usuários</h2><br>
		<table class="table table-striped">

			<tr>
				<th>Nome</th>
				<th>Nome de Usuario</th>
				<th>CPF</th>
				<th>Data de Nascimento</th>
				<th>CEP</th>
				<th>Endereço</th>
				<th>Complemento</th>
				<th>Telefone</th>
				<th>Email</th>
				
			</tr>


			<jsp:useBean id="dao" class="br.com.nasa.model.ClienteDao" />
			<c:forEach var="u" items="${dao.listar()}">


				<tr>
					<td>${u.nome}</td>
					<td>${u.nomeUsuario}</td>
					<td>${u.cpf}</td>
					<td><fmt:formatDate value="${u.dataNascimento}"
							pattern="dd/MM/yyyy" /></td>
					<td>${u.cep}</td>
					<td>${u.endereco}</td>
					<td>${u.complemento}</td>
					<td>${u.telefone}</td>
					<td>${u.email}</td>
					
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