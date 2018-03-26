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
<title>Listar Cliente</title>
<meta name="description" content="Free Bootstrap Theme by BootstrapMade.com">
  <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/style.css">
 <script type="text/javascript">
    
    
      function teste(nome, rua, bairro, cep, numero, complemento) {
    	  
        document.getElementById('nomeCliente').innerHTML = nome;
        document.getElementById('ruaCliente').innerHTML = rua;
        document.getElementById('bairroCliente').innerHTML = bairro;
        document.getElementById('cepCliente').innerHTML = cep;
        document.getElementById('numeroCliente').innerHTML = numero;
        document.getElementById('complementoCliente').innerHTML = complemento;
        
        
      }

</script>



</head>
<body>
<c:choose>
					<c:when test="${AdmLogado != null}">
					</c:when>
					<c:otherwise>
                	<c:import url="/view/util/menu.jsp" />
                	</c:otherwise>
					</c:choose>
<c:if test="${AdmLogado != null}">
	<c:import url="/view/util/menuLateral.jsp" />
	</c:if>
	 <!--  Modal  -->
	 <c:if test="${msg ne null}">
     <div align="center">
    <h4 style="color: blue";>${msg}</h4>
  </div>
  </c:if>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Informações</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      Nome : <h5 id="nomeCliente"></h5>
      Rua : <h5 id="ruaCliente"></h5>
      Bairro : <h5 id="bairroCliente"></h5>
      Cep : <h5 id="cepCliente"></h5>
      número : <h5 id="numeroCliente"></h5>
      complemento : <h5 id="complementoCliente"></h5>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
        
      </div>
    </div>
  </div>
</div>
<!-- FIM MODAL -->

	<div style="left: 1000px;">
	
		<div class="container">
			<hr>
			<h2 align="center">Lista de Usuários</h2>
			<hr>
			<br>
			<table class="table table-striped">

				<tr>
					<th>Nome</th>
					<th>Cpf</th>
					<th>Data de Nascimento</th>
					<th>telefone</th>
					<th>Email</th>
					<th>Alterar/Remover</th>
					<th>Detalhes</th>
				</tr>


				<c:forEach var="u" items="${listaCliente}">


					<tr>
						<td>${u.nome}</td>
						<td>${u.cpf}</td>
						<td><fmt:formatDate value="${u.dataNascimento}"
								pattern="dd/MM/yyyy" /></td>
						<td>${u.telefone}</td>
						<td>${u.email}</td>
						
						





						<td><a href="alterarCliente?id=${u.id}"
							class='btn btn-info btn-xs'><span class="fa fa-edit" >Alterar</a></span> &nbsp; <a
							href="removerCliente?id=${u.id}" class="btn btn-danger btn-xs" ><span class="	fa fa-close"> Remover</a></span></td>
						<td data-toggle="modal" data-target="#exampleModal" onclick="teste('${u.nome}','${u.endereco.rua}','${u.endereco.bairro}','${u.endereco.cep}','${u.endereco.numero}','${u.endereco.complemento}');"><h4 style="margin-top: 5px;">
								<span class="label label-success " >detalhes</span>
							</h4></td>
					</tr>

				</c:forEach>
			</table>
		</div>

	</div>





	<!-- jQuery (necessario para Bootsrap plungins Java Script) -->
	<script src="view/novoTemplate/js/jquery.min.js"></script>
	<script src="view/novoTemplate/js/jquery.easing.min.js"></script>
	<script src="view/novoTemplate/js/bootstrap.min.js"></script>
	<script src="view/novoTemplate/js/custom.js"></script>
	<script src="view/novoTemplate/contactform/contactform.js"></script>


</body>
</html>