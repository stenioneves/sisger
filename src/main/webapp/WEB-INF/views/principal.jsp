<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html lang="pt-br">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Principal</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/cssTelaPrincipal.css">
</head>
<body>
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
					<li class="active"><a href="#">Inicio</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Acesso Rapido <span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="form/formgasto">Informar Gasto</a></li>
							<li><a href="form/formfatura">Criar Historico</a></li>
							<li><a href="form/formcategoria">Criar Categoria </a></li>
							<li><a href="form/formmetodo">Cadastrar Metodo</a></li>
						</ul></li>
					<!--- 
        <li><a href="#">Gallery</a></li>
        <li><a href="#">Contact</a></li>-->
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="sair"><span
							class="glyphicon glyphicon-log-in"></span>Sair</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="jumbotron">
		<div class="container text-center">
			<h1>SisGer</h1>
			<p>Sistema de gerenciamento de gasto pessoal</p>
		</div>
	</div>
	<div id="efeito">
		<div class="container-fluid bg-3 text-center">
			<h3>Categorias para consulta</h3>
			<br>
			<div class="row">
				<div class="col-sm-3  ">
					<p class=" panel panel-primary">Gasto com cartão de crédito</p>
					<figure>
						<img src="resources/img/cartoesCreditoDebito.jpg"
							class="img-responsive" style="width: 100" alt="Image">
						<figcaption>
							<a href="listagem/credito"><button
									class="btn btn-info btn-conf">Acessar</button></a>
						</figcaption>
					</figure>
				</div>
				<div class="col-sm-3">
					<p class="panel panel-danger">Informar Gasto</p>
					<figure>
						<img src="resources/img/contas_faturas.jpg" class="img-responsive"
							style="width: 100%" alt="Image">
						<figcaption>
							<a href="form/formgasto"><button class="btn btn-info btn-conf">Acessar</button></a>
						</figcaption>
					</figure>
				</div>
				<div class="col-sm-3 ">
					<p class="panel panel-success">Gasto Dinheiro/Débito</p>
					<figure>
						<img src="resources/img/dinheiro.jpeg" class="img-responsive"
							style="width: 100%" alt="Image">
						<figcaption>
							<a href="listagem/dinheiro"><button class="btn btn-info btn-conf">Acessar</button></a>
						</figcaption>
					</figure>
				</div>
				 
				<div class="col-sm-3">
					<p class="panel panel-warning ">Criar Historico</p>
					<figure>
						<img src="resources/img/cifrao.jpg" class="img-responsive"
							style="width: 68%" alt="Image">
						<figcaption>
							<a href="form/formfatura"><button class="btn btn-info btn-conf">Acessar</button></a>
						</figcaption>
					</figure>
				</div>
				
			</div>
		</div>
		<br>

		<div class="container-fluid bg-3 text-center ">
			<div class="row">
				



			</div>
		</div>
	</div>
	<br>
	<br>

	<footer class="container-fluid text-center">
		<p>
			Stenio Neves|<a href="https://twitter.com/stenioneves1">Twitter</a>
		</p>
	</footer>
</body>
</html>