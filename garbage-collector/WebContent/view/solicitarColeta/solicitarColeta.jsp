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
${msg}
</head>
<body class="index-page sidebar-collapse">

	<c:import url="/view/util/menu.jsp" />

	<h1 align="center">Solicite sua coleta</h1>
	<div align="center">
	 ${msg}
		
	</div>
	<form class="form-horizontal" action="CadastraSolicitarColeta" method="post" name="formulario" style="border: 2px;">
	<fieldset>	
						
<div align="center">
		<!-- Text input-->
<div class="form-group">
  <label class="col-md-2 control-label" >Descrição</label>
  <div class="col-md-2">                     
    <textarea class="form-control" rows="1" id="descricao" name="descricao" maxlength="100"></textarea>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="exampleInputQuantidade">Quantidade:</label>  
  <div class="col-md-4">
  <input  placeholder="" class="form-control input-md" type="text" id="exampleInputQuantidade"
				required="Para realizar a coleta preencha este campo com a quantidade de materiais que você vai doar"
				style="width: 200px;" name="quantidade" maxlength="10">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="exampleInputEndereco">Endereço da coleta:</label>  
  <div class="col-md-4">
  <input   class="form-control input-md" type="text" required="Para realizar a coleta preencha este campo com o endereço desejado da coleta"
				id="exampleInputEndereco" style="width: 200px;" maxlength="50"
				name="endereco" placeholder="Rua joão de barros">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="exampleInputNumero">Número da casa:</label>  
  <div class="col-md-4">
  <input   class="form-control input-md" type="text" required="Para realizar a coleta preencha este campo com o número da casa desejada da coleta"
				id="exampleInputNumero" style="width: 200px;" minlength="2" maxlength="6"
				name="numero" placeholder="Rua joão de barros">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="exampleInputCep">CEP:</label>  
  <div class="col-md-4">
  <input  class="form-control input-md"  type="text" id="exampleInputCep"
				placeholder="00000-000" maxlength="9" style="width: 200px;"
				required="Para realizar a coleta preencha este campo com o cep da sua rua"
				maxlength="9" name="cep" pattern="\d{5}-?\d{3}"
				onkeypress="validaCep()">
    
  </div>
</div>



<!-- Select Basic -->


<div  id="checkRadios">
			<div class="col-sm-6 col-lg-3">
				<p class="category">Material</p>
				<div class="checkbox">
					<input id="checkbox1" type="checkbox" name="tipoColeta"
						value="Papel"> <label for="checkbox1"> Papel </label>
						
						<input id="checkbox2" type="checkbox" name="tipoColeta"
						value="Plastico"> <label for="checkbox2"> Plastico </label>
						
						<input id="checkbox3" type="checkbox" name="tipoColeta"
						value="Vidro"> <label for="checkbox3"> Vidro </label>
						
						<input id="checkbox4" type="checkbox" name="tipoColeta"
						value="Metal"> <label for="checkbox4"> Metal </label>
						
						<input id="checkbox5" type="checkbox" name="tipoColeta"
						value="Ferro"> <label for="checkbox5"> Ferro </label>
				</div>
			</div>
		</div>


<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="Doar"></label>
  <div class="col-md-4">
    <button type="submit" class="btn btn-primary">Doar</button>
  </div>
</div>
</div>
</fieldset>
	</form>
	
	
	<!-- jQuery (necessario para Bootsrap plungins Java Script) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="view/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>