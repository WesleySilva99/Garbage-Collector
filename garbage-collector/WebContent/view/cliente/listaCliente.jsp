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
<meta name="description"
	content="Free Bootstrap Theme by BootstrapMade.com">
<meta name="keywords"
	content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal">
<link rel="stylesheet" type="text/css"
	href="view/novoTemplate/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="view/novoTemplate/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="view/novoTemplate/css/style.css">

</head>
<body>

	<br>
	<br>
	<br>


	<div style="left: 1000px;">
		<c:import url="/view/util/menu.jsp" />
		<div class="container">
			<hr>
			<h2 align="center">Lista de Usuários</h2>
			<hr>
			<br>
			<table class="table table-striped">

				<tr>
					<th>Nome</th>
					<th>Cpf</th>
					<th>Data de Nascimento</th>
					<th>login</th>
					<th>telefone</th>
					<th>Email</th>
					<th>Alterar/Remover</th>
					<th>Detalhes</th>
				</tr>


				<c:forEach var="u" items="${listaCliente}">


					<tr>
						<td>${u.nome}</td>
						<td>${u.cpf}</td>
						<td><fmt:formatDate value="${u.dataNascimento}"
								pattern="dd/MM/yyyy" /></td>
						<td>${u.login}</td>
						<td>${u.telefone}</td>
						<td>${u.email}</td>








						<td><a href="alterarCliente?id=${u.id}"
							class='btn btn-info btn-xs'><span class="fa fa-edit" >Alterar</a></span> &nbsp; <a
							href="#" class="btn btn-danger btn-xs" ><span class="	fa fa-close"> Remover</a></span></td>
						<td onclick="myFunction(this)"><h4 style="margin-top: 5px;">
								<span class="label label-success  " >detalhes</span>
							</h4></td>
					</tr>

					<div class="modal fade item_view" id="item_view">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<a href="#" data-dismiss="modal" class="class pull-right"><span
										class="glyphicon glyphicon-remove"></span></a>
									<h3 class="modal-title">Informações</h3>
								</div>
								<div class="modal-body">
									<div class="row">

										<div class="col " align="center">


											<strong>nome: </strong>${u.nome} <br> <br> <strong>cpf:
											</strong> ${u.cpf} <br> <br> <strong>data
												nascimento: </strong>
											<fmt:formatDate value="${u.dataNascimento}"
												pattern="dd/MM/yyyy" />
											<br> <br> <strong> usuario: </strong>${u.login} <br>
											<br> <strong> telefone: </strong> ${u.telefone} <br>
											<br> <strong> email: </strong> ${u.email} <br> <br>
											<strong>rua: </strong> ${u.endereco.rua} <br> <br>
											<strong> bairro: </strong> ${u.endereco.bairro} <br> <br>
											<strong>cep: </strong> ${u.endereco.cep} <br> <br>
											<strong>complemento: </strong> ${u.endereco.complemento} <br>
											<br> <strong>numero: </strong>${u.endereco.numero}

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</c:forEach>
			</table>
		</div>

	</div>





	<!-- jQuery (necessario para Bootsrap plungins Java Script) -->
	<script src="view/novoTemplate/js/jquery.min.js"></script>
	<script src="view/novoTemplate/js/jquery.easing.min.js"></script>
	<script src="view/novoTemplate/js/bootstrap.min.js"></script>
	<script src="view/novoTemplate/js/custom.js"></script>
	<script src="view/novoTemplate/contactform/contactform.js"></script>


</body>
</html>