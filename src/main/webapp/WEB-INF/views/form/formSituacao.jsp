<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html lang="pt-br">
 

 <head>
   <title>CRIAR SITUAÇÃO</title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
   <script src="../resources/js/bootstrap.js"></script>
   <script src="../resources/js/jquery.js"></script>
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
              <li><a href="#">Gallery</a></li>
              <li><a href="#">Contact</a></li>-->
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="../sair"> <span
							class="glyphicon glyphicon-log-in"></span>Sair
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<header>
		<div class="w3-container  w3-teal">
			<h2 class="w3-center">CRIAR SITUAÇÃO</h2>
		</div>
		<div class="w3-row">
			<form:form class="w3-container w3-card-4" action="${spring:mvcUrl('FC#criarSituacao').build()}" commandName="situacao">
					${msg}
				<p class="w3-col s2"></p>

				<p class="w3-col s12">
					<label for="id_sit">Situação </label> <input type="text"
						name="nome" id="id_sit" class="w3-input w3-light-grey " required>
				</p>
				<p class="w3-col s12">
					<button class="w3-button w3-block w3-teal" style="width: 30%">SAVAR</button>
				</p>
			</form:form>
		</div>
	</header>
<footer class="w3-container">
    <p class="w3-center ">SiGer 2018 &copy; Stenio Neves|<a href="https://twitter.com/stenioneves1">twitter</a></p>
</footer>
</body>

</html>