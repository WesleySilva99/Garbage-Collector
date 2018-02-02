<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="view/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="view/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>


	<hr><h3>Alterar Produto</h3><hr>
	
	<form action="alterarProduto" method="post" enctype="multipart/form-data">

		<div class="form-group">
			<label for="inputCodigo">Nome</label>
			<input type="text" id="inputCodigo" class="form-control" name="Nome" style="width: 100px;" maxlength="100" required="required" value="${p.nome}" />
			<input type="hidden" name="id" value="${p.id}" />
		</div>
		
		<div class="form-group">
			<label for="inputDescricao">CPF</label>
			<input type="text" id="inputDescricao" class="form-control" name="cpf" style="width: 500px;" maxlength="100" required="required" value="${p.descricao}" />
		</div>
		
		<p>
			Preco de Custo: <br />
			<input type="text" name="precoCusto" value="${produto.precoCusto}" />
		</p>
		
		<p>
			Preco de Venda: <br />
			<input type="text" name="precoVenda" value="${produto.precoVenda}" />
		</p>
		
		<p>
			Garantia: <br />
			<input type="text" name="garantia" value="<fmt:formatDate value="${produto.garantia}" pattern="dd/MM/yyyy" />" />
		</p>
		
		<p>
			Quantidade: <br />
			<input type="text" name="quantidade" value="${produto.quantidade}" />
		</p>
		
		<p> <input type="submit" class="btn btn-primary" value="Alterar"> </p>
	</form>

</body>
</html>