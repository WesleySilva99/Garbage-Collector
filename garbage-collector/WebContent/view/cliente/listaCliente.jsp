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
		<hr>
		<h2 align="center">Lista de Usuários</h2>
		<hr>
		<br>
		<h4 style="color: blue";>${msg}</h4>
		<table class="table table-striped">

			<tr>
				<th>Nome</th>
				<th>Cpf</th>
				<th>Data de Nascimento</th>
				<th>login</th>
				<th>telefone</th>
				<th>Email</th>
				<th>Rua</th>
				<th>Bairro</th>
				<th>Cep</th>
				<th>Número</th>
				<th>Complemento</th>
				<th>Alterar/Remover</th>
				<th>Detalhes</th>
			</tr>


			<c:forEach var="u" items="${listaCliente}">


				<tr>
					<td>${u.nome}</td>
					<td>${u.cpf}</td>
					<td><fmt:formatDate value="${u.dataNascimento}"
							pattern="dd/MM/yyyy" /></td>
					<td>${u.login}</td>
					<td>${u.telefone}</td>
					<td>${u.email}</td>
					
						
					<td>${u.endereco.rua}</td>
					<td>${u.endereco.bairro}</td>
					<td>${u.endereco.cep}</td>
					<td>${u.endereco.complemento}</td>
					<td>${u.endereco.numero}</td>
					
					
					
					
					<td><a href="alterarCliente?id=${u.id}">Alterar</a> &nbsp;</td>
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
                    
                 nome:   ${u.nome}
				cpf:	${u.cpf}
					 data nascimento: <fmt:formatDate value="${u.dataNascimento}"
							pattern="dd/MM/yyyy" />
				usuario:${u.login}
				telefone :	${u.telefone}
				email:	${u.email}
					
						
				rua:	${u.endereco.rua}
				bairro:	${u.endereco.bairro}
				cep:	${u.endereco.cep}
				complemento:	${u.endereco.complemento}
				numero:	${u.endereco.numero}
                  
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