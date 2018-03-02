<%@ page language="java" contentType="text/html; charset=iso-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<body class="index-page sidebar-collapse">
	<!-- inicioNavbar -->
	<nav
		class="navbar navbar-expand-lg bg-primary fixed-top navbar-transparent "
		color-on-scroll="400">
	<div class="container">
		<div class="navbar-translate">
			<a class="navbar-brand" href="Index" rel="tooltip"
				title="Designed by Invision. Coded by Creative Tim"
				data-placement="bottom"> Garbage Collector </a>
			<button class="navbar-toggler navbar-toggler" type="button"
				data-toggle="collapse" data-target="#navigation"
				aria-controls="navigation-index" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-bar bar1"></span> <span
					class="navbar-toggler-bar bar2"></span> <span
					class="navbar-toggler-bar bar3"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse justify-content-end"
			id="navigation" data-nav-image="view/assets/img/blurred-image-1.jpg">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="#"
					onclick="scrollToDownload()"> <i
						class="now-ui-icons files_single-copy-04"></i>
						<p>Sobre</p>
				</a></li>
				<c:if
					test="${clienteLogado == null || motoristaLogado == null}">
					<li class="nav-item"><a class="nav-link"
						href="exibirIncluirCliente"> <i
							class="now-ui-icons files_paper"></i>
							<p>Cadastrar Cliente</p>
					</a></li>
				</c:if>
				<c:if
					test="${clienteLogado.id == null || motoristaLogado.id == null}">
					<li class="nav-item"><a class="nav-link"
						href="exibirCadastrarMotorista"> <i
							class="now-ui-icons files_paper"></i>
							<p>Cadastrar Motorista</p>
					</a></li>
				</c:if>
				<c:if test="${clienteLogado != null || motoristaLogado != null}">
					<li class="nav-item"><a class="nav-link"
						href="exibirSolicitarColeta"> <i
							class="now-ui-icons files_paper"></i>
							<p>Solicitar Coleta</p>
					</a></li>
				</c:if>

				<c:if test="${clienteLogado != null || motoristaLogado != null}">
					<li class="nav-item"><a class="nav-link" href="listarColeta">
							<i class="now-ui-icons files_paper"></i>
							<p>Lista de Coletas Solicitadas</p>
					</a></li>
				</c:if>

				<c:if test="${clienteLogado != null || motoristaLogado != null}">
					<li class="nav-item"><a class="nav-link"
						href="exibirTipoColeta"> <i class="now-ui-icons files_paper"></i>
							<p>Cadastrar Tipo Coleta</p>
					</a></li>
				</c:if>

				<c:if test="${clienteLogado != null || motoristaLogado != null}">
					<li class="nav-item"><a class="nav-link"
						href="listarTipocoleta"> <i class="now-ui-icons files_paper"></i>
							<p>Lista Tipo Coleta</p>
					</a></li>
				</c:if>
				<c:if test="${clienteLogado != null || motoristaLogado != null}">
					<li class="nav-item"><a class="nav-link" href="listarClientes">
							<i class="now-ui-icons files_paper"></i>
							<p>Listar Clientes</p>
					</a></li>
				</c:if>
			
				<c:if test="${clienteLogado != null || motoristaLogado != null}">
					<li class="nav-item"><a class="nav-link" href="logout"> <i
							class="now-ui-icons files_paper"></i>
							<p>Deslogar</p>
					</a></li>
				</c:if>
				
				<li class="nav-item"><a class="nav-link btn btn-neutral"
					href="login"> <i class="now-ui-icons users_single-02"></i>
					
					<c:if test="${clienteLogado != null || motoristaLogado != null}">
           			<p>${clienteLogado.nome}</p> 
           			</c:if>
           			<c:if test="${clienteLogado == null || motoristaLogado == null}">
			          <p>Login</p>
			          </c:if>
				</a></li>
				
				
				<li class="nav-item"><a class="nav-link" rel="tooltip"
					title="Follow us on Twitter" data-placement="bottom" href=""> <i
						class="fa fa-twitter"></i>
						<p class="d-lg-none d-xl-none">Twitter</p>
				</a></li>
				<li class="nav-item"><a class="nav-link" rel="tooltip"
					title="Like us on Facebook" data-placement="bottom" href=""> <i
						class="fa fa-facebook-square"></i>
						<p class="d-lg-none d-xl-none">Facebook</p>
				</a></li>
				<li class="nav-item"><a class="nav-link" rel="tooltip"
					title="Follow us on Instagram" data-placement="bottom" href="">
						<i class="fa fa-instagram"></i>
						<p class="d-lg-none d-xl-none">Instagram</p>
				</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<!-- fim navbar -->
	<!-- fundo da pagina inicial -->
	<div class="wrapper">
		<div class="page-header clear-filter" filter-color="orange">
			<div class="page-header-image" data-parallax="true"
				style="background-image: url('view/assets/img/aaa.jpg');"></div>
			<div class="container">
				<div class="content-center brand">
					<img class="n-logo" src="view/assets/img/recycling.png" alt="">
					<p style="float: rigth">Bem vindo ${clienteLogado.nome}
						${motoristaLogado.nome}</p>
					<h1 class="h1-seo">Garbage Collector</h1>
					<h3>Sistema Integrado de Coleta Seletiva .</h3>
				</div>
				<h6 class="category category-absolute">
					Designed by <a href="" target="_blank"> <img
						src="view/assets/img/logooo.png" class="invision-logo" />
					</a>. Coded by <a href="" target="_blank"> <img
						src="view/assets/img/nasa.png" class="creative-tim-logo" />
					</a>.
				</h6>
			</div>
		</div>
</body>
<script src="view/assets/js/core/jquery.3.2.1.min.js"
	type="text/javascript"></script>
<script src="view/assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="view/assets/js/core/bootstrap.min.js"
	type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="view/assets/js/plugins/bootstrap-switch.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="view/assets/js/plugins/nouislider.min.js"
	type="text/javascript"></script>
<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
<script src="view/assets/js/plugins/bootstrap-datepicker.js"
	type="text/javascript"></script>
<!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
<script src="view/assets/js/now-ui-kit.js?v=1.1.0"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// the body of this function is in assets/js/now-ui-kit.js
		nowuiKit.initSliders();
	});

	function scrollToDownload() {

		if ($('.section-download').length != 0) {
			$("html, body").animate({
				scrollTop : $('.section-download').offset().top
			}, 1000);
		}
	}
</script>

</html>