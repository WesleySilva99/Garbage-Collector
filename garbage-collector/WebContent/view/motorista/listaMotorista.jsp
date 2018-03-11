<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=iso-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="apple-touch-icon" sizes="76x76"
	href="view/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="view/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Garbage Collector</title>
<meta name="description" content="Free Bootstrap Theme by BootstrapMade.com">
  <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/style.css">
</head>
<body>
<br>
  <br>
  <br>

<c:import url="/view/util/menu.jsp" />
	<div class="container">
		  <hr>
    <h2 align="center">Lista de Motoristas</h2>
    <hr>
    <br>
		<table class="table table-striped">

			<tr>
				<th>Nome</th>
				<th>Telefone</th>
				<th>CPF</th>
				<th>Rg</th>
				<th>Sexo</th>
				<th>Login</th>	
				<th>Ações de Motorista</th>
				<th> Detalhes</th>
				
				

			</tr>


			<c:forEach var="u" items="${listaMotorista}">


				<tr>
					<td>${u.nome}</td>
					<td>${u.telefone}</td>
					<td>${u.cpf}</td>
					<td>${u.rg}</td>
					<td>${u.sexo}</td>
					<td>${u.login}</td>
					
					<td><a href="pegarMotorista?id=${u.id}" class='btn btn-info btn-xs'>Alterar</a> &nbsp;|
					<a href="removerMotorista?id=${u.id}" class="btn btn-danger btn-xs"> Remover</a></td>
					<td onclick="myFunction(this)"><h4 style="margin-top: 5px;"><span class="label label-success " >detalhes</span></h4></td> 

				</tr>
				<div class="modal fade item_view" id="item_view">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <a href="#" data-dismiss="modal" class="class pull-right"><span class="glyphicon glyphicon-remove"></span></a>
                <h3 class="modal-title"> Informações </h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    
                    <div class="col" align="center">
                    
            <strong>Nome: </strong>     ${u.nome}
            <br>
            <br>
				<strong>Telefone: </strong>	${u.telefone}
				<br>
            <br>
			<strong>CPF: </strong>	${u.cpf}
			<br>
            <br>
				<strong>RG:	</strong>	${u.rg}
				<br>
            <br>
			<strong>Sexo: </strong>   ${u.sexo}
			<br>
            <br>
			<strong>	Numero Habilitação: </strong>	${u.numHabilitacao}
			<br>
            <br>
			<strong>		Validade: </strong> <fmt:formatDate value="${u.validade}"
							pattern="dd/MM/yyyy" />
							<br>
            <br>
			<strong>	Categoria: </strong>	${u.categoria}
			<br>
            <br>
			<strong>	Chasi: </strong>	${u.veiculo.chasi}
			<br>
            <br>
			<strong>	Placa: </strong>	${u.veiculo.placa}
			<br>
            <br>
			<strong>	Marca: </strong>	${u.veiculo.marca}
			<br>
            <br>
			<strong>	Ano do Veiculo: </strong>	${u.veiculo.anoVeiculo}
			<br>
            <br>
			<strong>	Login: </strong>	${u.login}
			<br>
            <br>
			<strong>	Rua: </strong>	${u.endereco.rua}
			<br>
            <br>
			<strong>	Bairro: </strong>	${u.endereco.bairro}
			<br>
            <br>
			<strong>	Cep: </strong>	${u.endereco.cep}
			<br>
            <br>
			<strong>	Numero: </strong>	${u.endereco.numero}
			<br>
            <br>
			<strong>	Complemento: </strong>	${u.endereco.complemento}
                  
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
				

			</c:forEach>
		</table>
	</div>

	<!-- jQuery (necessario para Bootsrap plungins Java Script) -->
  <script src="view/novoTemplate/js/jquery.min.js"></script>
  <script src="view/novoTemplate/js/jquery.easing.min.js"></script>
  <script src="view/novoTemplate/js/bootstrap.min.js"></script>
  <script src="view/novoTemplate/js/custom.js"></script>
  <script src="view/novoTemplate/contactform/contactform.js"></script>
</body>
</html>