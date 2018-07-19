<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
<title>Informe o Gasto</title>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/jquery-ui.css">
<script src="../resources/js/jquery.js"></script>
<script src="../resources/js/myjs/myjs.js"></script>
<script src="../resources/js/jquery-ui.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="w3-container">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">${usuario.nome}</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="../principal">Inicio</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Acesso Rapido <span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="../listagem/listargasto">listar Gasto</a></li>
							<li><a href="../listagem/credito">Fatura Pendente
									Crédito</a></li>
							<li><a href="../form/formcategoria">Criar Categoria </a></li>
							<li><a href="../form/formmetodo">Cadastrar Metodo</a></li>
						</ul></li>
					<!--- 
              <li><a href="#">Contact</a></li>-->
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="../sair"><span
							class="glyphicon glyphicon-log-in"></span>Sair</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<header>
		<div class="w3-container w3-gray">
			<h2 class="w3-center">FORMULÁRIO DE GASTO</h2>
		</div>
		${msg}
		<div class="w3-row">
			<form:form action="${spring:mvcUrl('FC#salvarGasto').build()}"
				class="w3-container w3-card-4" commandName="gasto">
				<p class="w3-col s4">
					<label>Nome</label> <input class="w3-input  w3-border w3-light-grey"
						type="text" name="nome">
				</p>
				<p class="w3-col s1"></p>
				<p class="w3-col s4">
					<label>Valor</label> <input
						class="w3-input  w3-border w3-light-grey" type="text" name="valor">
				</p>
				<p class="w3-col s12">
					<label>Categoria</label> <select class="w3-select w3-border w3-light-grey"
						name="categoria.id">
						<option value="" disabled selected>Selecione uma opção</option>
						<c:forEach var="categoria" items="${categoria}">
							<option value="${categoria.id }">${categoria.nome}</option>
						</c:forEach>
					</select>
				</p>
				<p class="w3-col s4">
					<label>Data</label>
					<!--  <input type="datetime"  class="w3-input" title="Data do Gasto" name="dateGasto">-->
					<input type="text" id="datepicker" name="dateGasto"
						class="w3-input w3-border w3-light-grey">
				</p>
				<p class="w3-col s1"></p>
				<p class="w3-col s6">
					<label>Metodo de Pagamento:</label> <select
						class="w3-select w3-border w3-light-grey " name="faturaAssociativa.codfatura">
						<option value="" disabled selected>Selecione uma opção</option>
						<c:forEach var="fat" items="${fat}">
							<option value="${fat.codfatura}" >${fat.metodotipo.nome}</option>

						</c:forEach>
					</select>
				</p>
				<p class="w3-col s12">
					<label for="des">Descrição</label> </br>
					<textarea rows="10" cols="140" id="des" class="w3-input w3-border w3-light-grey"
						name="descricao">
   </textarea>
				</p>
				<p class="w3-col s12">
				<button class="w3-button w3-block w3-gray" style="width: 30%">SAVAR</button>
				</p>
			</form:form>
			<br>
		</div>
	</header>

</body>
</html>
