<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modulo de gasto cr�dito</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/cssTelaPrincipal.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
				<li class="active"><a href="../principal">Inicio</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Acesso Rapido <span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="../form/formgasto">Informar Gasto</a></li>
						<li><a href="../form/formfatura">Criar Fatura</a></li>
						<li><a href="../form/formcategoria">Criar Categoria </a></li>
						<li><a href="../form/formmetodo">Cadastrar Metodo</a></li>
						<li><a href="todasfaturas">Faturas Pedente</a></li>
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
	<div class="w3-container efeito">
		<h2>Esse � o retono para</h2>
		<p>
			${modo}
			<!--fatura de gasto em aberto na modalidade credito e o cart�o associado:-->
		</p>
		<ul class="w3-ul w3-card-4 w3-hoverable">
			<c:forEach var="fatura" items="${cons}">
				<li class="w3-bar"
					onclick="document.getElementById('${fatura.gf.codfatura}').style.display='block'">
					<span onclick="this.parentElement.style.display='none'"
					class="w3-bar-item w3-button w3-white w3-xlarge w3-right">�</span>
					<img src="${fatura.gf.metodotipo.fileimg}"
					class="w3-bar-item w3-round w3-hide-small" style="width: 130px">
					<div class="w3-bar-item">
						<span class="w3-xlarge">${fatura.gf.metodotipo.nome}</span><br>
						<!-- Pode ser substituido pelo Angular -->
						<span>${fatura.gf.situacao.nome}</span><br> <span
							class="w3-center w3-small w3-opacity">
							${fatura.gf.responsavel.nome}</span>
						<!-- fatura � uma estrutura de dados compexa aten��o-->
					</div>

				</li>
			</c:forEach>


		</ul>
		<c:forEach var="fat_gs" items="${cons}">
			<div id="${fat_gs.gf.codfatura}" class="w3-modal">
				<div class="w3-modal-content">

					<header class="w3-container w3-indigo"> <span
						onclick="document.getElementById('${fat_gs.gf.codfatura}').style.display='none'"
						class="w3-button w3-display-topright">&times;</span>
					<h2>Gastos associados a fatura: ${fat_gs.gf.codfatura}</h2>
					</header>
					<div class="w3-container">
						<table class="w3-table-all">
							<thead>
								<tr class="w3-light-grey w3-hover-red">
									<th>Nome</th>
									<th>Tipo</th>
									<th>valor</th>
								</tr>
							</thead>
							<c:forEach var="gasto" items="${fat_gs.gastos_associados}">
								<tr class="w3-hover-blue">
									<td>${gasto.nome}</td>
									<td>${gasto.categoria.nome}</td>
									<td>${gasto.valor}</td>

								</tr>
							</c:forEach>
							<!--  
                  <tr class="w3-hover-green">
                    <td>Jean Neves</td>
                    <td>Servi�os Web</td>
                    <td>500.00</td>
                  </tr>
                  <tr class="w3-hover-blue">
                    <td>Eve</td>
                    <td>Jackson</td>
                    <td>94</td>
                  </tr>
                  <tr class="w3-hover-black">
                    <td>Adam</td>
                    <td>Johnson</td>
                    <td>67</td>
                  </tr>
                  <tr class="w3-hover-text-green">
                    <td>Bo</td>
                    <td>Nilson</td>
                    <td>35</td>
                  </tr>
                  -->
						</table>
					</div>
					<footer class="w3-container w3-indigo">
					<p>texto</p>
					</footer>
				</div>
			</div>
		</c:forEach>
	</div>
	<!--
<footer class="container-fluid text-center">
  <p>Stenio Neves|<a href="https://twitter.com/stenioneves1">Twitter</a></p>
</footer>
-->

</body>
</html>