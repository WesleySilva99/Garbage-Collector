<%@ page language="java" contentType="text/html; charset=iso-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="apple-touch-icon" sizes="76x76"
	href="view/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="view/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Garbage Collector</title>
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/style.css">
</head>

<title>Cadastro de Administradores</title>

<script type="text/javascript">
	function validarCadastro() {
		var senha = document.formulario.senha.value;
		var passwd2 = document.formulario.passwd2.value;
		if (senha != passwd2) {
			alert("As senhas não conferem. Repita a senha corretamente!");
			document.formulario.passwd2.focus();
			return false;
		}
		return true;
	}

	

	function validaTelefone() {

		var tel = document.formulario.telefone;
		if (tel.value.length == 0) {
			tel.value += "(";
		}
		if (tel.value.length == 3) {
			tel.value += ")";
		}
		if (tel.value.length == 4) {
			tel.value += " ";
		}

		if (tel.value.length == 10) {
			tel.value += "-";
		}
	}
	
	
	function validaEmail() {
		if (document.formulario.email.value == ""
				|| document.formulario.email.value.indexOf('@') == -1
				|| document.formulario.email.value.indexOf('.') == -1) {
			alert("Preencha corretamente o campo email!");
			document.formulario.email.focus();
			return false;
		}
	}
	
</script>


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
 
<fieldset>

<br>
<br>
<br>
<div class="panel panel-primary" style="    border-color: rgba(0,0,0,.5); margin-left: 250px;
    margin-right: 30px;
    margin-top: 50px;">
    <div class="panel-heading" align="center" style="    background-color: rgba(0,0,0,.5);
    border-color: #aa2b2b;">Cadastro Administrador</div>
    
    <div class="panel-body">
<div class="form-group">
<!--
<div class="form-group">   
<div class="col-md-4 control-label">
    <img id="logo" src="http://blogdoporao.com.br/wp-content/uploads/2016/12/Faculdade-pitagoras.png"/>
</div>
<div class="col-md-4 control-label">
    <h1>Cadastro de Cliente</h1>
    
</div>
</div>
    -->
    <div id="newpost">
   <div class="form-group">
    <div class="col-md-3 control-label">
        <h3>Informações Pessoais</h3>
    </div>
    </div>
    <div align="center">
    <h4 style="color: blue";>${msg}</h4>
  </div>
<div class="col-md-11 control-label">
        <p class="help-block"><h11>*</h11> Campo Obrigatório </p>
</div>
</div>

<form class="form-horizontal" action="cadastrarAdm" method="post"
				onsubmit="return validarCadastro();" name="formulario"
				id="formulario">

<!-- Text input-->
<div class="form-group">
  <label class="col-md-2 control-label" for="exampleInputName">Nome <h11>*</h11></label>  
  <div class="col-md-8">
  <input id="exampleInputName" name="nome" placeholder="" class="form-control input-md" required="" type="text" placeholder="João Melo Silva"
                
          required="Para realizar o cadastro preencha este campo com o seu nome completo"
                maxlength="40" name="nome"
                pattern="[AÁÉÍÓÚÂÊÎÔÛ-ZáéíóúâêîôûçÁÉÍÓÚÂÊÎÔÛa-z ]+" >
  </div>
</div>



<!-- Multiple Radios (inline) -->



<!-- Prepended text-->
<div class="form-group">
  <label class="col-md-2 control-label" for="prependedtext">Telefone <h11>*</h11></label>
  <div class="col-md-2">
    <div class="input-group">
      <span class="input-group-addon"><i class="fa fa-tablet"></i></span>
      <input class="form-control" type="text"  id="exampleInputTelefone"
								placeholder="(00) 00000-0000"
				required="Para realizar o cadastro preencha este campo com o endereço da sua rua"
								maxlength="15" name="telefone" onkeypress="validaTelefone()"
								>
    </div>
  </div>
  
   

<!-- Prepended text-->
<div class="form-group">
  <label class="col-md-2 control-label" for="prependedtext">Email <h11>*</h11></label>
  <div class="col-md-4">
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
      <input class="form-control" 
								type="email" id="exampleInputEmail"
								
				placeholder="João@exemplo.com"
								required="Para realizar o cadastro preencha este campo com o seu email"
								pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" maxlength="50"
								name="email"  >
    </div>
  </div>
</div>



</div><!-- Text input-->
<div class="form-group">
  <label class="col-md-2 control-label" for="Nome">Login:<h11>*</h11></label>  
  <div class="col-md-2">
  <input   class="form-control input-md" type="text" 
								id="exampleInputName" placeholder="Mario15"
								pattern="[a-zA-Z0-9]+" 
					required="Para realizar o cadastro preencha este campo com seu nome de usuário"
								maxlength="15" name="login" >
  </div>

  
  <label class="col-md-1 control-label" for="Nome">Senha: <h11>*</h11></label>  
  <div class="col-md-2">
  <input class="form-control input-md" type="password"  id="exampleInputPassword1"
								required="Para realizar o cadastro preencha este campo com sua senha"
								pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" minlength="8"
								maxlength="32" name="senha"  id="senha"
								title="A senha deve ter no mínimo 8 e 32 no máximo, que sejam de pelo menos um número e uma letra maiúscula e minúscula." >
  </div>
  
  <label class="col-md-1 control-label" for="Nome"> Repitir Senha: <h11>*</h11></label>  
  <div class="col-md-2">
  <input  class="form-control input-md" type="password" 
								id="exampleInputPassword1"
								required="Para realizar o cadastro preencha este campo repetindo novamente sua senha"
								pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
				 minlength="8" maxlength="32" id="passwd2"
								title="A senha deve ser igual a da campo anterior."
								name="passwd2">
  </div>
</div>

 

<!-- Select Basic -->
<br>
<br>
<div align="center">
<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-2 control-label" for="Cadastrar"></label>
  <div class="col-md-8">
    <button class="btn btn-success" style="background-color: #2c8972;
    border-color: #2c8972;" type="Submit">Cadastrar</button>
    <button id="Cancelar" name="Cancelar" class="btn btn-danger" style="background-color: #b72d29;
    border-color: #b72d29;" type="Reset">Cancelar</button>
  </div>
</div>

</div>
</div>
</div>

</fieldset>
</form>
	
	
	
	
	<!-- jQuery (necessario para Bootsrap plungins Java Script) -->
	<script src="view/novoTemplate/js/jquery.min.js"></script>
  <script src="view/novoTemplate/js/jquery.easing.min.js"></script>
  <script src="view/novoTemplate/js/bootstrap.min.js"></script>
  <script src="view/novoTemplate/js/custom.js"></script>
  <script src="view/novoTemplate/contactform/contactform.js"></script>
</body>
</html>