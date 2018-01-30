<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Cadastro de Usuário</title>

<!-- Bootstrap -->
<link href="view/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript">
	function validaCep() {

		var cep = document.formulario.cep;
		if (cep.value.length == 5) {
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

	<h1 align="center">Solicite sua coleta</h1>
	<div align="center">
		<h3 style="color: blue">${msg}</h3>
	</div>
	<form class="form-inline" action="CadastraSolicitarColeta"
		method="post" name="formulario">
		<div class="checkbox">
			<label> <input type="checkbox" name="tipoColeta"
				value="Papel"> Papel <input type="checkbox"
				name="tipoColeta" value="Plastico"> Plástico <input
				type="checkbox" name="tipoColeta" value="Metal"> Metal <input
				type="checkbox" name="tipoColeta" value="Ferro"> Ferro
			</label>
		</div>
		<br> <br>
		<div class="form-group">
			<label for="exampleInputDescricao" class="hora">Descrição:</label> <input
				type="text" class="form-control" id="exampleInputDescricao"
				placeholder="Garrafa pet"
				required="Para realizar a coleta preencha este campo com a descrição do material"
				style="width: 200px;" required="required" name="descricao"
				maxlength="30">
		</div>
		<br> <br>
		<div class="form-group">
			<label for="exampleInputQuantidade" class="hora">Quantidade:</label>
			<input type="text" class="form-control" id="exampleInputQuantidade"
				required="Para realizar a coleta preencha este campo com a quantidade de materiais que você vai doar"
				style="width: 200px;" name="quantidade" maxlength="10">
		</div>
		<br> <br>
		<div class="form-group">
			<label for="exampleInputEndereco" class="hora">Endereço da
				coleta:</label> <input type="text" class="form-control"
				required="Para realizar a coleta preencha este campo com o endereço desejado da coleta"
				id="exampleInputEndereco" style="width: 200px;" maxlength="50"
				name="endereco" placeholder="Rua joão de barros">
		</div>
		<br> <br>
		<div class="form-group">
			<label for="exampleInputNumero" class="hora">Número:</label> <input
				type="text" class="form-control" id="exampleInputNumero"
				placeholder="A222"
				required="Para realizar a coleta preencha este campo com o número da sua casa"
				style="width: 200px;" required="required" name="numero" minlegth="2"
				maxlength="6">
		</div>
		<br> <br>
		<div class="form-group">
			<label for="exampleInputCep" class="hora">CEP:</label> <input
				type="text" class="form-control" id="exampleInputCep"
				placeholder="00000-000" maxlength="9" style="width: 200px;"
				required="Para realizar a coleta preencha este campo com o cep da sua rua"
				maxlength="9" name="cep" pattern="\d{5}-?\d{3}"
				onkeypress="validaCep()">
		</div>
		<br> <br>
		<button type="submit" class="btn btn-success">Doar</button>
	</form>

	<!-- jQuery (necessario para Bootsrap plungins Java Script) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="view/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>