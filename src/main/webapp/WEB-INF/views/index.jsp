<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link href="resources/css/bootstrap.css" rel="stylesheet">
 <link href="resources/css/mycss.css" rel="stylesheet">
 <title>Tela Login</title>
</head>
<body class="fin">
<section class="login-bloq" >

    
        <div class="container">

                <div class="row">
                    <div class="col-md-4 login-sec">
                        <h2 class="text-center">AUTENTICAÇÃO</h2>
                        <form class="login-form" method="post">
              <div class="form-group">
                <label for="Email" class="text-uppercase">Usuário</label>
                <input type="text" class="form-control" placeholder="Digite seu usuário " id="Email" name="email">
                
              </div>
              <div class="form-group">
                <label for="senha" class="text-uppercase">Senha</label>
                <input type="password" class="form-control" placeholder="Informe a sua Senha" id="senha" name="senha">
              </div>
              
              
                <div class="form-check">
                <label class="form-check-label">
                 
                </label>
                <button type="submit" class="btn btn-login float-right">Enviar</button>
              </div>
              
            </form>
            
                    </div>
                    <div class="col-md-8 banner-sec">
                        
                    <div class="banner-text">
                        <h2>Seu gasto</h2>
                        <p>Lance seus gastos no sistema e tenha um melhor controle da sua finança pessoal ;)</p>
                    </div>	
              </div>
                </div>
                
                
                        </div>	   
                        
                 

        
</section>

<!-- Scripts-->

<script src="resources/js/bootsrap.js"></script>
<script src="resources/js/myscript.js"></script>
</body>
</html>