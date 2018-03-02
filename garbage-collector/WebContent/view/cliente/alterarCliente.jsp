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
	
<div align="center">
	<hr><h3>Alterar Cliente</h3><hr>
	</div>

	<form  class="" action="alterarCliente2" method="post" enctype="multipart/form-data">



<div align="center">
  <div class="form-row">
    <div class="col-4">
    <label for="exampleInputName" class="hora">Nome Completo:</label>
      <input type="text" class="form-control" id="exampleInputName"
					placeholder="João Melo Silva" style="width: 50%"
					; value="${p.nome}"
					required="Para realizar o cadastro preencha este campo com o seu nome completo"
					maxlength="40" name="nome"
					pattern="[AÁÉÍÓÚÂÊÎÔÛ-ZáéíóúâêîôûçÁÉÍÓÚÂÊÎÔÛa-z ]+" >
    </div>
  <div class="col-4">
    <label for="exampleInputCpf" class="hora">CPF:</label>
      <input type="text" class="form-control" id="exampleInputCpf"
					placeholder="000.000.000-00" min="14" maxlength="14"
					style="width: 50%"
					; value="${p.cpf}"
					required="Para realizar o cadastro preencha este campo com seu CPF"
					name="cpf" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}"
					onkeypress="validaCpf()" >
    </div>
    
    <div class="col-4">
 <label for="exampleInputData">Data de Nascimento:</label>
      <input type="text" class="form-control"style="width: 50%"
					;
				id="exampleInputData"
					required="Para realizar o cadastro preencha este campo com sua data de nascimento"
					name="dataNascimento" onkeypress="validaData()" maxlength="10"
					placeholder="00/00/0000" value="<fmt:formatDate value="${p.dataNascimento}" pattern="dd/MM/yyyy" />">
    </div>
    
  </div>
  <!--     Fonts and icons     -->
  <div class="form-row">
    <div class="col-4">
    <label for="exampleInputTelefone" class="hora">Telefone:</label>
      <input type="text" class="form-control"  id="exampleInputTelefone"
					placeholder="(00) 00000-0000" style="width: 50%"
					; value="${p.telefone}"
				required="Para realizar o cadastro preencha este campo com o endereço da sua rua"
					maxlength="15" name="telefone" onkeypress="validaTelefone()"
					pattern="\([0-9]{2}\) [0-9]{4,6}-[0-9]{3,4}$" >
    </div>
    <div class="col-4">
    <label for="exampleInputEndereco" class="hora">Bairro:</label> <input
					type="text" class="form-control" id="exampleInputEndereco"
					style="width: 50%" ; value="${p.endereco.bairro}"
				placeholder="Ex: COHAB"
					required="required" maxlength="50" name="bairro">
    </div>
    
<div class="col-4">
    <label for="exampleInputEndereco" class="hora">Endereço:</label> <input
					type="text" class="form-control" id="exampleInputEndereco"
					style="width: 50%" ; value="${p.endereco.rua}"
				placeholder="Rua Don Juno nº 425"
					required="required" maxlength="50" name="rua">
    </div>
  </div>
  
  
  <!--     Fonts and icons     -->
  <div class="form-row">
 <div class="col-4">
    <label for="exampleInputName" class="hora">Complemento:</label> <input
					type="text" class="form-control" id="exampleInputName"
					style="width: 50%" ; value="${p.endereco.complemento}"
				placeholder="Casa" pattern="[a-zA-Z0-9]+"
					required="Para realizar o cadastro preencha este campo com o seu complemento"
					maxlength="15" name="complemento">
    </div>
 <div class="col-4">
    <label for="exampleInputEndereco" class="hora">Número do
					complemento:</label> <input type="text" class="form-control"
					id="exampleInputEndereco" style="width: 50%"
					; value="${p.endereco.numero}"
				placeholder="Ex: 0000" required="required" maxlength="50"
					name="numero">
    </div>
    <div class="col">
    <label for="exampleInputCep" class="hora">CEP:</label> <input
					type="text" class="form-control" id="exampleInputCep"
					placeholder="00000-000" style="width: 50%"
					; value="${p.endereco.cep}"
				required="Para realizar o cadastro preencha este campo com o cep da sua rua"
					maxlength="9" name="cep" pattern="\d{5}-?\d{3}"
					onkeypress="validaCep()">
    </div>
  </div>
  <!--     Fonts and icons     -->
  
  <div class="form-row">
  
    <div class="col-4">
    <label for="exampleInputName" class="hora">Nome do Usuário:</label>
      <input type="text" class="form-control" id="exampleInputName"
					placeholder="Mario15" pattern="[a-zA-Z0-9]+" style="width: 50%"
					; value="${p.login}"
					required="Para realizar o cadastro preencha este campo com seu nome de usuário"
					maxlength="15" name="nomeUsuario">
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