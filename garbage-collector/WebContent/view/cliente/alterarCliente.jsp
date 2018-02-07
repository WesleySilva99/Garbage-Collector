<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<hr><h3>Alterar Produto</h3><hr>
	

	<form  class="form-horizontal" action="alterarCliente2" method="post" enctype="multipart/form-data">

	<form action="alterarCliente2" method="post" enctype="multipart/form-data">


		<div class="form-group">
			<label for="inputCodigo">Nome</label>
			<input type="text" id="inputCodigo" class="form-control" name="nome" style="width: 25%;" maxlength="100" required="required" value="${p.nome}" />
			<input type="hidden" name="id" value="${p.id}" />
		</div>
		
		<div class="form-group">
			<label for="inputDescricao">CPF</label>


			<input type="text" id="inputDescricao" class="form-control" name="cpf" style="width: 25%;" maxlength="100" required="required" value="${p.cpf}" />

		</div>
		
		<p>
			Data de Nascimento: <br />
			<input type="text" name="dataNascimento" value="<fmt:formatDate value="${p.dataNascimento}" pattern="dd/MM/yyyy" />" />
		</p>
		
		<p>
			Login: <br />
			<input type="text" name="nomeUsuario" value="${p.nomeUsuario}" />
		</p>
		
		<p>
			senha: <br />
			<input type="text" name="senha" value="${p.senha}"/>
		</p>
		
		<p>
			Telefone: <br />
			<input type="text" name="telefone" value="${p.telefone}" />
		</p>
			<p>
			Email: <br />
			<input type="text" name="email" value="${p.email}" />
		</p>
		
		<p> <input type="submit" class="btn btn-primary" value="Alterar"> </p>
	</form>

</body>
</html>