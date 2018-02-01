<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="apple-touch-icon" sizes="76x76" href="view/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="view/assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Solicitar Coleta</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="view/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="view/assets/css/now-ui-kit.css" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="view/assets/css/demo.css" rel="stylesheet" />
<script type="text/javascript">
	function validaCep() {

		var cep = document.formulario.cep;
		if (cep.value.length == 5) {
			cep.value += "-";
		}
	}
</script>
<style type="text/css">
label.hora {
	display: inline-block;
	width: 120px;
}
</style>

</head>
<body class="index-page sidebar-collapse">

<nav class="navbar navbar-expand-lg bg-primary fixed-top  " color-on-scroll="400">
        <div class="container">
            <div class="navbar-translate">
                <a class="navbar-brand" href="#" rel="tooltip" title="Designed by Invision. Coded by Creative Tim" data-placement="bottom" target="_blank">
                    Garbage Collector
                </a>
                <button class="navbar-toggler navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-bar bar1"></span>
                    <span class="navbar-toggler-bar bar2"></span>
                    <span class="navbar-toggler-bar bar3"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse justify-content-end" id="navigation" data-nav-image="view/assets/img/blurred-image-1.jpg">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="scrollToDownload()">
                            <i class="now-ui-icons files_single-copy-04"></i>
                            <p>Sobre </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" target="_blank">
                            <i class="now-ui-icons files_paper"></i>
                            <p>Cadastrar</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-neutral" href="#" target="_blank">
                            <i class="now-ui-icons users_single-02"></i>
                            <p>Login</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" rel="tooltip" title="Follow us on Twitter" data-placement="bottom" href="" target="_blank">
                            <i class="fa fa-twitter"></i>
                            <p class="d-lg-none d-xl-none">Twitter</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" rel="tooltip" title="Like us on Facebook" data-placement="bottom" href="" target="_blank">
                            <i class="fa fa-facebook-square"></i>
                            <p class="d-lg-none d-xl-none">Facebook</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" rel="tooltip" title="Follow us on Instagram" data-placement="bottom" href="" target="_blank">
                            <i class="fa fa-instagram"></i>
                            <p class="d-lg-none d-xl-none">Instagram</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

	<h1 align="center">Solicite sua coleta</h1>
	<div align="center">
		<h3 style="color: blue">${msg}</h3>
	</div>
	<form class="form-inline" action="CadastraSolicitarColeta"
		method="post" name="formulario">
		             
		
		<br> <br>
		<div class="form-group">
			<label for="exampleInputDescricao" class="hora">Descrição:</label> <input
				type="text" class="form-control" id="exampleInputDescricao"
				placeholder="Garrafa pet"
				required="Para realizar a coleta preencha este campo com a descrição do material"
				style="width: 200px;" required="required" name="descricao"
				maxlength="30">
		</div>
		<br> <br>
		<div class="form-group">
			<label for="exampleInputQuantidade" class="hora">Quantidade:</label>
			<input type="text" class="form-control" id="exampleInputQuantidade"
				required="Para realizar a coleta preencha este campo com a quantidade de materiais que você vai doar"
				style="width: 200px;" name="quantidade" maxlength="10">
		</div>
		<br> <br>
		<div class="form-group">
			<label for="exampleInputEndereco" class="hora">Endereço da
				coleta:</label> <input type="text" class="form-control"
				required="Para realizar a coleta preencha este campo com o endereço desejado da coleta"
				id="exampleInputEndereco" style="width: 200px;" maxlength="50"
				name="endereco" placeholder="Rua joão de barros">
		</div>
		<br> <br>
		<div class="form-group">
			<label for="exampleInputNumero" class="hora">Número:</label> <input
				type="text" class="form-control" id="exampleInputNumero"
				placeholder="A222"
				required="Para realizar a coleta preencha este campo com o número da sua casa"
				style="width: 200px;" required="required" name="numero" minlegth="2"
				maxlength="6">
		</div>
		<br> <br>
		<div class="form-group">
			<label for="exampleInputCep" class="hora">CEP:</label> <input
				type="text" class="form-control" id="exampleInputCep"
				placeholder="00000-000" maxlength="9" style="width: 200px;"
				required="Para realizar a coleta preencha este campo com o cep da sua rua"
				maxlength="9" name="cep" pattern="\d{5}-?\d{3}"
				onkeypress="validaCep()">
		</div>
		
		<br> <br>
		<div class="row" id="checkRadios">
                        <div class="col-sm-6 col-lg-3">
                            <p class="category">Material</p>
                            <div class="checkbox">
                                <input id="checkbox1" type="checkbox" name="tipoColeta" value="Papel">
                                <label for="checkbox1">
                                    Papel
                                </label>
                            </div>
                            <div class="checkbox">
                                <input id="checkbox2" type="checkbox" name="tipoColeta" value="Metal">
                                <label for="checkbox2">
                                    Metal
                                </label>
                            </div>
                            <div class="checkbox">
                                <input id="checkbox3" type="checkbox" name="tipoColeta" value="Ferro">
                                <label for="checkbox3">
                                    Ferro
                                </label>
                            </div>
                            
                            
                            </div>
                        </div>
		<br> <br>
		<button type="submit" class="btn btn-success">Doar</button>
	</form>

	<!-- jQuery (necessario para Bootsrap plungins Java Script) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="view/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>