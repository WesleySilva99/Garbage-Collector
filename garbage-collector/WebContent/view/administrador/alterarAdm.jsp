<%@ page language="java" contentType="text/html; charset=iso-8859-1"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="apple-touch-icon" sizes="76x76"
	href="view/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="view/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Alterar Administrador</title>
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
<div align="center">
	<hr><h3>Alterar Administrador</h3><hr>
	</div>

	<form  class="" action="alterarAdm" method="post" enctype="multipart/form-data">


<input type="hidden" name="id" value="${p.id}">
<div align="center">
					<div class="form-row">
						<div class="col-4">
							<label for="exampleInputName" class="hora">Nome Completo:</label>
							<input type="text" class="form-control" id="exampleInputName"
								placeholder="João Melo Silva" style="width: 50%"
								''
					required="Para realizar o cadastro preencha este campo com o seu nome completo"
								maxlength="40" name="nome" value="${p.nome}"
								pattern="[AÁÉÍÓÚÂÊÎÔÛ-ZáéíóúâêîôûçÁÉÍÓÚÂÊÎÔÛa-z ]+">
						</div>

						<div class="col-4">
							<label for="exampleInputTelefone" class="hora">Telefone:</label>
							<input type="text" class="form-control" id="exampleInputTelefone"
								placeholder="(00) 00000-0000" style="width: 50%"
								; 
				required="Para realizar o cadastro preencha este campo com o endereço da sua rua"
								maxlength="15" name="telefone" onkeypress="validaTelefone()"
								value="${p.telefone}">
						</div>

						<div class="col-4">
							<label for="exampleInputEmail" class="hora">E-mail:</label> <input
								type="email" class="form-control" id="exampleInputEmail"
								style="width: 50%" ;
				placeholder="João@exemplo.com" value="${p.email}"
								required="Para realizar o cadastro preencha este campo com o seu email"
								pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" maxlength="50"
								name="email">
						</div>
					</div>

						
  
     
     <button type="submit" class="btn btn-success">Alterar</button>
</form>
	</form>

</body>
</html>