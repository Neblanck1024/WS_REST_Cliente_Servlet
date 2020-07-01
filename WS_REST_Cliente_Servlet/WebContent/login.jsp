<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="menu-principal.jsp"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Login</title>
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/style2.css">
</head>
<body>

	<!-- leer el atributo msj -->
	<c:set var="mensaje" value="${requestScope.msj }"/>
  <section class="container">
    <div class="login">
      <h1>Login</h1>
      <form method="post" action="ServletCiudadano?opcion=iniciarSesion">
        <p><input type="text" name="login" placeholder="Username or Email"></p>
        <p><input type="password" name="clave" placeholder="Password"></p>
        <p class="submit"><input type="submit" id="buton"  value="Login"></p>
        <font color="red"><c:out value="${mensaje}"/></font>
      </form>
    </div>
  </section>
</body>
</html>
