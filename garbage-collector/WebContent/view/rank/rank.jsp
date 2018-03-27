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
<title>Rank de Coletas</title>
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
	 
<!-- FIM MODAL -->
	<br><br><br>
	<div style="left: 1000px;">
	
		<div class="container">
			<hr>
			<h2 align="center">Rank de Coletas</h2>
			<hr>
			<br>
			<h3 align="center">Todo mês entregamos ao primeiro colocado no rank de coletas uma premiação.</h3>
			<h3 align="center">Premiação do mês: Uma Geladeira Brastemp Frost Free Duplex.</h3>
			<table class="table table-striped">
				
				<tr>
					
					<th>Nome</th>
					<th>Quantidade Doada</th>
				</tr>


				<c:forEach var="u" items="${listaRank}">


					<tr>
						<td>${u.nome}</td>
						<td>${u.quantidade}</td>
					
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