<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Solicitar Coleta</title>
</head>
<body>

	<h1 align="center">Solicite sua coleta</h1>
	
	<form class="form-inline" action="#" method="post">
		<div class="checkbox">
			<label> 
				<input type="checkbox" name="tipoColeta"value="Papelão"> Papelão
			    <input type="checkbox" name="tipoColeta" value="Papel"> Papel 
				<input type="checkbox" name="tipoColeta" value="Plástico"> Plástico
				<input type="checkbox" name="tipoColeta" value="Metal">	Metal 
				<input type="checkbox" name="tipoColeta" value="Ferro">	Ferro
			</label>
		</div>
		<div class="form-group">
			<label for="exampleInputDescricao" class="hora">Descrição:</label> <input
				type="text" class="form-control" id="exampleInputDescricao"
				style="width: 200px;" required="required" name="descricao">
		</div>
		<div class="form-group">
			<label for="exampleInputQuantidade" class="hora">Quantidade:</label>
			<input type="text" class="form-control" id="exampleInputQuantidade"
				style="width: 200px;" required="required" name="descricao">
		</div>
		<div class="form-group">
			<label for="exampleInputEndereco" class="hora">Endereço da coleta:</label>
			<input type="text" class="form-control" id="exampleInputEndereco"
				style="width: 200px;" required="required" name="endereco">
		</div>
		<button type="submit" class="btn btn-success">Doar</button>
	</form>
		
</body>
</html>