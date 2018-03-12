<%@ page language="java" contentType="text/html; charset=iso-8859-1"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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

<title>Alterar Motorista</title>

<script>
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
	function validaCep() {

		var cep = document.formulario.cep;
		
		if (cep.value.length == 5) {
			cep.value += "-";
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
	<c:import url="/view/util/menu.jsp"/>
	${msg}
	<br>
	<hr>
	<h1 align="center">Alterar Motorista</h1>
	<hr>
	
	<br>
	<center>
	<!-- Formulario -->
	<fieldset>
		<legend>Informações Pessoais</legend>
		<form class="form-horizontal" action="alterarMotorista"
			method="post" name="formulario">
			<fieldset>
			<input type="hidden" name="id" value="${p.id}">
				<div align="center">
  <div class="form-row">
    <div class="col-4">
    <label for="exampleInputName" class="hora">Nome Completo:</label> <input
					type="text" class="form-control" id="exampleInputName"
					placeholder="" required="required" maxlength="45" name="nome"
					style="width: 50%;" value="${p.nome}">
    </div>
  <div class="col-4">
    <label for="exampleInputLogin" class="hora">Login:</label> <input
					type="text" class="form-control" id="exampleInputLogin"
					placeholder="" required="required" maxlength="10" name="login"
					style="width: 50%;" value="${p.login}">
    </div>
    
    <div class="col-4">
 <label for="sexo" class="hora">Sexo</label> <select
					class="form-control" name="sexo" style="width: 50%;">
					<option value="">Escolha seu sexo</option>
					<option value="M">Masculino</option>
					<option value="F">Feminino</option>
					<option value="O">Outros</option>
				</select>
    </div>
    
  </div>
  <!--     Fonts and icons     -->
  <div class="form-row">
    <div class="col-4">
    <label for="exampleInputCpf" class="hora">CPF:</label> <input
					type="text" class="form-control" id="exampleInputCpf"
					style="width: 50%;" placeholder="000.000.000-00" min="14"
					maxlength="14" required="required" name="cpf"
					onkeypress="validaCpf();" value="${p.cpf}">
    </div>
    <div class="col-4">
    <label for="exampleInputName" class="hora">RG:</label> <input
					type="text" class="form-control" id="exampleInputName"
					placeholder="0.000.000" required="required" maxlength="10" name="rg"
					style="width: 50%;" onkeypress="validaRG()" value="${p.rg}">
    </div>
    
<div class="col-4">
    <label for="exampleInputTelefone" class="hora">Telefone:</label> <input
					type="text" class="form-control" id="exampleInputTelefone"
					placeholder="(00) 00000-0000" required="required" maxlength="15"
					name="telefone" style="width: 50%;" onkeypress="validaTelefone()" value="${p.telefone}">
    </div>
  </div>
  
  
  <!--     Fonts and icons     -->
  <div class="form-row">
 <div class="col-4">
    <label for="exampleInputEndereco" class="hora">Endereço:</label> <input
					type="text" class="form-control" id="exampleInputEndereco"
					placeholder="Rua Don Juno nº 425" required="required" value="${p.endereco.rua}"
					maxlength="50" name="endereco.rua" style="width: 50%;">
    </div>
 <div class="col-4">
    <label for="exampleInputEndereco" class="hora">Bairro:</label> <input
					type="text" class="form-control" id="exampleInputEndereco"
					required="required" maxlength="20" name="endereco.bairro"
					style="width: 50%;" value="${p.endereco.bairro}">
    </div>
    <div class="col">
    <label for="exampleInputCep" class="hora">CEP:</label> <input
					type="text" class="form-control" id="exampleInputCep"
					placeholder="00.000-000" maxlength="9" required="required" value="${p.endereco.cep}"
					name="endereco.cep" style="width: 50%;" onkeypress="validaCep()">
    </div>
  </div>
  <!--     Fonts and icons     -->
  
  <div class="form-row">
  
    <div class="col-4">
    <label for="exampleInputEndereco" class="hora">Complemento:</label> <input
					type="text" class="form-control" id="exampleInputEndereco"
					required="required" maxlength="10" name="endereco.complemento"
					style="width: 50%;" value="${p.endereco.complemento}">
    </div>
    <div class="col-4">
    <label for="exampleInputEndereco" class="hora">Número do Complemento:</label> <input
					type="text" class="form-control" id="exampleInputEndereco"
					required="required" maxlength="6" name="endereco.numero"
					style="width: 50%;" value="${p.endereco.numero}">
    </div>
    <div class="col-4">
    <label for="exampleInputHabilitacao" class="hora">Numero da
					Habilitação:</label> <input type="number" class="form-control"
					id="exampleInputHabilitacao" required="required" name="numHabilitacao"
					style="width: 50%;" maxlength="11" value="${p.numHabilitacao}">
    </div>
  </div>
   <!--     Fonts and icons     -->
  
  <div class="form-row">
  
    <div class="col-4">
    <label for="exampleInputCep" class="hora">Categoria:</label> <input
					type="text" class="form-control" id="exampleInputCep" value="${p.categoria}"
					required="required" name="categoria" style="width: 50%;" maxlength="4">
    </div>
    
    <div class="col-4">
    <label for="exampleInputData" class="hora">Data de
					vencimento da carteira:</label> <input type="text" class="form-control"
					id="exampleInputData" required="required" name="validade"
					style="width: 50%;" maxlength="10" value="<fmt:formatDate value='${p.validade}' pattern='dd/MM/yyyy' />">
    </div>
    <div class="col-4">
    <label for="exampleInputPassword1" class="hora">Email:</label>
			<input type="email" class="form-control" id="exampleInputPassword1"
				required="required" maxlength="45" name="email" style="width: 50%"
				 value="${p.email}">
    </div>
</div>

 <!--     Fonts and icons     -->
  
  <div class="form-row">
  
    
    <div class="col-4">
    <label for="exampleInputCep">Placa do veiculo:</label> <input
						type="text" class="form-control" id="exampleInputCep" maxlength="7"
						required="required" name="veiculo.placa" style="width: 50%;" value="${p.veiculo.placa}">
    </div>
    </div>
    
    <!--     Fonts and icons     -->
  
  <div class="form-row">
  
    <div class="col-4">
    <label for="exampleInputCep" class="hora">Marca:</label> <input
						type="text" class="form-control" id="exampleInputCep" maxlength="10"
						required="required" name="veiculo.marca" style="width: 50%;" value="${p.veiculo.marca}">
    </div>
    <div class="col-4">
    <label for="exampleInputCep" class="hora">Ano do veiculo:</label> <input
						type="text" class="form-control" id="exampleInputCep" maxlength="4" value="${p.veiculo.anoVeiculo}"
						required="required" name="veiculo.anoVeiculo" style="width: 50%;">
    </div>
    <div class="col-4">
    <label for="exampleInputData" class="hora">Chassí:</label> <input type="text" class="form-control"
					id="exampleInputData" required="required" name="veiculo.chasi"  maxlength="30"
					style="width: 50%;" value="${p.veiculo.chasi}">
    </div>
    </div>
			</fieldset>



			<button type="reset" class="btn btn-warning">&nbsp; Limpar
				&nbsp;</button>
			&nbsp;
			<button type="submit" class="btn btn-success">Alterar</button>

		</form>
	</fieldset>
	</center>
	<br>
	<!-- jQuery (necessario para Bootsrap plungins Java Script) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="view/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

<!-- Testando um novo branch -->