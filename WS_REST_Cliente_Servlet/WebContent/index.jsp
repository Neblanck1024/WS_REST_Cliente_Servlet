<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="menu-principal.jsp"/>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<link rel="stylesheet" href="css/style2.css">
<title>Menu</title>
</head>
<style>
	.modal-header, h4, .close {
		background-color: #246355;
		color: white !important;
		text-align: center;
		font-size: 20px;
	}
</style> 
<body>

	<div class="container">
		<div class="abs-center">
			<form id="id_registra" action="" method="post" class="form-inline">
				<div class="form-group">
					<label for="id_departamento">Departamento</label>
					<select class="form-control" id="id_departamento" name="departamento">
						<option value="">[Seleccione]</option>
					</select>
					<button type="button" data-toggle='modal' class='btn btn-primary' id="buscar1">Consulta</button>
				</div>
			</form>
		</div>
	</div>
	
	<br>

	<div class="table-responsive" style="margin: auto; width: 50% !important;">
			<table class="table table-hover">
				<tbody>
				  <tr>
				    <td class="info" align="center" style="font-size: 40px;"><p id="idConta"></p></td>
				    <td class="warning" align="center" style="font-size: 40px;"><p id="idUCI"></p></td>
				  </tr>
				  <tr>
				    <td class="active" align="center">Casos Totales</td>
				    <td class="active" align="center">UCI</td>
				  </tr>
				  <tr>
				    <td class="success" align="center" style="font-size: 40px;"><p id="idRecupe"></p></td>
				    <td class="danger" align="center" style="font-size: 40px;"><p id="idFalle"></p></td>
				  </tr>
				  <tr>
				    <td class="active" align="center">Recuperados</td>
				    <td class="active" align="center">Fallecidos</td>
				  </tr>
				</tbody>
			</table>
	</div>
	
<script>	
	function numContagiado(){
		$.getJSON("ServletEstado",{opcion:"numContagiados"}, function(data) { 
			$("#idConta").text(data.numcontagiado);		
		});
	}
	function numRecuperado(){
		$.getJSON("ServletEstado",{opcion:"numRecuperados"}, function(data) { 
			$("#idRecupe").text(data.numrecuperado);		
		});
	}
	function numFallecido(){
		$.getJSON("ServletEstado",{opcion:"numFallecidos"}, function(data) { 
			$("#idFalle").text(data.numfallecido);		
		});
	}
	function numUCI(){
		$.getJSON("ServletEstado",{opcion:"numUCIs"}, function(data) { 
			$("#idUCI").text(data.numuci);		
		});
	}
</script>

	<script type="text/javascript">
		function mostrarNumXDepas(){
			$.getJSON("ServletEstado",{opcion:"listarDepartamentos"},
			  function(data){
				$.each(data,function(index,item){
				  $("#id_departamento").append("<option value='"+item.dep+"'>"+
								item.dep+"</option>");	
					})
			})
		}
	</script>
<script>	
	$(document).ready(function() {	
		$("#buscar1").click(function(){
  			var dep=$("#id_departamento").val();
  			$.getJSON("ServletEstado",{opcion:"numContagiadosXDep",cod:dep}, function(data) { 
  				$("#idConta").text(data.numcontagiado);	
  			});
  			$.getJSON("ServletEstado",{opcion:"numRecuperadosXDep",cod:dep}, function(data) { 
  				$("#idRecupe").text(data.numrecuperado);	
  			});
  			$.getJSON("ServletEstado",{opcion:"numFallecidosXDep",cod:dep}, function(data) { 
  				$("#idFalle").text(data.numfallecido);	
  			});
  			$.getJSON("ServletEstado",{opcion:"numUCIsXDep",cod:dep}, function(data) { 
  				$("#idUCI").text(data.numuci);	
  			});
  		});
		
		mostrarNumXDepas();
		numContagiado();
		numRecuperado();
		numFallecido();
		numUCI();
	});
</script>
</body>
</html>




