<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Garbage Collector</title>
<meta name="description" content="Free Bootstrap Theme by BootstrapMade.com">
  <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/style.css">
  
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
<!--banner-->
  <section id="banner" class="banner">
    <div class="bg-color"> 
      <div class="container">
        <div class="row">
          <div class="banner-info" style="margin-right: 200px;">
            <div class="banner-logo text-center">
              <img src="view/novoTemplate/img/recycling.png" class="img-responsive">
            </div>
            <div class="banner-text text-center">
              <h1 class="white">Garbage Collector</h1>
              <p>Sistema Integrado de Coleta Seletiva.</p>
              
            </div>
            
            <div align="center" style="position: absolute; top: 700px; left: 550px;">
            	<h6 class="category category-absolute" style="color: white;">Designed by
                    <a href="" target="_blank">
                        <img src="view/novoTemplate/img/logooo.png" style="width:80px;" class="invision-logo" />
                    </a>. Coded by
                    <a href="" target="_blank">
                        <img src="view/novoTemplate/img/nasa.png" style="width:100px;"   class="creative-tim-logo" />
                    </a>.</h6>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ banner-->
  <!--service-->
  
  <!--/ footer-->

  <script src="view/novoTemplate/js/jquery.min.js"></script>
  <script src="view/novoTemplate/js/jquery.easing.min.js"></script>
  <script src="view/novoTemplate/js/bootstrap.min.js"></script>
  <script src="view/novoTemplate/js/custom.js"></script>
  <script src="view/novoTemplate/contactform/contactform.js"></script>


</body>
</html>