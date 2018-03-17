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
<title>Listar Administradores</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
 <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/style.css">
</head>
<body>

	<c:choose>
					<c:when test="${AdmLogado != null}">
					</c:when>
					<c:otherwise>
                	<c:import url="/view/util/menu.jsp" />
                	</c:otherwise>
					</c:choose>
	<c:if test="${AdmLogado != null}">
	<c:import url="/view/util/menuLateral.jsp" />
	</c:if>
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
					
					
					
					
					
					
					<td><a href="ExibitalterarAdm?id=${u.id} " class='btn btn-info btn-xs'><span class="fa fa-edit" >Alterar</a></span> &nbsp;|
					<a href="removerAdm?id=${u.id}" class="btn btn-danger btn-xs"><span class="	fa fa-close">Remover</a></span> &nbsp;</td>
 
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