<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/style2.css" rel="stylesheet">
<link href="css/estilosTabla.css" rel="stylesheet">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script src="https://kit.fontawesome.com/81046aa3bf.js" crossorigin="anonymous"></script>
<title>Menu</title>
</head>
<body>

	<%
		HttpSession sesion = request.getSession();
		if(sesion.getAttribute("objeto")==null){
			response.sendRedirect("error.jsp");
			//sesion.invalidate();
		}
	%>	

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a href="menu.jsp" style="text-decoration: none;">
	      <img src="img/covid19.svg" alt="logo covid 19" style="height: 4em;"> Covid-19</a>      
    </div>
    <ul class="nav navbar-nav">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="list-ciudadano.jsp">Ciudadanos <span class="caret"></span></a>
      	<ul class="dropdown-menu">
	    	<li><a href="list-ciudadano.jsp">Recepcionados</a></li>
      		<li><a href="list-estado.jsp">Infectados</a></li>
      	</ul>
      </li>
      <li><a href="list-usuario.jsp">Usuario</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Hola, ${sessionScope.objeto.nomusuario} ${sessionScope.objeto.patusuario}</a></li>
      <li><a class="cerrar" href="ServletCiudadano?opcion=cerrarSesion"><span class="glyphicon glyphicon-log-in"></span> Cerrar</a></li>
    </ul>
  </div>
</nav>
</body>
</html>




