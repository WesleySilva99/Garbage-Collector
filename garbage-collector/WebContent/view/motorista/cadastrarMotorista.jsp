<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Cadastro de Usuário</title>

<!-- Bootstrap -->
<link href="view/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<!-- Formulario -->

	<form class="form-inline" action="cadastrarUsuario" method="post">
		<div class="form-group">
			<label for="exampleInputName">Nome Completo:</label> <input
				type="text" class="form-control" id="exampleInputName"
				placeholder="" required="required" maxlength="50" name="nome">

		</div>
		<br>
		
		<div class="form-group">
		<label for="sexo">Sexo</label>
		<select class="form-control" name="sexo">
			<option value="M">Masculino</option>
			<option value="F">Feminino</option>
			<option value="O">Outros</option>
		</select>
		</div>
		<div class="form-group">
			<label for="exampleInputCpf">CPF:</label> <input type="text"
				class="form-control" id="exampleInputCpf"
				placeholder="000.000.000-00" min="14" maxlength="14"
				required="required" name="cpf">
		</div>
		<br>

		<div class="form-group">
			<label for="exampleInputName">RG:</label> <input type="text"
				class="form-control" id="exampleInputName" placeholder="João15"
				required="required" maxlength="15" name="nomeUsuario">
		</div>
		<br>

		<div class="form-group">
			<label for="exampleInputTelefone">Telefone:</label> <input
				type="text" class="form-control" id="exampleInputTelefone"
				placeholder="(00) 00000-0000" required="required" maxlength="15"
				name="telefone">
		</div>
		<br>

		<div class="form-group">
			<label for="exampleInputEndereco">Estado:</label> <input type="text"
				class="form-control" id="exampleInputEndereco" required="required"
				maxlength="50" name="endereco">
		</div>
		<br>

		<div class="form-group">
			<label for="exampleInputEndereco">Cidade:</label> <input type="text"
				class="form-control" id="exampleInputEndereco" required="required"
				maxlength="50" name="endereco">
		</div>
		<br>

		<div class="form-group">
			<label for="exampleInputEndereco">Endereço:</label> <input
				type="text" class="form-control" id="exampleInputEndereco"
				placeholder="Rua Don Juno nº 425" required="required" maxlength="50"
				name="endereco">
		</div>
		<br>



		<div class="form-group">
			<label for="exampleInputEndereco">Bairro:</label> <input type="text"
				class="form-control" id="exampleInputEndereco" required="required"
				maxlength="50" name="endereco">
		</div>
		<br>

		<div class="form-group">
			<label for="exampleInputCep">CEP:</label> <input type="text"
				class="form-control" id="exampleInputCep" placeholder="00000-000"
				maxlength="9" required="required" maxlength="9" name="cep">
		</div>
		<br>

		<div class="form-group">
			<label for="exampleInputCep">Numero da Habilitação:</label> <input
				type="number" class="form-control" id="exampleInputCep"
				required="required" name="cep">
		</div>
		<br>
		
		<div class="form-group">
			<label for="exampleInputCep">Categoria:</label> <input
				type="text" class="form-control" id="exampleInputCep"
				required="required" name="cep">
		</div>
		<br>

		<div class="form-group">
			<label for="exampleInputData">Data de vencimento da carteira:</label>
			<input type="text" class="form-control" id="exampleInputData"
				required="required" name="dataNascimento">
		</div>
		<br>
		
		<div class="form-group">
			<label for="exampleInputCep">Placa do veiculo:</label> <input
				type="text" class="form-control" id="exampleInputCep"
				required="required" name="cep">
		</div>
		<br>
		
		<div class="form-group">
			<label for="exampleInputCep">Marca:</label> <input
				type="text" class="form-control" id="exampleInputCep"
				required="required" name="cep">
		</div>
		<br>
		
		<div class="form-group">
			<label for="exampleInputCep">Ano do veiculo:</label> <input
				type="text" class="form-control" id="exampleInputCep"
				required="required" name="cep">
		</div>
		<br>







		<div class="form-group">
			<label for="exampleInputEmail">E-mail:</label> <input type="email"
				class="form-control" id="exampleInputEmail"
				placeholder="João@exemplo.com" required="required"
				pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" maxlength="50"
				name="email">
		</div>
		<br>
		<div class="form-group">
			<label for="exampleInputPassword1">Senha:</label> <input
				type="password" class="form-control" id="exampleInputPassword1"
				required="required" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				maxlength="30" name="senha"
				title="A senha deve ter no mínimo 8 e 30 no máximo, que sejam de pelo menos um número e uma letra maiúscula e minúscula:">
		</div>
		<br>

		<div class="form-group">
			<label for="exampleInputPassword1">Repita sua senha:</label> <input
				type="password" class="form-control" id="exampleInputPassword1"
				required="required" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				maxlength="30">
		</div>
		<br>



		<button type="submit" class="btn btn-default">Submit</button>
	</form>

	<!-- jQuery (necessario para Bootsrap plungins Java Script) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="view/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>