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
<title>Listar Motorista</title>
<meta name="description" content="Free Bootstrap Theme by BootstrapMade.com">
  <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/style.css">
  
  <script type="text/javascript">
    
    
      function teste(nome, rua, bairro, cep, numero, complemento, numeroHabilitacao, validade, categoria, chasi, placa, marca, anoVeiculo) {
    	  
        document.getElementById('nomeMotorista').innerHTML = nome;
        document.getElementById('ruaMotorista').innerHTML = rua;
        document.getElementById('bairroMotorista').innerHTML = bairro;
        document.getElementById('cepMotorista').innerHTML = cep;
        document.getElementById('numeroMotorista').innerHTML = numero;
        document.getElementById('complementoMotorista').innerHTML = complemento;
        document.getElementById('numeroHabiliatacaoMotorista').innerHTML = numeroHabilitacao;
        document.getElementById('validadeMotorista').innerHTML = validade;
        document.getElementById('categoriaMotorista').innerHTML = categoria;
        document.getElementById('chasiMotorista').innerHTML = chasi;
        document.getElementById('placaMotorista').innerHTML = placa;
        document.getElementById('marcaMotorista').innerHTML = marca;
        document.getElementById('anoVeiculoMotorista').innerHTML = anoVeiculo;
        
        
        
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
       Nome : <h5 id="nomeMotorista"></h5>
      Rua : <h5 id="ruaMotorista"></h5>
      Bairro : <h5 id="bairroMotorista"></h5>
      Cep : <h5 id="cepMotorista"></h5>
      número : <h5 id="numeroMotorista"></h5>
      complemento : <h5 id="complementoMotorista"></h5>
      Número da Habilitação : <h5 id="numeroHabiliatacaoMotorista"></h5>
      Validade : <h5 id="validadeMotorista"></h5>
      Categoria : <h5 id="categoriaMotorista"></h5>
      Chasi : <h5 id="chasiMotorista"></h5>
      Placa : <h5 id="placaMotorista"></h5>
      Marca : <h5 id="marcaMotorista"></h5>
      Ano do Veiculo : <h5 id="anoVeiculoMotorista"></h5>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
        
      </div>
    </div>
  </div>
</div>
<!-- FIM MODAL -->
	<div class="container">
		  <hr>
    <h2 align="center">Lista de Motoristas</h2>
    <hr>
    <br>
    <c:if test="${msg ne null}">
     <div align="center">
    <h4 style="color: blue";>${msg}</h4>
  </div>
  </c:if>
		<table class="table table-striped">

			<tr>
				<th>Nome</th>
				<th>Telefone</th>
				<th>CPF</th>
				<th>Rg</th>
				<th>Sexo</th>
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
					
					
					<td><a href="exibiralterarMotorista?id=${u.id}" class='btn btn-info btn-xs'>Alterar</a> &nbsp;|
					<a href="removerMotorista?id=${u.id}" class="btn btn-danger btn-xs"> Remover</a></td>
					<td data-toggle="modal" data-target="#exampleModal" onclick="teste('${u.nome}','${u.endereco.rua}','${u.endereco.bairro}','${u.endereco.cep}','${u.endereco.numero}','${u.endereco.complemento}','${u.numHabilitacao}','${u.validade}','${u.categoria}','${u.veiculo.chasi}','${u.veiculo.placa}','${u.veiculo.marca}','${u.veiculo.anoVeiculo}' );"><h4 style="margin-top: 5px;"><span class="label label-success " >detalhes</span></h4></td> 

				</tr>
				

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