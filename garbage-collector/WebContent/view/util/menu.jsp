
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<nav class="navbar navbar-default navbar-fixed-top top-nav-collapse">
        <div class="container">

          <div class="col-md-12">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
               
              </button>
              <a class="navbar-brand" href="/garbage-collector/"><img class="topo" src="view/novoTemplate/img/tiro2.png" style="width:200px;  margin-top: -25px;" class="img-responsive" ></a>
            </div>
            <div class="collapse navbar-collapse navbar-right" id="myNavbar">
              <ul class="nav navbar-nav">
              
              <c:choose>
					<c:when test="${clienteLogado != null || motoristaLogado != null || AdmLogado != null}">
					</c:when>
					<c:otherwise>
                <li class="active"><a href="exibirIncluirCliente">Cadastro Cliente</a></li>
                	</c:otherwise>
					</c:choose>
					
                <c:if test="${Administrador != null}">
                <li class=""><a href="exibirCadastrarMotorista">Cadastro Motorista</a></li>
                </c:if>
                
                <c:if test="${clienteLogado != null}">
                <li class=""><a href="exibirSolicitarColeta">Solicita coletas</a></li>
                </c:if>
                
                <c:if test="${clienteLogado != null}">
                <li class=""><a href="listarColetaCliente">Listar coletas solicitadas</a></li>
                </c:if>
                
                <c:if test="${motoristaLogado != null}">
                <li class=""><a href="listarColeta">Listar coletas</a></li>
                </c:if>

               <li class=""><a href="rank">Rank de Coletas</a></li>
                <c:choose>
					<c:when
								test="${clienteLogado != null || motoristaLogado != null || AdmLogado != null}">
								<li class=""><a href="#">${clienteLogado.usuario.login}${motoristaLogado.nome}${AdmLogado.nome}</a></li>
							</c:when>
							<c:otherwise>
								<li class=""><a href="login">Login</a></li>
							</c:otherwise>
						</c:choose>
						
					<c:if test="${clienteLogado != null || motoristaLogado != null || AdmLogado != null}">
	                	<li class=""><a href="logout">Deslogar</a></li>
	                </c:if>
                
               
              </ul>
            </div>
          </div>
        </div>
      </nav>
      

  
  