
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<br><br><br><br>
<nav class="navbar navbar-expand-lg bg-primary fixed-top  "
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
<c:choose>

					<c:when test="${clienteLogado != null || motoristaLogado != null || AdmLogado != null}">



					</c:when>

					<c:otherwise>

						<li class="nav-item"><a class="nav-link"

							href="exibirIncluirCliente"> <i

								class="now-ui-icons files_paper"></i>

								<p>Cadastrar Cliente</p>

						</a></li>

					</c:otherwise>

				</c:choose>


				<c:if
					test="${AdmLogado != null}">
					<li class="nav-item"><a class="nav-link"
						href="exibirCadastrarMotorista"> <i
							class="now-ui-icons files_paper"></i>
							<p>Cadastrar Motorista</p>
					</a></li>
				</c:if>

				<c:if test="${clienteLogado != null}">
					<li class="nav-item"><a class="nav-link"
						href="exibirSolicitarColeta"> <i
							class="now-ui-icons files_paper"></i>
							<p>Solicitar Coleta</p>
					</a></li>
				</c:if>

				<c:if test="${clienteLogado != null}">

					<li class="nav-item"><a class="nav-link" href="listarColetaCliente">

					<li class="nav-item"><a class="nav-link" href="listarColeta">

							<i class="now-ui-icons files_paper"></i>
							<p>Lista de Coletas Solicitadas</p>
					</a></li>
				</c:if>
				
				
				
				<c:if test="${motoristaLogado != null}">
					<li class="nav-item"><a class="nav-link" href="listarColeta">
							<i class="now-ui-icons files_paper"></i>
							<p>Lista de Coletas</p>
					</a></li>
				</c:if>

				<c:if test="${AdmLogado != null}">
					<li class="nav-item"><a class="nav-link"
						href="exibirTipoColeta"> <i class="now-ui-icons files_paper"></i>
							<p>Cadastrar Tipo Coleta</p>
					</a></li>
				</c:if>

				<c:if test="${AdmLogado != null}">
					<li class="nav-item"><a class="nav-link"
						href="listarTipocoleta"> <i class="now-ui-icons files_paper"></i>
							<p>Lista Tipo Coleta</p>
					</a></li>
				</c:if>
				<c:if test="${AdmLogado != null}">
					<li class="nav-item"><a class="nav-link" href="listarClientes">
							<i class="now-ui-icons files_paper"></i>
							<p>Listar Clientes</p>
					</a></li>
				</c:if>

				<c:if test="${AdmLogado != null}">

				<li class="nav-item"><a class="nav-link"
					href="listaMotorista"> <i
						class="now-ui-icons files_paper"></i>
						<p>Listar Motorista</p>
				</a></li>
				</c:if>
			

				<c:if test="${clienteLogado != null || motoristaLogado != null || AdmLogado != null}">

					<li class="nav-item"><a class="nav-link" href="logout"> <i
							class="now-ui-icons files_paper"></i>
							<p>Deslogar</p>
					</a></li>
				</c:if>

				<li class="nav-item"><a class="nav-link btn btn-neutral"

					href="login"> <i class="now-ui-icons users_single-02"></i>

					<c:choose>

					<c:when



								test="${clienteLogado != null || motoristaLogado != null || AdmLogado != null}">



								<p>${clienteLogado.nome}${motoristaLogado.nome}${AdmLogado.nome}</p>



							</c:when>



							<c:otherwise>



								<p>Login</p>



							</c:otherwise>



						</c:choose>

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