<%@ page language="java" contentType="text/html; charset=iso-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
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
${msg}
</head>
<body class="index-page sidebar-collapse">

	<c:import url="/view/util/menu.jsp" />

	<h1 align="center">Solicite sua coleta</h1>

	<div align="center">${msg}</div>
	<form class="form-horizontal" action="CadastraSolicitarColeta"
		method="post" name="formulario" style="border: 2px;">
		<fieldset>
			<div align="center">
				<h3>Materiais de Coleta</h3>


				<!-- Select Basic -->

				
				<div id="checkRadios">
					<div class="col-sm-6 col-lg-3">
						<p class="category">Material</p>
						<div class="form-group">
							Tipo da Coleta: <br /> <select id="tipocoleta"
								name="tipocoleta"
								style="width: 200px; height: 30px; border: 1px solid #BDC7D8; color: #000000; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
								<option value="">Selecione</option>
								<c:forEach items="${tc}" var="obj">
									<option value="${obj.id}">${obj.descricao}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>



				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-2 control-label">Descrição</label>
					<div class="col-md-2">
						<textarea class="form-control" rows="1" id="descricao"
							name="descricao" maxlength="100"></textarea>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="exampleInputQuantidade">Quantidade:</label>
					<div class="col-md-4">
						<input placeholder="" class="form-control input-md" type="text"
							id="exampleInputQuantidade"
							required="Para realizar a coleta preencha este campo com a quantidade de materiais que você vai doar"
							style="width: 200px;" name="quantidade" maxlength="10">

					</div>
				</div>
		</fieldset>
		<fieldset>
			<div align="center">
				<h3>Dados de Entrega</h3>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="exampleInputEndereco">Endereço
						da coleta:</label>
					<div class="col-md-4">
						<input class="form-control input-md" type="text"
							required="Para realizar a coleta preencha este campo com o endereço desejado da coleta"
							id="exampleInputEndereco" style="width: 200px;" maxlength="50"
							name="endereco" placeholder="Rua joão de barros">

					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="exampleInputNumero">Número
						da casa:</label>
					<div class="col-md-4">
						<input class="form-control input-md" type="text"
							required="Para realizar a coleta preencha este campo com o número da casa desejada da coleta"
							id="exampleInputNumero" style="width: 200px;" minlength="2"
							maxlength="6" name="numero" placeholder="Rua joão de barros">

					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="exampleInputCep">CEP:</label>
					<div class="col-md-4">
						<input class="form-control input-md" type="text"
							id="exampleInputCep" placeholder="00000-000" maxlength="9"
							style="width: 200px;"
							required="Para realizar a coleta preencha este campo com o cep da sua rua"
							maxlength="9" name="cep" pattern="\d{5}-?\d{3}"
							onkeypress="validaCep()">

					</div>
				</div>

				<button type="submit" class="btn btn-success">Doar</button>
			</div>

		</fieldset>
	</form>


	<!-- jQuery (necessario para Bootsrap plungins Java Script) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="view/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>