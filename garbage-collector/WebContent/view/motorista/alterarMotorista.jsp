<%@ page language="java" contentType="text/html; charset=iso-8859-1"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Alterar Motorista</title>
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
    border-color: #aa2b2b;">Alterar Motorista</div>
    
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
    
    <div align="center">
    	<h4 style="color: blue";>${msg}</h4>
	</div>
<div class="col-md-11 control-label">
        <p class="help-block"><h11>*</h11> Campo Obrigatório </p>
</div>
</div>

<form class="form-horizontal" action="alterarMotorista"
			method="post" name="formulario">
			
<input type="hidden" name="id" value="${p.id}">
<input type="hidden" name="endereco.id" value="${p.endereco.id}">
<input type="hidden" name="veiculo.id" value="${p.veiculo.id}">

<!-- Text input-->
<div class="form-group">
  <label class="col-md-2 control-label" for="Nome">Nome <h11>*</h11></label>  
  <div class="col-md-8">
  <input  class="form-control input-md" type="text"  id="exampleInputName" minlength="8"
				value="${p.nome}"	placeholder="" required="required" maxlength="45" name="nome">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-2 control-label" for="Nome">CPF <h11>*</h11></label>  
  <div class="col-md-2">
  <input class="form-control input-md" 
					type="text"  id="exampleInputCpf"
					 placeholder="000.000.000-00" minlength="14"
					maxlength="14" required="required" name="cpf"
					onkeypress="validaCpf();" value="${p.cpf}">
  </div>

  
  <label class="col-md-1 control-label" for="Nome">RG: <h11>*</h11></label>  
  <div class="col-md-2">
  <input class="form-control input-md"  value="${p.rg}"
					type="text"  id="exampleInputName"
					placeholder="0.000.000" required="required" maxlength="9" minlength="9" name="rg"
					 onkeypress="validaRG()">
  </div>
  <label class="col-md-1 control-label" for="prependedtext">Email <h11>*</h11></label>
  <div class="col-md-2">
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
      <input class="form-control" type="email"  id="exampleInputPassword1" minlength="8"
				required="required" maxlength="45" name="email" value="${p.email}"
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
					type="text"  id="exampleInputTelefone" minlength="15" value="${p.telefone}"
					placeholder="(00) 00000-0000" required="required" maxlength="15"
					name="telefone"  onkeypress="validaTelefone()">
    </div>
  </div>
  
  <div class="col-md-3">
    <div class="input-group">
 <label for="sexo" class="hora col-md-4 control-label">Sexo</label> <select
          class="form-control" name="sexo" style="width: 50%;" value="${p.sexo}">
          
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
    <input  name="endereco.cep" id="exampleInputCep" value="${p.endereco.cep}"  placeholder="Apenas numero"  class="form-control input-md" required="Para realizar o cadastro preencha este campo com o cep da sua rua" value="" type="search" minlength="8" maxlength="8" pattern="[0-9]+$" onkeypress="validaCep()">
  </div>
  <div class="col-md-2">
      <button type="button" class="btn btn-primary" style="background-color: rgba(0,0,0,.5); border-color: rgba(0,0,0,.0001);" onclick="pesquisacep(getElementById('exampleInputCep').value)">Pesquisar</button>
    </div>
    <div class="col-md-3">
    <div class="input-group">
      <span class="input-group-addon">Complemento <h11>*</h11></span>
      <input class="form-control" type="text"  id="exampleInputName"
								value="${p.endereco.complemento}"
				placeholder="Casa" minlength="3" 
								pattern="[AÁÉÍÓÚÂÊÎÔÛ-ZáéíóúâêîôûçÁÉÍÓÚÂÊÎÔÛa-z ]+"
								required="Para realizar o cadastro preencha este campo com o seu complemento"
								maxlength="20" name="endereco.complemento">
    </div>
    
  </div>
</div>

<!-- Prepended text-->
<div class="form-group">
  <label class="col-md-2 control-label" for="prependedtext">Endereço</label>
  <div class="col-md-4">
    <div class="input-group">
      <span class="input-group-addon">Rua</span>
      <input id="rua" name="endereco.rua" value="${p.endereco.rua}" class="form-control" placeholder="" required="required" readonly="readonly" type="text" maxlength="50" minlength="8">
    </div>
    
  </div>
    <div class="col-md-2">
    <div class="input-group">
      <span class="input-group-addon">Nº <h11>*</h11></span>
      <input class="form-control" type="text" 
						value="${p.endereco.numero}"		id="exampleInputEndereco" minlength="2"
				placeholder="Ex: 0000" required="required" maxlength="6"
								name="endereco.numero">
    </div>
    
  </div>
  
  <div class="col-md-3">
    <div class="input-group">
      <span class="input-group-addon">Bairro</span>
      <input id="bairro" name="endereco.bairro" value="${p.endereco.bairro}" class="form-control" placeholder="" required="required" readonly="readonly" type="text" maxlength="26" minlength="3">
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
  <input class="form-control input-md" type="number" value="${p.numHabilitacao}" pattern="[0-9]+$" title="só com números e com 10 caracteres"
					id="exampleInputHabilitacao" required="O Rg tem que ter 11 números" name="numHabilitacao" maxlength="11" minlength="11">
  </div>

  
  <label class="col-md-1 control-label" for="Nome">Categoria: <h11>*</h11></label>  
  <div class="col-md-2">
  <input  class="form-control input-md" type="text"  id="exampleInputCep" value="${p.categoria}"
					required="required" name="categoria" minlength="1"  maxlength="4">
  </div>
  
  <label class="col-md-2 control-label" for="Nome">Data de vencimento da carteira:<h11>*</h11></label>  
  <div class="col-md-2">
 <input id="dataNascimento" name="validade" placeholder="DD/MM/AAAA" class="form-control input-md" required="" type="text" minlength="10" maxlength="10" OnKeyPress="formatar('##/##/####', this)" onBlur="showhide()" value="<fmt:formatDate value='${p.validade}' pattern='dd/MM/yyyy' />">
</div>

</div>
<div class="form-group">
  <label class="col-md-2 control-label" for="Nome">Placa do veiculo: <h11>*</h11></label>  
  <div class="col-md-2">
  <input class="form-control input-md" type="text"  id="exampleInputCep" minlength="7"
					value="${p.veiculo.placa}"	required="required" name="veiculo.placa" maxlength="7">
  </div>

  
  <label class="col-md-1 control-label" for="Nome">Chassí: <h11>*</h11></label>  
  <div class="col-md-2">
  <input  class="form-control input-md" ype="text" maxlength="15" minlength="15"
				value="${p.veiculo.chasi}"	id="exampleInputData" required="required" name="veiculo.chasi">
  </div>
  
  <label class="col-md-1 control-label" for="Nome">Marca:<h11>*</h11></label>  
  <div class="col-md-2">
  <input class="form-control input-md" type="text"  id="exampleInputCep"
				value="${p.veiculo.marca}"		required="required" name="veiculo.marca" maxçength="20" minlength="2">
</div>

</div>

<div class="form-group">
  <label class="col-md-2 control-label" for="Nome">Ano do veiculo: <h11>*</h11></label>  
  <div class="col-md-2">
  <input class="form-control input-md" type="text"  id="exampleInputCep"
					value="${p.veiculo.anoVeiculo}"	required="required" name="veiculo.anoVeiculo" maxlength="4" minlength="4">
  </div>
  </div>






<div id="newpost">
   <div class="form-group">
    <div class="col-md-5 control-label">
        <h3>Informe um Login e Senha para acessar o sistema.</h3>
    </div>
    </div>


<input type="hidden" name="usuario.tpUsuario" value="${u.tpUsuario}">
<input type="hidden" name="idUsuario" value="${u.idUsuario}">
</div><!-- Text input-->
<div class="form-group">
  <label class="col-md-2 control-label" for="Nome">Login:<h11>*</h11></label>  
  <div class="col-md-2">
  <input class="form-control input-md" 
					type="text"  id="exampleInputLogin"
					placeholder="" required="required" maxlength="10" name="login" minlength="3" value="${u.login}"	>
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
    border-color: #2c8972;" type="Submit">Alterar</button>
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