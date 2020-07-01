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
 
<script src="https://kit.fontawesome.com/81046aa3bf.js" crossorigin="anonymous"></script> 
<title>Usuario</title>
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
		<h3 align="center">Lista Administradores</h3>
					<button type="button" data-toggle='modal'  
					class='btn-ghost dorado' 
					id="validateBtnw2" 
					onclick="mostrarVentana()"><i class="fas fa-user-plus"></i> Nuevo Administrador</button><br>&nbsp;<br>		
			<div id="divEmpleado">
		 								<table id="id_table_usuario" class="table table-striped table-bordered" >
												<thead>
														<tr>
															<th>Nombre</th>
															<th>Paterno</th>
															<th>Materno</th>
															<th>Tipo Documento</th>
															<th>Número Documento</th>
															<th>Nacionalidad</th>
															<th>Celular</th>
															<th>Correo Electrónico</th>
															<th></th>
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
					<h4 id="idMensaje">Registro de Usuario</h4>
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
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombres</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idNombre" name="nombre" placeholder="Ingrese el Nombre"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apellidopaterno">Apellido Paterno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idPaterno" name="paterno" placeholder="Ingrese el Apellido Paterno"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apellidomaterno">Apellido Materno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idMaterno" name="materno" placeholder="Ingrese el Apellido Materno"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_numerocelular">Celular</label>
		                                        <div class="col-lg-5">
													<input type="number" class="form-control" id="idNumeroCelular" name="numcelular" placeholder="Ingrese el Número Celular"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nacionalidad">Nacionalidad</label>
		                                        <div class="col-lg-5">
													<select id="idNacionalidad" name="nacionalidad" class='form-control'>
														<option value="">[Seleccione]</option>	
							                    	</select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_tipodocumento">Tipo Documento</label>
		                                        <div class="col-lg-5">
													<select id="idTipoDocumento" name="tipodocumento" class='form-control'>
															 <option value="">[Seleccione]</option>
							                                 <option value="DNI">DNI</option>
							                                 <option value="LE">LIBRETA ELECTORAL</option>
							                                 <option value="CE">CARNET DE EXTRANJERÍA</option>
							                                 <option value="RUC">REGISTRO UNICO DE CONTRIBUYENTES</option>
							                                 <option value="PASAPORTE">PASAPORTE</option>
							                                 <option value="PN">PARTIDA DE NACIMIENTO-IDENTIDAD</option>
							                                 <option value="OTROS">OTROS</option>
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_numerodocumento">Número Documento</label>
		                                        <div class="col-lg-5">
													<input type="number" class="form-control" id="idNumeroDocumento" name="numerodocumento" placeholder="Ingrese Número documento"/>
		                                        </div>
		                                    </div>                               
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_correo">Correo</label>
		                                        <div class="col-lg-5">
													<input type="email" class="form-control" id="idCorreo" name="correo" oninvalid="setCustomValidity('Plz enter on Alphabets ')" placeholder="Ingrese Correo"/>
		                                        </div>
		                                    </div>                               
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_username">Username</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idUsername" name="username" placeholder="Ingrese Username"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_contrasena">Contraseña</label>
		                                        <div class="col-lg-5">
													<input type="password" class="form-control" id="idContrasena" name="contrasena" placeholder="Ingrese Contraseña"/>
		                                        </div>
		                                    </div>
		                                    	                                    
		                                </div>		                        
										<div class="modal-footer" style="padding: 5px 20px; text-align:center">
											<button type="button" class="btn-ghost dorado" id="btnReg" onclick="postValidarRegistra()">REGISTRAR USUARIO</button>
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
	function tablaUsuario(){
		$("#id_table_usuario").DataTable().destroy();
		$("#id_table_usuario tbody").empty(); 
		$.getJSON("ServletUsuario",{opcion:"listarUsuarios"}, function (data){
			$.each(data, function(index, item){
				var editar='<button type="button" class="btn-ghost blue secundary round" onclick="editarUsuario('+item.idusuario+","+
																								"'"+item.nomusuario+"',"+
																								"'"+item.patusuario+"',"+
																								"'"+item.matusuario+"',"+
																								"'"+item.numcelular+"',"+
																									item.nacionalidad+","+
																								"'"+item.tipodocumento+"',"+
																								"'"+item.numdocumento+"',"+
																								"'"+item.correo+"',"+
																								"'"+item.login+"',"+
																								"'"+item.pass+"',"+
																								')">Editar</button>';
			    var eliminar='<button type="button" class="btn-ghost red secundary round" onclick="eliminarUsuario('+
																										item.idusuario+')">Eliminar</button>';																					    
				$("#id_table_usuario").append("<tr><td>"+item.nomusuario+"</td>"+
												  "<td>"+item.patusuario+"</td>"+
												  "<td>"+item.matusuario+"</td>"+
												  "<td>"+item.tipodocumento+"</td>"+
												  "<td>"+item.numdocumento+"</td>"+
												  "<td>"+item.desnacionalidad+"</td>"+
												  "<td>"+item.numcelular+"</td>"+
												  "<td>"+item.correo+"</td>"+
												  "<td>"+editar+"</td>"+
												  "<td>"+eliminar+"</td>");
			});
			$("#id_table_usuario").DataTable().draw();
			$("#id_table_usuario").DataTable();
		});
	}
	function eliminarUsuario(cod){
		swal({
			  title: "Seguro de eliminar Usuario con Código : "+cod,
			  text: "",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willSave) => {
			  if (willSave) {
				  $.ajax({
						url:  'ServletUsuario',
						type: 'POST',
						data: {opcion:"eliminarUsuario",codigo:cod},
						success:function(data){
							if(data==1){
								//console.log(data);
								swal("Registro eliminado correctamente...","","success");
								tablaUsuario();
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
        	saveUsuario();
        }
	}
	function saveUsuario(){
		
		var json,json2,codigo,nom,pat,mat,numcel,nac,tipdoc,numdoc,correo,user,pass;
			codigo=$("#idCodigo").val();		
			nom=$("#idNombre").val();		
			pat=$("#idPaterno").val();		
			mat=$("#idMaterno").val();		
			numcel=$("#idNumeroCelular").val();		
			nac=$("#idNacionalidad").val();
			tipdoc=$("#idTipoDocumento").val();
			numdoc=$("#idNumeroDocumento").val();
			correo=$("#idCorreo").val();
			user=$("#idUsername").val();
			pass=$("#idContrasena").val();
			json=JSON.stringify({idusuario:codigo,nomusuario:nom,patusuario:pat,matusuario:mat,numcelular:numcel,
								 nacionalidad:nac,tipodocumento:tipdoc,numdocumento:numdoc,correo:correo,login:user,
								 pass:pass});
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
		   				url:  'ServletUsuario',
		   				type: 'POST',
		   				data: {opcion:"saveUsuario",datos:json},
		   				success:function(data){
		   					//console.log(data);
		   					if(data==1){
								swal("Registro Guardado correctamente...","","success");
								tablaUsuario();
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
	function editarUsuario(codigo,nom,pat,mat,numcel,nac,tipdoc,numdoc,correo,user,pass){
		$("#idCodigo").val(codigo);
		$("#idNombre").val(nom);	
		$("#idPaterno").val(pat);	
		$("#idMaterno").val(mat);
		$("#idNumeroCelular").val(numcel);		
		$("#idNacionalidad").val(nac);
		$("#idTipoDocumento").val(tipdoc);
		$("#idNumeroDocumento").val(numdoc);
		$("#idCorreo").val(correo);
		$("#idUsername").val(user);
		$("#idContrasena").val(pass);
		$("#btnReg").text("ACTUALIZAR USUARIO");
		$("#idMensaje").text("Actualizar Usuario");
		$('#idModalRegistra').modal({backdrop: 'static',keyboard:false,show:true});
	}
	function mostrarVentana(){
		$('#id_registra').trigger("reset");
		$('#id_registra').data('bootstrapValidator').resetForm(true);
		$("#idCodigo").val("0");	
		$("#btnReg").text("NUEVO USUARIO");
		$("#idMensaje").text("Registrar Usuario");
		$('#idModalRegistra').modal({backdrop: 'static',keyboard:false,show:true});
	}
	function mostrarNacionalidad(){
		$.getJSON("ServletUsuario",{opcion:"listarNacionalidad"},
		  function(data){
			$.each(data,function(index,item){
			  $("#idNacionalidad").append("<option value='"+item.idnac+"'>"+
							item.gentilicio+"</option>");	
				})
		})
	}
</script>
<script>	
	$(document).ready(function() {
		mostrarNacionalidad();
		tablaUsuario();
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
	    	nombre: {
	            validators: {
	                notEmpty: {
	                    message: 'El campo Nombre es requerido. No puede estar vacío'
	                },
	                stringLength: {
	                    min: 1,
	                    max: 100,
	                    message: 'El campo nombre debe contener minimo 3 y maximo de 100 letras'
	                },
	                regexp: {
	                    regexp: /^[a-zA-Z\s\á\é\í\ó\ú\Á\É\Í\Ó\Ú\ñ\Ñ]+$/,
	                    message: 'El nombre sólo puede contener letras'
	                }
	            }
	        },
	    	paterno: {
	            validators: {
	                notEmpty: {
	                    message: 'El campo Apellido paterno es requerido. No puede estar vacío'
	                },
	                stringLength: {
	                    min: 1,
	                    max: 100,
	                    message: 'El campo Apellido paterno debe contener minimo 3 y maximo de 100 letras'
	                },
	                regexp: {
	                    regexp: /^[a-zA-Z\s\á\é\í\ó\ú\Á\É\Í\Ó\Ú\ñ\Ñ]+$/,
	                    message: 'El Apellido paterno sólo puede contener letras'
	                }
	            }
	        },
	    	materno: {
	            validators: {
	                notEmpty: {
	                    message: 'El campo Apellido Materno es requerido. No puede estar vacío'
	                },
	                stringLength: {
	                    min: 1,
	                    max: 100,
	                    message: 'El Apellido Materno debe contener minimo 3 y maximo de 100 letras'
	                },
	                regexp: {
	                    regexp: /^[a-zA-Z\s\á\é\í\ó\ú\Á\É\Í\Ó\Ú\ñ\Ñ]+$/,
	                    message: 'El Apellido Materno sólo puede contener letras'
	                }
	            }
	        },
	        numcelular: {
	            validators: {
	                notEmpty: {
	                    message: 'El campo Celular es requerido. No puede estar vacío'
	                },
	                stringLength: {
	                    min: 9,
	                    max: 15,
	                    message: 'El campo Celular debe contener minimo 3 y maximo de 15 letras'
	                }
	            }
	        },
	        nacionalidad: {
	            validators: {
	                notEmpty: {
	                    message: 'El campo Nacionalidad es requerido. No puede estar vacío'
	                }
	            }
	        },
	        tipodocumento: {
	            validators: {
	                notEmpty: {
	                    message: 'El campo Tipo documento es requerido. No puede estar vacío'
	                }
	            }
	        },
	        numerodocumento: {
	            validators: {
	                notEmpty: {
	                    message: 'El campo Número documento es requerido. No puede estar vacío'
	                },
	                stringLength: {
	                    min: 8,
	                    max: 8,
	                    message: 'El Número documento debe contener minimo 3 y maximo de 30 letras'
	                },
	            }
	        },
	    	correo: {
	            validators: {
	                notEmpty: {
	                    message: 'El campo Correo es requerido. No puede estar vacío'
	                }
	            }
	        },
	        username:{
	        	validators:{
	        		notEmpty: {
	                    message: 'El campo Username es requerido. No puede estar vacío'
	                },
	                stringLength: {
	                    min: 3,
	                    max: 30,
	                    message: 'El campo Username debe contener minimo 3 y maximo de 30 letras'
	                },
	                regexp: {
	                    regexp: /^[a-zA-Z\s\á\é\í\ó\ú\Á\É\Í\Ó\Ú\ñ\Ñ]+$/,
	                    message: 'El campo Username sólo puede contener letras'
	                }
	        	}
	        },
	        contrasena: {
	        	validators:{
	        		notEmpty: {
	                    message: 'El campo Contraseña es requerido. No puede estar vacío'
	                },
	                stringLength: {
	                    min: 5,
	                    max: 30,
	                    message: 'La campo Contraseña debe contener minimo 5 y maximo de 30 caracteres'
	                }
	        	}
	        }
	    }
	});
});
</script>


</body>
</html>












