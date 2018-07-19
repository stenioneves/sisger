<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Módulo de Histórico</title>
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
						<li><a href="../form/formfatura">Criar Historico</a></li>
						<li><a href="../form/formcategoria">Criar Categoria </a></li>
						<li><a href="../form/formmetodo">Cadastrar Metodo</a></li>
						<li><a href="todasfaturas">Historico Pedente</a></li>
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
		<h2>Esse é o retono para</h2>
		<p>
			${modo}
			<!--fatura de gasto em aberto na modalidade credito/Debito e dinheiro fisico e o cartão associado:-->
		</p>
		<ul class="w3-ul w3-card-4 w3-hoverable">
			<c:forEach var="fatura" items="${cons}">
				<li class="w3-bar"
					onclick="document.getElementById('${fatura.gf.codfatura}').style.display='block'" title=" Valor parcial R$:${fatura.soma}">
					<span onclick="this.parentElement.style.display='none'"
					class="w3-bar-item w3-button w3-white w3-xlarge w3-right">×</span>
					<span class="w3-bar-item w3-right"><fmt:formatDate value="${fatura.gf.criacao }" pattern="dd/MM/yyyy"/></span>
					<img src="${fatura.gf.metodotipo.fileimg}"
					class="w3-bar-item w3-round w3-hide-small" style="width: 130px">
					<div class="w3-bar-item">
						<span class="w3-xlarge" >${fatura.gf.metodotipo.nome}</span><br>
						<!-- Pode ser substituido pelo Angular -->
						<span class="${fatura.gf.situacao.nome=='Pendente'?'label label-danger':'label label-success'}">${fatura.gf.situacao.nome}</span><br> <span
							class="w3-center w3-small w3-opacity">
							${fatura.gf.responsavel.nome}</span>
						<!-- fatura é uma estrutura de dados compexa atenção-->
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
					<h5>Gastos associados ao historico: ${fat_gs.gf.codfatura}</h5>
					</header>
					<div class="w3-container">
						<table class="w3-table-all">
							<thead>
								<tr class="w3-light-grey w3-hover-red">
									<th>Nome</th>
									<th>Tipo</th>
									<th>Valor</th>
									<th>Data</th>
								</tr>
							</thead>
							<c:forEach var="gasto" items="${fat_gs.gastos_associados}">
								<tr class="w3-hover-blue">
									<td>${gasto.nome}</td>
									<td>${gasto.categoria.nome}</td>
									<td>${gasto.valor}</td>
									<td><fmt:formatDate value="${gasto.dateGasto}" pattern="dd/MM/yyyy"/>  </td>
								</tr>
							</c:forEach>
							<!--  
                  <tr class="w3-hover-green">
                    <td>Jean Neves</td>
                    <td>Serviços Web</td>
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
					<p>Total R$: ${fat_gs.soma}</p>
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