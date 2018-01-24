<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Cadastro de Motorista</title>

<!-- Bootstrap -->
<link href="view/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<script>
	

	function validaCpf(){
		var cpf = document.formulario.cpf;
		if (cpf.value.length == 3 || cpf.value.length == 7) {
			cpf.value += ".";
		}
		if(cpf.value.length == 11){
			cpf.value += "-";
		}
	}
	
	function validaRG(){
		
		var rg = document.formulario.rg;
		if (rg.value.length == 1 || rg.value.length == 5) {
			rg.value += ".";
		}
	}
	
function validaTelefone(){
		
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
function validaCep(){
	
	var cep = document.formulario.cep;
	if (cep.value.length == 2) {
		cep.value += ".";
	}
	if (cep.value.length == 6) {
		cep.value += "-";
	}
	
}
	
</script>


<style type="text/css">
label.hora {
	display: inline-block;
	width: 120px;
}
</style>
</head>
<body>

	<h1>Cadastro de Motorista</h1>
	<!-- Formulario -->
	<fieldset>
		<legend>Informações Pessoais</legend>
		<form class="form-inline" action="cadastrarMotorista" method="post"
			name="formulario">

			<div class="form-group">
				<label for="exampleInputName" class="hora">Nome Completo:</label> <input
					type="text" class="form-control" id="exampleInputName"
					placeholder="" required="required" maxlength="50" name="nome"
					style="width: 200px;">

			</div>
			<br>

			<div class="form-group">
				<label for="sexo" class="hora">Sexo</label> <select
					class="form-control" name="sexo" style="width: 200px;">
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
					style="width: 200px;" placeholder="000.000.000-00" min="14"
					maxlength="14" required="required" name="cpf" onkeypress="validaCpf();">
			</div>
			<br>

			<div class="form-group">
				<label for="exampleInputName" class="hora">RG:</label> <input
					type="text" class="form-control" id="exampleInputName"
					placeholder="0.000.000" required="required" maxlength="9" name="rg"
					style="width: 200px;" onkeypress="validaRG()" >
			</div>
			<br>

			<div class="form-group">
				<label for="exampleInputTelefone" class="hora">Telefone:</label> <input
					type="text" class="form-control" id="exampleInputTelefone"
					placeholder="(00) 00000-0000" required="required" maxlength="15"
					name="telefone" style="width: 200px;" onkeypress="validaTelefone()">
			</div>
			<br>


			<div class="form-group">
				<label for="exampleInputEndereco" class="hora">Estado:</label> <input
					type="text" class="form-control" id="exampleInputEndereco"
					required="required" maxlength="50" name="estado"
					style="width: 200px;">
			</div>
			<br>

			<div class="form-group">
				<label for="exampleInputEndereco" class="hora">Cidade:</label> <input
					type="text" class="form-control" id="exampleInputEndereco"
					required="required" maxlength="50" name="cidade"
					style="width: 200px;">
			</div>
			<br>

			<div class="form-group">
				<label for="exampleInputEndereco" class="hora">Endereço:</label> <input
					type="text" class="form-control" id="exampleInputEndereco"
					placeholder="Rua Don Juno nº 425" required="required"
					maxlength="50" name="endereco" style="width: 200px;">
			</div>
			<br>



			<div class="form-group">
				<label for="exampleInputEndereco" class="hora">Bairro:</label> <input
					type="text" class="form-control" id="exampleInputEndereco"
					required="required" maxlength="50" name="bairro"
					style="width: 200px;">
			</div>
			<br>

			<div class="form-group">
				<label for="exampleInputCep" class="hora">CEP:</label> <input
					type="text" class="form-control" id="exampleInputCep"
					placeholder="00.000-000" maxlength="10" required="required"
					name="cep" style="width: 200px;" onkeypress="validaCep()">
			</div>
			<br>

			<div class="form-group">
				<label for="exampleInputCep" class="hora">Numero da
					Habilitação:</label> <input type="number" class="form-control"
					id="exampleInputCep" required="required" name="numHabilitacao"
					style="width: 200px;">
			</div>
			<br>

			<div class="form-group">
				<label for="exampleInputCep" class="hora">Categoria:</label> <input
					type="text" class="form-control" id="exampleInputCep"
					required="required" name="categoria" style="width: 200px;">
			</div>
			<br>

			<div class="form-group" class="hora">
				<label for="exampleInputData" class="hora">Data de
					vencimento da carteira:</label> <input type="text" class="form-control"
					id="exampleInputData" required="required" name="validade"
					style="width: 200px;">
			</div>
			<br>
			<div class="form-group">
				<label for="exampleInputPassword1" class="hora">Senha:</label> <input
					type="password" class="form-control" id="exampleInputPassword1"
					required="required" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
					maxlength="30" name="senha" style="width: 200px;"
					title="A senha deve ter no mínimo 8 e 30 no máximo, que sejam de pelo menos um número e uma letra maiúscula e minúscula:">
			</div>
			<br>

			<div class="form-group">
				<label for="exampleInputPassword1" class="hora">Repita sua
					senha:</label> <input type="password" class="form-control"
					id="exampleInputPassword1" required="required"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" maxlength="30"
					style="width: 200px;">
			</div>
			<br>


			<fieldset>
				<legend>Informações da Empresa</legend>
				<div class="form-group" class="hora">
					<label for="exampleInputCep">Placa do veiculo:</label> <input
						type="text" class="form-control" id="exampleInputCep"
						required="required" name="placaVeiculo" style="width: 200px;">
				</div>
				<br>

				<div class="form-group">
					<label for="exampleInputCep" class="hora">Marca:</label> <input
						type="text" class="form-control" id="exampleInputCep"
						required="required" name="marcaVeiculo" style="width: 200px;">
				</div>
				<br>

				<div class="form-group">
					<label for="exampleInputCep" class="hora">Ano do veiculo:</label> <input
						type="text" class="form-control" id="exampleInputCep"
						required="required" name="anoVeiculo" style="width: 200px;">
				</div>
				<br>
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