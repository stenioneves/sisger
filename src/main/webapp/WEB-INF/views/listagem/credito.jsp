<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modulo de gasto crédito</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="../css/cssTelaPrincipal.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">${usuario.nome}</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="../principal">Inicio</a></li>
       <li><a href="#">Gerenciar</a></li>
       <!--- 
        <li><a href="#">Gallery</a></li>
        <li><a href="#">Contact</a></li>-->
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="../sair"><span class="glyphicon glyphicon-log-in"></span>Sair</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="w3-container efeito">
  <h2>Listagem </h2>
  <p> Listando <!--fatura de gasto em aberto na modalidade credito e o cartão associado:--></p>
  <ul class="w3-ul w3-card-4 w3-hoverable">
   <c:forEach var="fatura" items="${cons}">
    <li class="w3-bar" onclick="document.getElementById('id01').style.display='block'">
      <span onclick="this.parentElement.style.display='none'" class="w3-bar-item w3-button w3-white w3-xlarge w3-right">×</span>
      <img src="imgs/ourcard.png" class="w3-bar-item w3-round w3-hide-small" style="width:85px">
      <div class="w3-bar-item">
        <span class="w3-xlarge">${fatura.metodotipo.nome}</span><br>
        <span>${fatura.situacao.nome}</span><br>
        <span class="w3-center w3-small w3-opacity"> ${fatura.responsavel.nome}</span>
      </div>
    
    </li>
    </c:forEach>

    
  </ul>
  <div id="id01" class="w3-modal">
      <div class="w3-modal-content">
        
          <header class="w3-container w3-indigo">
          <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-display-topright">&times;</span>
          <h2>Texto..</h2>
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
                </table>
        </div>
        <footer class="w3-container w3-indigo">
          <p> texto</p>
        </footer>
      </div>
    </div>
</div>
<!--
<footer class="container-fluid text-center">
  <p>Stenio Neves|<a href="https://twitter.com/stenioneves1">Twitter</a></p>
</footer>
-->

</body>
</html>