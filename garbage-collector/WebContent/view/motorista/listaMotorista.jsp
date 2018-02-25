<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=iso-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Lista de Motorista</title>

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
		<h2 align="middle">Lista de Motorista</h2>
		<br>
		<table class="table table-striped">

			<tr>
				<th>Nome</th>
				<th>Telefone</th>
				<th>CPF</th>
				<th>Rg</th>
				<th>Sexo</th>
				<th>Número da Habilitação</th>
				<th>Validade da Habilitação</th>
				<th>Categoria</th>
				<th>Chassi</th>
				<th>Placa do veiculo</th>
				<th>Marca do veiculo</th>
				<th>Ano do veiculo</th>
				<th>Login</th>
				<th>Senha</th>
				<th>Rua</th>
				<th>Bairro</th>
				<th>Cep</th>
				<th>Número</th>
				<th>Complemento</th>
				<th>Ações de Motorista</th>
				
				

			</tr>


			<c:forEach var="u" items="${listaMotorista}">


				<tr>
					<td>${u.nome}</td>
					<td>${u.telefone}</td>
					<td>${u.cpf}</td>
					<td>${u.rg}</td>
					<td>${u.sexo}</td>
					<td>${u.numHabilitacao}</td>
					<td><fmt:formatDate value="${u.validade}"
							pattern="dd/MM/yyyy" /></td>
					<td>${u.categoria}</td>
					<td>${u.veiculo.chasi}</td>
					<td>${u.veiculo.placa}</td>
					<td>${u.veiculo.marca}</td>
					<td>${u.veiculo.anoVeiculo}</td>
					<td>${u.login}</td>
					<td>${u.senha}</td>
					<td>${u.endereco.rua}</td>
					<td>${u.endereco.bairro}</td>
					<td>${u.endereco.cep}</td>
					<td>${u.endereco.numero}</td>
					<td>${u.endereco.complemento}</td>
					<td><a href="pegarMotorista?id=${u.id}">Alterar</a> &nbsp;|
					<a href="removerMotorista?id=${u.id}">Remover</a></td>

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