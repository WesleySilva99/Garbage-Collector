<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="dao" class="br.com.nasa.model.UsuarioDao"/>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<table border="1">

	<tr>
		<td>Nome </td>
		<td>Nome de Usuario </td>
		<td>CPF </td>
		<td>Data de Nascimento</td>
		<td> CEP</td>
		<td> Endereço </td>
		<td> Telefone</td>
		<td> Email</td>
		<td> Foto de Usuario</td>
	</tr>
	
	
	
	<c:forEach var="u" items="${dao.listar()}">
	
	
	<tr>
		<td>${u.nome}</td>
		<td>${u.nomeUsuario} </td>
		<td>${u.cpf} </td>
		<td>${u.dataNascimento}</td>
		<td>${u.cep}</td>
		<td>${u.endereco}</td>
		<td>${u.telefone}</td>
		<td>${u.email}</td>
		
		<td>
		${u.imagem}
			 <img alt="" src="/view/img/${u.imagem}">
			
		</td>
	</tr>
	
		</c:forEach>
	</table>



</body>
</html>