<%@ page language="java" contentType="text/html; charset=iso-8859-1"
	pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastrar Motorista</title>
<meta name="description" content="Free Bootstrap Theme by BootstrapMade.com">
  <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/style.css">
  
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
<div class="panel panel-primary" style="    border-color: rgba(0,0,0,.5);     margin-left: 250px;
    margin-right: 50px;
    margin-top: -50px;  "  >
    <div class="panel-heading" align="center" style="    background-color: rgba(0,0,0,.5);
    border-color: #aa2b2b;">Cadastro de Motorista</div>
    
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
    
    
    <div align="center">
    <h4 style="color: blue";>${msg}</h4>
  </div>
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

<form class="form-horizontal" action="cadastrarMotorista"
			method="post" name="formulario">

<!-- Text input-->
<div class="form-group">
  <label class="col-md-2 control-label" for="Nome">Nome <h11>*</h11></label>  
  <div class="col-md-8">
  <input  class="form-control input-md" type="text"  id="exampleInputName"
					placeholder="" required="required" maxlength="45" name="nome">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-2 control-label" for="Nome">CPF <h11>*</h11></label>  
  <div class="col-md-2">
  <input class="form-control input-md" 
					type="text"  id="exampleInputCpf"
					 placeholder="000.000.000-00" min="14"
					maxlength="14" required="required" name="cpf"
					onkeypress="validaCpf();">
  </div>

  
  <label class="col-md-1 control-label" for="Nome">RG: <h11>*</h11></label>  
  <div class="col-md-2">
  <input class="form-control input-md" 
					type="text"  id="exampleInputName"
					placeholder="0.000.000" required="required" maxlength="9" name="rg"
					 onkeypress="validaRG()">
  </div>
  <label class="col-md-1 control-label" for="prependedtext">Email <h11>*</h11></label>
  <div class="col-md-2">
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
      <input class="form-control" type="email"  id="exampleInputPassword1"
				required="required" maxlength="45" name="email" 
				onsubmit="validaEmail();" >
    </div>
  </div>

</div>

<!-- Multiple Radios (inline) -->



<!-- Prepended text-->

<div class="form-group">
  <label class="col-md-2 control-label" for="prependedtext">Telefone <h11>*</h11></label>
  <div class="col-md-2">
    <div class="input-group">
      <span class="input-group-addon"><i class="fa fa-tablet"></i></span>
      <input  class="form-control" 
					type="text"  id="exampleInputTelefone"
					placeholder="(00) 00000-0000" required="required" maxlength="15"
					name="telefone"  onkeypress="validaTelefone()">
    </div>
  </div>
  
  <div class="col-md-3">
    <div class="input-group">
 <label for="sexo" class="hora col-md-4 control-label">Sexo</label> <select
          class="form-control" name="sexo" style="width: 50%;">
          
          <option value=""> sexo</option>
          <option value="M">Masculino</option>
          <option value="F">Feminino</option>
          <option value="O">Outros</option>
        </select>
    </div>
  </div>

   

<!-- Prepended text-->
<div class="form-group">
  
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
<div id="newpost">
   <div class="form-group">
    <div class="col-md-3 control-label">
        <h3>Informações do Veiculo</h3>
    </div>
    </div>

<div class="form-group">
  <label class="col-md-2 control-label" for="Nome">Numero da Habilitação: <h11>*</h11></label>  
  <div class="col-md-2">
  <input class="form-control input-md" type="number" 
					id="exampleInputHabilitacao" required="required" name="numHabilitacao" maxlength="11">
  </div>

  
  <label class="col-md-1 control-label" for="Nome">Categoria: <h11>*</h11></label>  
  <div class="col-md-2">
  <input  class="form-control input-md" type="text"  id="exampleInputCep"
					required="required" name="categoria"  maxlength="4">
  </div>
  
  <label class="col-md-2 control-label" for="Nome">Data de vencimento da carteira:<h11>*</h11></label>  
  <div class="col-md-2">
 <input id="dataNascimento" name="validade" placeholder="DD/MM/AAAA" class="form-control input-md" required="" type="text" maxlength="10" OnKeyPress="formatar('##/##/####', this)" onBlur="showhide()">
</div>

</div>
<div class="form-group">
  <label class="col-md-2 control-label" for="Nome">Placa do veiculo: <h11>*</h11></label>  
  <div class="col-md-2">
  <input class="form-control input-md" type="text"  id="exampleInputCep"
						required="required" name="veiculo.placa" maxlength="7">
  </div>

  
  <label class="col-md-1 control-label" for="Nome">Chassí: <h11>*</h11></label>  
  <div class="col-md-2">
  <input  class="form-control input-md" ype="text" 
					id="exampleInputData" required="required" name="veiculo.chasi">
  </div>
  
  <label class="col-md-1 control-label" for="Nome">Marca:<h11>*</h11></label>  
  <div class="col-md-2">
  <input class="form-control input-md" type="text"  id="exampleInputCep"
						required="required" name="veiculo.marca">
</div>

</div>

<div class="form-group">
  <label class="col-md-2 control-label" for="Nome">Ano do veiculo:: <h11>*</h11></label>  
  <div class="col-md-2">
  <input class="form-control input-md" type="text"  id="exampleInputCep"
						required="required" name="veiculo.anoVeiculo">
  </div>
  </div>






<div id="newpost">
   <div class="form-group">
    <div class="col-md-5 control-label">
        <h3>Informe um Login e Senha para acessar o sistema.</h3>
    </div>
    </div>



</div><!-- Text input-->
<div class="form-group">
  <label class="col-md-2 control-label" for="Nome">Login:<h11>*</h11></label>  
  <div class="col-md-2">
  <input class="form-control input-md" 
					type="text"  id="exampleInputLogin"
					placeholder="" required="required" maxlength="10" name="login">
  </div>

  
  <label class="col-md-1 control-label" for="Nome">Senha: <h11>*</h11></label>  
  <div class="col-md-2">
  <input class="form-control input-md" 
					type="password"  id="exampleInputPassword1"
					required="required" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
					maxlength="32" name="senha"  minlength="8"
					title="A senha deve ter no mínimo 8 e 32 no máximo, que sejam de pelo menos um número e uma letra maiúscula e minúscula:">
  </div>
  
  <label class="col-md-1 control-label" for="Nome"> Repitir Senha: <h11>*</h11></label>  
  <div class="col-md-2">
  <input class="form-control input-md" type="password" 
					id="exampleInputPassword1" required="required" minlength="8"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" maxlength="32">
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
    <button  class="btn btn-success" style="background-color: #2c8972;
    border-color: #2c8972;" type="Submit">Cadastrar</button>
    <button  class="btn btn-danger" style="background-color: #b72d29;
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