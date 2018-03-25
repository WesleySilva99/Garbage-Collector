<%@ page language="java" contentType="text/html; charset=iso-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="apple-touch-icon" sizes="76x76"
	href="view/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="view/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Login</title>
<meta name="description" content="Free Bootstrap Theme by BootstrapMade.com">
  <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="view/novoTemplate/css/style.css">
  
  <style >
  
  @font-face {
    font-family: 'TitilliumWeb';
    src: url(../font-style/TitilliumWeb-Light.ttf) format('truetype');
} 
body{
     font-family: 'TitilliumWeb';
}

::selection {
    color: #fff;
    background: #8956cf;
}
::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
    border-radius: 10px;
    background-color: #F5F5F5;
    display:none;
}
::-webkit-scrollbar {
    width: 6px;
    background-color: #F5F5F5;
    display:none;
}
::-webkit-scrollbar-thumb {
    border-radius: 10px;
    -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, .3);
    background-color: #8956cf;
    display:none;
}

.main-container{
    position: relative;
    display:block;
    width:100%;
}
#content_body {
    width: 100%;
    display: block;
    margin-left: 190px;
    transition: all .3s cubic-bezier(.55,0,.1,1);
}
.margin_left{
    margin-left:0px!important;
     transition: all .3s cubic-bezier(.55,0,.1,1);
}

/*===================TOP NAVBAR FIXED NAVBAR===================*/
 .admin-navbar {
     background-color: rgb(66, 133, 244);
     border-color: rgb(66, 133, 244);
     box-shadow: rgba(0, 0, 0, 0.12) 0px 1px 3px, rgba(0, 0, 0, 0.24) 0px 1px 2px;
}
 .navbar {
     position: relative;
     min-height: 64px;
     margin-bottom: 20px;
     border: 1px solid transparent;
}
 .navbar-herader {
     display: inline-block;
}
 .navbar button:focus {
     outline: none;
}
 .navbar button {
     border: none;
     width: 50px;
     cursor: pointer;
     height: 50px;
     color: white;
     padding: 11px 15px;
     font-size: 21px;
     border-radius: 100%;
     background: #4284f4;
     margin-top: 5px;
     position: relative;
}
/* Ripple magic */
 .navbar button{
     position: relative;
     overflow: hidden;
}
 .navbar button:after {
     content: '';
     position: absolute;
     top: 50%;
     left: 50%;
     width: 5px;
     height: 5px;
     background: rgba(255, 255, 255, .5);
     opacity: 0;
     border-radius: 100%;
     transform: scale(1, 1) translate(-50%);
     transform-origin: 50% 50%;
}
 @keyframes ripple {
     0% {
         transform: scale(0, 0);
         opacity: 1;
    }
     20% {
         transform: scale(25, 25);
         opacity: 1;
    }
     100% {
         opacity: 0;
         transform: scale(40, 40);
    }
}
 .navbar button:focus:not(:active)::after {
     animation: ripple 1s ease-out;
}
 .admin-chat-logo img{
     width:50%;
}
 .notification-btn {
     color: #fff;
     background-color: transparent;
     border-color: transparent;
     font-size: 21px;
     margin-top: 10px;
}
 .btn:hover, .btn:focus, .btn.focus {
     color: #fff;
     text-decoration: none;
}
 .btn:active, .btn.active {
     box-shadow: none;
}
 .notification-btn .badge {
     color: #010101;
     background-color: #fff;
}
 button .badge {
     position: relative;
     top: -40px;
     right: -10px;
}
@media (min-width: 768px){

.container > .navbar-header, .container-fluid > .navbar-header, .container > .navbar-collapse, .container-fluid > .navbar-collapse {
    margin-right: 0;
    margin-left: -10px;
}
    }

/*********notification*********/

.pull-right > .dropdown-menu {
    right: 0;
    left: auto;
    top: 60px;
}
.dropdown-menu {
    position: absolute;
    top: 107%;
    left: 0;
    z-index: 1000;
    display: none;
    float: left;
    min-width: 280px;
    padding: 0px;
    margin: 2px 0 0;
    font-size: 14px;
    text-align: left;
    list-style: none;
    background-color: #fff;
    -webkit-background-clip: padding-box;
    background-clip: padding-box;
    border: none;
    border: 0px solid;
    border-radius: 0px;
    -webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
    box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
}
.dropdown-menu:after {
    border-bottom: 6px solid #ffffff;
    border-left: 6px solid rgba(0, 0, 0, 0);
    border-right: 6px solid rgba(0, 0, 0, 0);
    content: "";
    display: inline-block;
    right: 24px;
    position: absolute;
    top: -6px;
}
.dropdown-menu > li > a:hover, .dropdown-menu > li > a:focus {
    color: #262626;
    text-decoration: none;
    background-color: transparent;
}
.card-title-text{
    padding-left:15px;
}

.list-group-item {
    position: relative;
    display: block;
    padding: 5px 0px;
    margin-bottom: 0px;
    background-color: #fff;
    border: solid 0px;
    border-bottom: 1px solid #ddd;
}

.media-object {
    display: block;
    border-radius: 50%;
}
.dropdown-menu > li > a {
    display: block;
    padding: 3px 15px;}

.notifications_title {
    font-size: 15px;
    color: #4CAF50;
    text-align: right;
    padding: 3px;
    padding-right: 10px;
}
/*******************TOP NAVBAR FIXED NAVBAR END*******************/
 

/*=======================SIDEBAR NAV START=======================*/
.hit_sidebar{
    position: relative;
    display: block;
    min-height: 100%;
    overflow-y: auto;
    overflow-x: hidden;
    overflow: hidden;
    border: none;
    transition: all .3s cubic-bezier(.55,0,.1,1);
    padding-top: 64px;
    background: #fff;
    width: 280px;
    background-color: #1f2f46;
/*    transform: translate3d(-280px,0,0);*/
    
    
}
.small_sidebar{    
    width: 80px;
    min-width: 64px;
    transform: translate3d(0px, 0px, 0px);
    -webkit-transform: translate3d(0, 0, 0);
    -moz-transform: translate3d(0, 0, 0);
   
}
.sidebar-open {
    min-width: 274px;
    width: 274px;
    transform: translate3d(0,0,0);
}
.sidebar-slide-push {
    position: fixed;
    top: 0;
    bottom: 0;
    z-index: 999;
    left: -15px;
}


/************************SIDEBAR NAV START END************************/
aside ul{
    margin:0px;
    padding:0px;
}
aside ul li{
    list-style-type: none;
}
aside ul li a{
    font-family: 'TitilliumWeb';
    display:block;
    text-decoration:none;
    text-align:left;
    color: #c8c8c8;
    background-color: transparent;
    font-size: 16px;
    padding: 18px 20px 16px;
    transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -webkit-transition: all 0.5s ease;
}
aside ul li a:hover{
    background-color:#1A293F;
    color:#fff;
    text-decoration: none;
    
}
a:focus {
    outline: none;
    outline-offset: none;
}

aside a:hover, a:focus {
    color: #fff;
    text-decoration: none;
    background-color:#1A293F;
}
aside ul li a .nav-icon{
    margin-right:15px;
    font-size:20px!important;
}

.remove_text{
     transition-delay: 2s;
}
.text_hide{
    display:none;
     transition-delay: 2s;
}
aside ul li a span{
    display: table-cell;
    padding-left:15px;
}
  
  </style>
</head>


<body>
	

<c:import url="/view/util/menu.jsp" />
	<!-- Formulario -->

	<br>
	<hr>
	<h1 align="center">Tela de Login</h1>
	<hr>
	<br>
	<center>
		<fieldset>
			<h4 align="center">Login</h1><br><br>


			<h4 style="color: blue";>${msg}</h4>



			<form class="form-horizontal" action="efetuarLogin" method="post"
				name="formulario" id="formulario">

				<div class="col-4">
				<label for="exampleInputName" class="hora">Login:</label> <input
					type="text" class="form-control" id="exampleInputName"
					 pattern="[a-zA-Z0-9]+" style="width: 25%"
					;
					required="Para realizar o cadastro preencha este campo com seu nome de usuário"
					maxlength="10" name="login" minlength="3">
				</div>
				<div class="col-4">
					<label for="exampleInputPassword1" class="hora">Senha:</label> <input
						type="password" class="form-control" id="exampleInputPassword1"
						required="Para realizar o cadastro preencha este campo com sua senha"
						pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" minlength="8"
						maxlength="32" name="senha" style="width: 25%" ; id="senha"
						title="A senha deve ter no mínimo 8 e 32 no máximo, que sejam de pelo menos um número e uma letra maiúscula e minúscula.">
				</div>
				<br><br>




				<button type="submit" class="btn btn-success"
					onClick="validarCadastro()">Logar</button>
			</form>

		</fieldset>
	</center>




	
	<!-- jQuery (necessario para Bootsrap plungins Java Script) -->
	 <script src="view/novoTemplate/js/jquery.min.js"></script>
  <script src="view/novoTemplate/js/jquery.easing.min.js"></script>
  <script src="view/novoTemplate/js/bootstrap.min.js"></script>
  <script src="view/novoTemplate/js/custom.js"></script>
  <script src="view/novoTemplate/contactform/contactform.js"></script>
</body>
</html>