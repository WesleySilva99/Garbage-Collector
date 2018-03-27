<%@ page language="java" contentType="text/html; charset=iso-8859-1"
	pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastrar Cliente</title>
<meta name="description" content="Free Bootstrap Theme by BootstrapMade.com">
  <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/style.css">
  
  <script type="text/javascript">
	function validarCadastro() {
		var senha = document.formulario.usuario.senha.value;
		var passwd2 = document.formulario.passwd2.value;
		if (senha != passwd2) {
			alert("As senhas não conferem. Repita a senha corretamente!");
			document.formulario.passwd2.focus();
			return false;
		}
		return true;
	}

	function validaCpf() {
		var cpf = document.formulario.cpf;
		if (cpf.value.length == 3 || cpf.value.length == 7) {
			cpf.value += ".";
		}
		if (cpf.value.length == 11) {
			cpf.value += "-";
		}
	}

	function validaRG() {

		var rg = document.formulario.rg;
		if (rg.value.length == 1 || rg.value.length == 5) {
			rg.value += ".";
		}
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
<div class="panel panel-primary" style="    border-color: rgba(0,0,0,.5);">
    <div class="panel-heading" align="center" style="    background-color: rgba(0,0,0,.5);
    border-color: #aa2b2b;">Cadastro de Usuario</div>
    
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
    <c:if test="${msg ne null}">
     <div align="center">
    <h4 style="color: blue";>${msg}</h4>
  </div>
  </c:if>
    <div id="newpost">
   <div class="form-group">
    <div class="col-md-3 control-label">
        <h3>Informações Pessoais</h3>
    </div>
    </div>
    
<div class="col-md-11 control-label">
        <p class="help-block"><h11>*</h11> Campo Obrigatório </p>
</div>
</div>

<form class="form-horizontal" action="cadastrarCliente" method="post"
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

<!-- Text input-->
<div class="form-group">
  <label class="col-md-2 control-label" for="exampleInputCpf">CPF <h11>*</h11></label>  
  <div class="col-md-2">
  <input id="exampleInputCpf" name="cpf" placeholder="000.000.000-00" min="14" maxlength="14" class="form-control input-md" required="Para realizar o cadastro preencha este campo com seu CPF" type="text" maxlength="11" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}" onkeypress="validaCpf()" >
  </div>

  
  
  
  <label class="col-md-1 control-label" for="Nome"> Data de Nascimento<h11>*</h11></label>  
  <div class="col-md-2">
  <input id="dataNascimento" name="dataNascimento" placeholder="DD/MM/AAAA" class="form-control input-md" required="" type="text" maxlength="10" OnKeyPress="formatar('##/##/####', this)" onBlur="showhide()"value="<fmt:formatDate value='${p.dataNascimento}' pattern='dd/MM/yyyy' />">
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


<!-- Search input-->
<div class="form-group">
  <label class="col-md-2 control-label" for="CEP">CEP <h11>*</h11></label>
  <div class="col-md-2">
    <input  name="endereco.cep" id="exampleInputCep"  placeholder="Apenas numero"  class="form-control input-md" required="Para realizar o cadastro preencha este campo com o cep da sua rua" value="" type="search" maxlength="8" pattern="[0-9]+$" onkeypress="validaCep()">
  </div>
  <div class="col-md-2">
      <button type="button" class="btn btn-primary" style="background-color: rgba(0,0,0,.5); border-color: rgba(0,0,0,.0001);" onclick="pesquisacep(getElementById('exampleInputCep').value)">Pesquisar</button>
    </div>
    <div class="col-md-3">
    <div class="input-group">
      <span class="input-group-addon">Complemento <h11>*</h11></span>
      <input class="form-control" type="text"  id="exampleInputName"
								
				placeholder="Casa"
								pattern="[a-zA-Z0-9]+"
								required="Para realizar o cadastro preencha este campo com o seu complemento"
								maxlength="15" name="endereco.complemento">
    </div>
    
  </div>
</div>

<!-- Prepended text-->
<div class="form-group">
  <label class="col-md-2 control-label" for="prependedtext">Endereço</label>
  <div class="col-md-4">
    <div class="input-group">
      <span class="input-group-addon">Rua</span>
      <input id="rua" name="endereco.rua" class="form-control" placeholder="" required="" readonly="readonly" type="text">
    </div>
    
  </div>
    <div class="col-md-2">
    <div class="input-group">
      <span class="input-group-addon">Nº <h11>*</h11></span>
      <input class="form-control" type="text" 
								id="exampleInputEndereco" 
				placeholder="Ex: 0000" required="required" maxlength="50"
								name="endereco.numero">
    </div>
    
  </div>
  
  <div class="col-md-3">
    <div class="input-group">
      <span class="input-group-addon">Bairro</span>
      <input id="bairro" name="endereco.bairro" class="form-control" placeholder="" required="" readonly="readonly" type="text">
    </div>
    
  </div>
</div>
<br>
<br>
<div align="center">
<p class="help-block"><h11>*</h11> Informe um Login e Senha para acessar o sistema. </p>
</div>


</div><!-- Text input-->
<div class="form-group">
  <label class="col-md-2 control-label" for="Nome">Login:<h11>*</h11></label>  
  <div class="col-md-2">
  <input   class="form-control input-md" type="text" 
								id="exampleInputName" placeholder="Mario15"
								pattern="[a-zA-Z0-9]+" 
					required="Para realizar o cadastro preencha este campo com seu nome de usuário"
								maxlength="10" name="usuario.login" >
  </div>

  
  <label class="col-md-1 control-label" for="Nome">Senha: <h11>*</h11></label>  
  <div class="col-md-2">
  <input class="form-control input-md" type="password"  id="exampleInputPassword1"
								required="Para realizar o cadastro preencha este campo com sua senha"
								pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" minlength="8"
								maxlength="32" name="usuario.senha"  id="senha"
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

  
  <!--/ footer-->

 <script src="view/novoTemplate/js/jquery.min.js"></script>
  <script src="view/novoTemplate/js/jquery.easing.min.js"></script>
  <script src="view/novoTemplate/js/bootstrap.min.js"></script>
  <script src="view/novoTemplate/js/custom.js"></script>
  <script src="view/novoTemplate/contactform/contactform.js"></script>

</body>

</html>