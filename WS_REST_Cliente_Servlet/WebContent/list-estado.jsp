<jsp:include page="menu.jsp"/>
<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
 
<link href="css/bootstrapValidator.min.css" rel="stylesheet">
<link href="css/bootstrap-datepicker.css" rel="stylesheet">
<link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrapValidator.min.css" rel="stylesheet">


<script type="text/javascript" src="js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="sweetalert/sweetalert.min.js"></script>
 
 
<title>Estado</title>
<style>
	.modal-header, h4, .close {
		background-color: #246355;
		color: white !important;
		text-align: center;
		font-size: 20px;
	}
</style> 
</head>
<body>

	<%
		HttpSession sesion = request.getSession();
		if(sesion.getAttribute("objeto")==null){
			response.sendRedirect("error.jsp");
			//sesion.invalidate();
		}
	%>	
		
	<div class="container">
		<h3 align="center">Lista Ciudadanos Contagiados</h3>	
			<div id="divEmpleado">
		 								<table id="id_table_estado" class="table table-striped table-bordered" >
												<thead>
														<tr>
															<th>Nro. Documento</th>
															<th>Estado</th>
															<th>Hospitalizado</th>
															<th>Condición</th>
															<th>Departamento</th>
															<th>Provincia</th>
															<th>Distrito</th>
															<th></th>
														</tr>
												</thead>
												<tbody>


												</tbody>
											</table>	

			</div>	
	</div>
	
<!-- INICIO DIV NUEVO -->
 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 50%">
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 5px 20px">
					<h4 id="idMensaje">Registro de Estado</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
					<form id="id_registra" accept-charset="UTF-8" action="" 
											class="form-horizontal" method="post" 
											data-toggle="validator" role="form">
							<input type="hidden" id="idCodigo" name="codigo">												
		                    
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading" style="text-align: center;font-size: 14px">
		                               
		                            </div>
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nrodocumento">Nro. Documento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idNroDocumento" name="nrodocumento" placeholder="Ingrese el Nro. Documento"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_estado">Estado</label>
		                                        <div class="col-lg-5">
													<select id="idEstado" name="estado" class='form-control'>
							                                 <option value=" " >[SELECCIONE]</option>
							                                 <option value="Positivo">Positivo</option>
							                                 <option value="Negativo">Negativo</option>
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_estado">Hospitalizado</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idHospitalizado1" name="hospitalizado" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idHospitalizado2" name="hospitalizado" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_condicion">Condición</label>
		                                        <div class="col-lg-5">
													<select id="idCondicion" name="condicion" class='form-control'>
							                                 <option value=" " >[SELECCIONE]</option>
							                                 <option value="Pendiente">Pendiente</option>
							                                 <option value="Recuperado">Recuperado</option>
							                                 <option value="Fallecido">Fallecido</option>
							                                 <option value="UCI">UCI</option>
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_departamento">Departamento</label>
		                                        <div class="col-lg-5">
													<select class="form-control" id="idDepartamento" name="departamento">
														<option value="">[SELECCIONE]</option>
													</select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_provincia">Provincia</label>
		                                        <div class="col-lg-5">
													<select class="form-control" id="idProvincia" name="provincia">
														<option value="">[SELECCIONE]</option>
													</select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_distrito">Distrito</label>
		                                        <div class="col-lg-5">
													<select class="form-control" id="idDistrito" name="distrito">
														<option value="">[SELECCIONE]</option>
													</select>
		                                        </div>
		                                    </div>                               		                                    
		                                    
		                                </div>		                        
										<div class="modal-footer" style="padding: 5px 20px; text-align:center">
											<button type="button" class="btn-ghost dorado" id="btnReg" onclick="postValidarRegistra()">REGISTRAR ESTADO</button>
											<button type="button" class="btn-ghost blue" id="resetBtn">Cerrar</button>
										</div>
		                  		</div>
		                  </div>
		            </form>      
				</div>
			</div>
		</div>
  </div>
<!-- FIN DIV NUEVO -->





<script type="text/javascript">
	function tablaEstado(){
		$("#id_table_estado").DataTable().destroy();
		$("#id_table_estado tbody").empty(); 
		$.getJSON("ServletEstado",{opcion:"listarEstados"}, function (data){
			$.each(data, function(index, item){
				var editar='<button type="button" class="btn-ghost blue secundary round" onclick="editarEstado('+item.codestado+","+
																								"'"+item.numdocumento+"',"+
																								"'"+item.estado+"',"+
																								"'"+item.hospitalizado+"',"+
																								"'"+item.condicion+"',"+
																								"'"+item.departamento+"',"+
																								"'"+item.provincia+"',"+
																								"'"+item.distrito+"',"+
																								    item.ubigeo+","+
																								    ')">Editar</button>';
			    var eliminar='<button type="button" class="btn-ghost red secundary round" onclick="eliminarEstado('+item.codestado+","+
			    																					   "'"+item.numdocumento+"',"+
			    																					   ')">Eliminar</button>';																					    
				$("#id_table_estado").append("<tr><td>"+item.numdocumento+"</td>"+
												  "<td>"+item.estado+"</td>"+
												  "<td>"+item.hospitalizado+"</td>"+
												  "<td>"+item.condicion+"</td>"+
												  "<td>"+item.departamento+"</td>"+
												  "<td>"+item.provincia+"</td>"+
												  "<td>"+item.distrito+"</td>"+
												  "<td>"+editar+"</td>");
			});
			$("#id_table_estado").DataTable().draw();
			$("#id_table_estado").DataTable();
		});
	}
	function eliminarEstado(cod,nrodoc){
		swal({
			  title: "Seguro de eliminar Estado con Código : "+cod + " y Nro de Documento : " +nrodoc,
			  text: "",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willSave) => {
			  if (willSave) {
				  $.ajax({
						url:  'ServletEstado',
						type: 'POST',
						data: {opcion:"eliminarEstado",codigo1:cod,codigo2:nrodoc},
						success:function(data){
							if(data==1){
								//console.log(data);
								swal("Registro eliminado correctamente...","","success");
								tablaEstado();
							}
							else
								swal("Error en la eliminación del registro...","","error");
						},
						error: function (jqXhr) { // error callback 
				    	}
					})
			  } 
			})
	}
	function postValidarRegistra() {
		var validator = $('#id_registra').data('bootstrapValidator');
        validator.validate();
        if (validator.isValid()) {
        	saveEstado();
        }
	}
	function saveEstado(){
		
		var json,json2,cod,nrodoc,est,hosp,con,ubi;
			cod=$("#idCodigo").val();		
			nrodoc=$("#idNroDocumento").val();
			est=$("#idEstado").val();
			
			var hos=document.getElementsByName('hospitalizado');
			for(i=0; i<hos.length; i++){
				if(hos[i].checked){
					hosp=hos[i].value;			
				}
			}
			
			con=$("#idCondicion").val();
			ubi=$("#idDistrito").val();
			json=JSON.stringify({codestado:cod,numdocumento:nrodoc,estado:est,hospitalizado:hosp,condicion:con,
								 ubigeo:ubi});
		swal({
			  title: "Seguro de Guardar datos : ",
			  text: "",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willSave) => {
			  if (willSave) {
		   		 $.ajax({
		   				url:  'ServletEstado',
		   				type: 'POST',
		   				data: {opcion:"saveEstado",datos:json},
		   				success:function(data){
		   					//console.log(data);
		   					if(data==1){
								swal("Registro Guardado correctamente...","","success");
								tablaEstado();
								$("#idModalRegistra").modal("hide");
								$('#id_registra').data('bootstrapValidator').resetForm(true);
			   			    	$('#id_registra').trigger("reset");
							}
							else
								swal("Error al guardar el registro...","","error");
		   				},
		   				error: function (jqXhr) { // error callback 
		   					swal("Error ...","","error");
		   		    	}
		   			})
			  } 
			})	
	}
	function editarEstado(cod,nrodoc,est,hosp,con,dep,prov,dis,ubi){
		console.log(ubi);
		$("#idCodigo").val(cod);		
		$("#idNroDocumento").val(nrodoc);
		$("#idNroDocumento").attr("readonly", true);
		$("#idEstado").val(est);
		
		var hos=document.getElementsByName('hospitalizado');
		for(i=0; i<hos.length; i++){
			if(hos[i].value==hosp){
				hos[i].checked = true;
			}
		}
		
	//	if($("#idHospitalizado1").val()==hosp){
	//		$("#idHospitalizado1").attr('checked', true);
	//	}
	//	if($("#idHospitalizado2").val()==hosp){
	//		$("#idHospitalizado2").attr('checked', true);
	//	}
		
		$("#idCondicion").val(con);
		$('#idDepartamento').empty();
		$("#idDepartamento").append("<option value='"+prov+"'>"+prov+"</option>");	
		$("#idDepartamento").attr("selected",true);
		$("#idDepartamento").attr("disabled", "disabled");
		
		$('#idProvincia').empty();
		$("#idProvincia").append("<option value='"+prov+"'>"+prov+"</option>");	
		$("#idProvincia").attr("selected",true);
		$("#idProvincia").attr("disabled", "disabled");
		
		$('#idDistrito').empty();
		//$("#idDistrito").append("<option value='"+ubi+"'>"+dis+"</option>");
		$('#idDistrito').append($('<option>', {value: ubi,text: dis}));
		$("#idDistrito").attr("selected",true);
		$("#idDistrito").attr("disabled", "disabled");
		//$("#idUbigeo").val(ubi);
		//$("#idUbigeo").attr("readonly", true);
		$("#idMensaje").text("Actualizar Estado");
		$("#btnReg").text("ACTUALIZAR ESTADO");
		$('#idModalRegistra').modal({backdrop: 'static',keyboard:false,show:true});
	}
	function mostrarVentana(){
		$('#id_registra').trigger("reset");
		$('#id_registra').data('bootstrapValidator').resetForm(true);
		$("#idCodigo").val("0");		
		$("#idMensaje").text("Registrar Estado");
		$('#idModalRegistra').modal({backdrop: 'static',keyboard:false,show:true});
	}
</script>
<script>	
	$(document).ready(function() {
		tablaEstado();
		$('#resetBtn').click(function() {
	        $('#id_registra').data('bootstrapValidator').resetForm(true);
	        $('#idModalRegistra').modal("hide");
	    });   
	});
</script>
<script type="text/javascript">
$(document).ready(function() {
	//validar registra nuevo empleado
	$('#id_registra').bootstrapValidator({
	    message: 'This value is not valid',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	nrodocumento: {
	            validators: {
	                notEmpty: {
	                    message: 'El campo Nro. Documento es requerido. No puede estar vacio'
	                },
	                stringLength: {
	                    min: 8,
	                    max: 8,
	                    message: 'El Nro. Documento debe contener 8 dígitos'
	                }
	            }
	        },
	        estado:{
	        	validators:{
	        		notEmpty: {
	                    message: 'El campo Estado es requerido. No puede estar vacio'
	                }
	        	}
	        },     
	        hospitalizado:{
	        	validators:{
	        		notEmpty: {
	                    message: 'El campo Hospitalizado es requerido. No puede estar vacio'
	                }
	        	}
	        },     
	        condicion:{
	        	validators:{
	        		notEmpty: {
	                    message: 'El campo Condicion es requerido. No puede estar vacio'
	                }
	        	}
	        },     
	        ubigeo:{
	        	validators:{
	        		notEmpty: {
	                    message: 'El campo Ubigeo es requerido. No puede estar vacio'
	                }
	        	}
	        }     
	        
	        
	
	    }
	});
});
</script>


</body>
</html>












