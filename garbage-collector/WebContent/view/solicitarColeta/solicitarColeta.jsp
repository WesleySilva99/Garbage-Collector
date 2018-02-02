<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Solicitar Coleta</title>
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
<body class="index-page sidebar-collapse">

	<c:import url="/view/util/menu.jsp" />

	<h1 align="center">Solicite sua coleta</h1>
	<div align="center">
		<h3 style="color: blue">${msg}</h3>
	</div>
	<form class="form-inline" action="CadastraSolicitarColeta"
		method="post" name="formulario">
		
				<div class="row" id="checkRadios">
			<div class="col-sm-6 col-lg-3">
				<p class="category">Material</p>
				<div class="checkbox">
					<input id="checkbox1" type="checkbox" name="tipoColeta"
						value="Papel"> <label for="checkbox1"> Papel </label>
				</div>
				<div class="checkbox">
					<input id="checkbox3" type="checkbox" name="tipoColeta"
						value="Ferro"> <label for="checkbox3"> Plastico </label>
				</div>
				<div class="checkbox">
					<input id="checkbox3" type="checkbox" name="tipoColeta"
						value="Ferro"> <label for="checkbox3"> Vidro </label>
				</div>
				<div class="checkbox">
					<input id="checkbox2" type="checkbox" name="tipoColeta"
						value="Metal"> <label for="checkbox2"> Metal </label>
				</div>
				<div class="checkbox">
					<input id="checkbox3" type="checkbox" name="tipoColeta"
						value="Ferro"> <label for="checkbox3"> Ferro </label>
				</div>
			</div>
		</div>
		<br><br>

		<div class="form-group">
			<label for="comment">Descrição:</label>
			<textarea class="form-control" rows="3" id="descricao" name="descricao" maxlength="100"></textarea>
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