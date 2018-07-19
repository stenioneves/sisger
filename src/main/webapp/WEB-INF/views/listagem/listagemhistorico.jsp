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
	href="../resources/css/bootstrap.min.css">
	
	<script
	src="../resources/js/jquery.js"></script>
	
	
<script
	src="../resources/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="../resources/css/w3.css">
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
	 
	 <div class="panel panel-default">
    		<div class="panel-heading">
    		 <div class="clearfix">
    			<h1 class="panel-title co-titulo-panel">Todos os Históricos de gasto</h1>
    		   
    		 </div>   
    		</div>
	
	    <div class="panel-body">
	
	    <table class="table table-bordered">
	    <thead>
	     <tr>
	     <th scope="col">#</th>
	     <th scope="col">Nome</th>
	      <th scope="col">valor</th>
	       <th scope="col">criaçao</th>
	       <th scope="col">fechamento</th>
	       <th scope="col">status</th>
	       <th scope="col"></th>
	       
	     </tr>
	      </thead>
	      <tbody>
	     <c:forEach var="historico" items="${todoshistoricos}">
	     <tr>
	     <td scope="row"><a href="gasto/${historico.gf.codfatura }">${historico.gf.codfatura}</a></td>
	     <td>${historico.gf.metodotipo.nome}</td>
	     <td>${historico.soma}</td>
	     <td><fmt:formatDate value="${historico.gf.criacao}" pattern="dd/MM/yyyy"/></td>
	     <td><fmt:formatDate value="${historico.gf.fechamento}" pattern="dd/MM/yyyy"/></td>
	     <td >
	     <span class="${historico.gf.situacao.nome =='Pendente'?'label label-danger':'label label-success'}">
	     
	     ${historico.gf.situacao.nome}</span>
	     </td>
	     
	     <td> <c:if test="${historico.gf.situacao.nome =='Pendente'}"> <span class="label label-primary">Fechar</span>
	        </c:if> 
	        <a class="btn btn-link btn-xs" data-toggle="modal" data-target="#ExibirLancamento" title="Lançamentos"><span class="glyphicon glyphicon-list-alt"></span></a>
	     </td>
	     
	     </tr>
	    </c:forEach>
	    </tbody>
	    </table>
	 
	     </div>
	    </div>       
	        
	         
	        <div class="modal fade" id="ExibirLancamento" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Histórico de Lançamento</h4>
      </div>
      <div class="modal-body">
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Fechar</button>
         
      </div>
    </div>
  </div>
</div>
	 
	
	</body>
	</html>