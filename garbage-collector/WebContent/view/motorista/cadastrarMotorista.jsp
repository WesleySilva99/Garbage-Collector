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

<title>Cadastro de Motorista</title>

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
		if (tel.value.length == 9) {
			tel.value += "-";
		}
	}
	function validaCep() {

		var cep = document.formulario.cep;
		if (cep.value.length == 2) {
			cep.value += ".";
		}
		if (cep.value.length == 6) {
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
	<h1 align="center">Cadastro de Motorista</h1>
	<hr>
	
	<br>
	
	<!-- Formulario -->
	<fieldset>
		<legend>Informações Pessoais</legend>
		<form class="form-horizontal" action="cadastrarMotorista"
			method="post" name="formulario">
			<fieldset>
			<div class="form-group">
				<label for="exampleInputName" class="hora">Nome Completo:</label> <input
					type="text" class="form-control" id="exampleInputName"
					placeholder="" required="required" maxlength="45" name="nome"
					style="width: 25%;">

			</div>
			<br>
			
			<div class="form-group">
				<label for="exampleInputLogin" class="hora">Login:</label> <input
					type="text" class="form-control" id="exampleInputLogin"
					placeholder="" required="required" maxlength="10" name="login"
					style="width: 25%;">

			</div>
			<br>

			<div class="form-group">
				<label for="sexo" class="hora">Sexo</label> <select
					class="form-control" name="sexo" style="width: 25%;">
					<option value="">Escolha seu sexo</option>
					<option value="M">Masculino</option>
					<option value="F">Feminino</option>
					<option value="O">Outros</option>
				</select>
			</div>
			<br>
			<div class="form-group">
				<label for="exampleInputCpf" class="hora">CPF:</label> <input
					type="text" class="form-control" id="exampleInputCpf"
					style="width: 25%;" placeholder="000.000.000-00" min="14"
					maxlength="14" required="required" name="cpf"
					onkeypress="validaCpf();">
			</div>
			<br>

			<div class="form-group">
				<label for="exampleInputName" class="hora">RG:</label> <input
					type="text" class="form-control" id="exampleInputName"
					placeholder="0.000.000" required="required" maxlength="10" name="rg"
					style="width: 25%;" onkeypress="validaRG()">
			</div>
			<br>

			<div class="form-group">
				<label for="exampleInputTelefone" class="hora">Telefone:</label> <input
					type="text" class="form-control" id="exampleInputTelefone"
					placeholder="(00) 00000-0000" required="required" maxlength="15"
					name="telefone" style="width: 25%;" onkeypress="validaTelefone()">
			</div>
			<br>

			<div class="form-group">
				<label for="exampleInputEndereco" class="hora">Endereço:</label> <input
					type="text" class="form-control" id="exampleInputEndereco"
					placeholder="Rua Don Juno nº 425" required="required"
					maxlength="50" name="rua" style="width: 25%;">
			</div>
			<br>



			<div class="form-group">
				<label for="exampleInputEndereco" class="hora">Bairro:</label> <input
					type="text" class="form-control" id="exampleInputEndereco"
					required="required" maxlength="20" name="bairro"
					style="width: 25%;">
			</div>
			<br>

			<div class="form-group">
				<label for="exampleInputCep" class="hora">CEP:</label> <input
					type="text" class="form-control" id="exampleInputCep"
					placeholder="00.000-000" maxlength="9" required="required"
					name="cep" style="width: 25%;" onkeypress="validaCep()">
			</div>
			<br>

			<div class="form-group">
				<label for="exampleInputEndereco" class="hora">Complemento:</label> <input
					type="text" class="form-control" id="exampleInputEndereco"
					required="required" maxlength="10" name="complemento"
					style="width: 25%;">
			</div>
			<br>

			<div class="form-group">
				<label for="exampleInputEndereco" class="hora">Número do Complemento:</label> <input
					type="text" class="form-control" id="exampleInputEndereco"
					required="required" maxlength="6" name="numero"
					style="width: 25%;">
			</div>
			<br>
			<div class="form-group">
				<label for="exampleInputCep" class="hora">Numero da
					Habilitação:</label> <input type="number" class="form-control"
					id="exampleInputCep" required="required" name="numHabilitacao"
					style="width: 25%;" maxlength="11">
			</div>
			<br>

			<div class="form-group">
				<label for="exampleInputCep" class="hora">Categoria:</label> <input
					type="text" class="form-control" id="exampleInputCep"
					required="required" name="categoria" style="width: 25%;" maxlength="4">
			</div>
			<br>

			<div class="form-group" class="hora">
				<label for="exampleInputData" class="hora">Data de
					vencimento da carteira:</label> <input type="text" class="form-control"
					id="exampleInputData" required="required" name="validade"
					style="width: 25%;" maxlength="10">
			</div>
			<br> <label for="exampleInputPassword1" class="hora">Email:</label>
			<input type="email" class="form-control" id="exampleInputPassword1"
				required="required" maxlength="45" name="email" style="width: 25%;"
				onsubmit="validaEmail();">
			</div>
			<br>
			<div class="form-group">
				<label for="exampleInputPassword1" class="hora">Senha:</label> <input
					type="password" class="form-control" id="exampleInputPassword1"
					required="required" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
					maxlength="32" name="senha" style="width: 25%;" minlength="8"
					title="A senha deve ter no mínimo 8 e 32 no máximo, que sejam de pelo menos um número e uma letra maiúscula e minúscula:">
			</div>
			<br>

			<div class="form-group">
				<label for="exampleInputPassword1" class="hora">Repita sua
					senha:</label> <input type="password" class="form-control"
					id="exampleInputPassword1" required="required" minlength="8"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" maxlength="32"
					style="width: 25%;">
			</div>
			<br>

			</fieldset>
			<fieldset>
				<legend>Informações da Empresa</legend>
				<div class="form-group" class="hora">
					<label for="exampleInputCep">Placa do veiculo:</label> <input
						type="text" class="form-control" id="exampleInputCep"
						required="required" name="placaVeiculo" style="width: 25%;">
				</div>
				<br>

				<div class="form-group">
					<label for="exampleInputCep" class="hora">Marca:</label> <input
						type="text" class="form-control" id="exampleInputCep"
						required="required" name="marcaVeiculo" style="width: 25%;">
				</div>
				<br>

				<div class="form-group">
					<label for="exampleInputCep" class="hora">Ano do veiculo:</label> <input
						type="text" class="form-control" id="exampleInputCep"
						required="required" name="anoVeiculo" style="width: 25%;">
				</div>
				<br>
				
				<div class="form-group" class="hora">
				<label for="exampleInputData" class="hora">Chassí:</label> <input type="text" class="form-control"
					id="exampleInputData" required="required" name="chasi"
					style="width: 25%;">
			</div>
			</fieldset>



			<button type="reset" class="btn btn-warning">&nbsp; Limpar
				&nbsp;</button>
			&nbsp;
			<button type="submit" class="btn btn-success">Cadastrar</button>

		</form>
	</fieldset>
	<br>
	<!-- jQuery (necessario para Bootsrap plungins Java Script) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="view/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

<!-- Testando um novo branch -->