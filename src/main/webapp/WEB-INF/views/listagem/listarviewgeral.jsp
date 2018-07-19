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
<link rel="stylesheet" href="../resources/css/cssTelaPrincipal.css">
	
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
    			<h1 class="panel-title co-titulo-panel"> ${modo}</h1>
    		   
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
	       <th scope="col">Responsável</th>
	       <th scope="col"></th>
	       
	     </tr>
	      </thead>
	      <tbody>
	     <c:forEach var="historico" items="${cons}">
	     <tr>
	     <td scope="row"><a href="gasto/${historico.gf.codfatura }">${historico.gf.codfatura}</a></td>
	     <td><img class="img-rounded" src="${historico.gf.metodotipo.fileimg}" style="width:10%"/><p class="metodo">${historico.gf.metodotipo.nome}</p></td>
	     <td>${historico.soma}</td>
	     <td><fmt:formatDate value="${historico.gf.criacao}" pattern="dd/MM/yyyy"/></td>
	     <td><fmt:formatDate value="${historico.gf.fechamento}" pattern="dd/MM/yyyy"/></td>
	     <td >
	     <span class="${historico.gf.situacao.nome =='Pendente'?'label label-danger':'label label-success'}">
	     
	     ${historico.gf.situacao.nome}</span>
	     </td>
	     <td >${historico.gf.responsavel.nome}</td>
	     
	     <td> <c:if test="${historico.gf.situacao.nome =='Pendente'}"> <span class="label label-primary">Fechar</span>
	        </c:if> 
	        <a class="btn btn-link btn-xs btc" data-toggle="modal" data-target="#ExibirLancamento${historico.gf.codfatura }" title="Lançamentos"><span class="glyphicon glyphicon-eye-open"></span></a>
	     </td>
	     
	     </tr>
	    </c:forEach>
	    </tbody>
	    </table>
	 
	     </div>
	    </div>       
	
	<c:forEach var="fat_gs" items="${cons}">        
	         
<div class="modal fade" id="ExibirLancamento${fat_gs.gf.codfatura}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Histórico de Lançamento</h4>
      </div>
      <div class="modal-body">
         <div class="table-responsive">
        <table class="table">
           <thead>
            <tr>
            <th>#</th>
             <th>Nome</th>
             <th>Tipo</th>
             <th>Valor</th>
             <th>Data</th>
             
             <th></th>
            
            </tr>
           
           </thead>
           <tbody>
           
           <c:forEach var="gasto" items="${fat_gs.gastos_associados}">
								<tr class="w3-hover-blue">
								    <td>${gasto.idGasto }</td>
									<td>${gasto.nome}</td>
									<td>${gasto.categoria.nome}</td>
									<td>${gasto.valor}</td>
									<td><fmt:formatDate value="${gasto.dateGasto}" pattern="dd/MM/yyyy"/>  </td>
									<td><a href="gasto/${gasto.idGasto}" class="btn btn-link btn-xs"><span class="glyphicon glyphicon-search"></span></a></td>
								</tr>
							</c:forEach>
           
           
           
           
           </tbody>
           
           
       </table>
     </div>
       
       
       
       
       
       
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Fechar</button>
         
      </div>
    </div>
  </div>
</div>
	</c:forEach>
	
	</body>
	</html>