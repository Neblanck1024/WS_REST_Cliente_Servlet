<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Login Form</title>
  <link href="css/bootstrapValidator.min.css" rel="stylesheet"></link>

  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/bootstrapValidator.min.js"></script> 
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
	<!-- leer el atributo msj -->
	<c:set var="mensaje" value="${requestScope.msj }"/>
  <section class="container">
    <div class="login">
      <h1>Error de Sesión</h1>
    </div>
  </section>
</body>
</html>
