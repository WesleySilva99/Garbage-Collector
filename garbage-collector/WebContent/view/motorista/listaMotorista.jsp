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
<body>

<c:import url="/view/util/menu.jsp" />
	<div class="container">
		<h2 align="middle">Lista de Motorista</h2>
		<br>
		<table class="table table-striped">

			<tr>
				<th>Nome</th>
				<th>Telefone</th>
				<th>CPF</th>
				<th>Rg</th>
				<th>Sexo</th>
				<th>Número da Habilitação</th>
				<th>Validade da Habilitação</th>
				<th>Categoria</th>
				<th>Chassi</th>
				<th>Placa do veiculo</th>
				<th>Marca do veiculo</th>
				<th>Ano do veiculo</th>
				<th>Login</th>
				<th>Rua</th>
				<th>Bairro</th>
				<th>Cep</th>
				<th>Número</th>
				<th>Complemento</th>
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
					<td>${u.numHabilitacao}</td>
					<td><fmt:formatDate value="${u.validade}"
							pattern="dd/MM/yyyy" /></td>
					<td>${u.categoria}</td>
					<td>${u.veiculo.chasi}</td>
					<td>${u.veiculo.placa}</td>
					<td>${u.veiculo.marca}</td>
					<td>${u.veiculo.anoVeiculo}</td>
					<td>${u.login}</td>
					<td>${u.endereco.rua}</td>
					<td>${u.endereco.bairro}</td>
					<td>${u.endereco.cep}</td>
					<td>${u.endereco.numero}</td>
					<td>${u.endereco.complemento}</td>
					<td><a href="exibiralterarMotorista?id=${u.id}">Alterar</a> &nbsp;|
					<a href="removerMotorista?id=${u.id}">Remover</a></td>
					<td onclick="myFunction(this)"><h4 style="margin-top: 50px;"><span class="label label-success " >detalhes</span></h4></td> 

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
                    
                    <div class="col-md-1 item_content">
                    
              Nome:      ${u.nome}
				Telefone:	${u.telefone}
				CPF:	${u.cpf}
				RG:		${u.rg}
				Sexo:   ${u.sexo}
				Numero Habilitação:	${u.numHabilitacao}
					Validade: <fmt:formatDate value="${u.validade}"
							pattern="dd/MM/yyyy" />
				Categoria:	${u.categoria}
				Chasi:	${u.veiculo.chasi}
				Placa:	${u.veiculo.placa}
				Marca:	${u.veiculo.marca}
				Ano do Veiculo:	${u.veiculo.anoVeiculo}
				Login:	${u.login}
				Rua:	${u.endereco.rua}
				Bairro:	${u.endereco.bairro}
				Cep:	${u.endereco.cep}
				Numero:	${u.endereco.numero}
				Complemento:	${u.endereco.complemento}
                  
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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="view/assets/js/now-ui-kit.js"></script>
		<script src="view/assets/js/plugins/bootstrap-datepicker.js"></script>
		<script src="view/assets/js/plugins/bootstrap-switch.js"></script>
		<script src="view/assets/js/plugins/jquery.sharrre.js"></script>
		<script src="view/assets/js/plugins/nouislider.min.js"></script>
	<script src="view/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>