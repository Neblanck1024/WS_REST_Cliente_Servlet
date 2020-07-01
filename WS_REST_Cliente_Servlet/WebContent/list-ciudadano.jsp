<jsp:include page="menu.jsp"/>
<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
 
<link href="css/bootstrapValidator.min.css" rel="stylesheet">
<link href="css/bootstrap-datepicker.css" rel="stylesheet">
<link href="css/dataTables.bootstrap.min.css" rel="stylesheet">


<script type="text/javascript" src="js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="sweetalert/sweetalert.min.js"></script>

 
 
<title>Ciudadano</title>
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
		<h3 align="center">Lista Ciudadanos Recepcionados</h3>
			<div id="divEmpleado">
		 								<table id="id_table_ciudadano" class="table table-striped table-bordered" >
												<thead>
														<tr>
															<th>Nombre Completo</th>
															<th>Tipo Documento</th>
															<th>Nro Documento</th>
															<th>Nacionalidad</th>
															<th>Fecha Nacimiento</th>
															<th>Distrito</th>
															<th>Dirección</th>
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
													<input class="form-control" id="idNroDocumento" name="nrodocumento" readonly="readonly" placeholder="Ingrese el Nro. Documento"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_estado">Estado</label>
		                                        <div class="col-lg-5">
													<select class="form-control" id="idEstado" name="estado">
							                                 <option value="" >[SELECCIONE]</option>
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
													<select class="form-control" id="idCondicion" name="condicion">
							                                 <option value="" >[SELECCIONE]</option>
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
		                                    <div class="form-group" id="idProForm">
		                                        <label class="col-lg-3 control-label" for="id_reg_provincia">Provincia</label>
		                                        <div class="col-lg-5">
													<select class="form-control" id="idProvincia" name="provincia">
														<option value="">[SELECCIONE]</option>
													</select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group" id="idDisForm">
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


<!-- INICIO DIV NUEVO -->
 <div class="modal fade" id="idModalRegistraS" >
			<div class="modal-dialog" style="width: 50%">
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 5px 20px">
					<h4 id="idMensajeS">Registro de Síntomas</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
					<form id="id_registraS" accept-charset="UTF-8" action="" 
											class="form-horizontal" method="post" 
											data-toggle="validator" role="form">
							<input type="hidden" id="idCodigoS" name="codigo">												
		                    
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading" style="text-align: center;font-size: 14px">
		                               
		                            </div>
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_dni">DNI</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idDni" name="dni" placeholder="Ingrese DNI"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_gusto">Disminución del gusto o del olfato</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idGusto1" name="gusto" value="Si" disabled="disabled" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idGusto2" name="gusto" value="No" disabled="disabled" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_Tos">Tos</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idTos1" name="tos" value="Si" disabled="disabled"/> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idTos2" name="tos" value="No" disabled="disabled"/> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_garganta">Dolor de garganta</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idGarganta1" name="garganta" value="Si" disabled="disabled"/> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idGarganta2" name="garganta" value="No" disabled="disabled"/> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_respirar">Dificultad para respirar</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idRespirar1" name="respirar" value="Si" disabled="disabled"/> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idRespirar2" name="respirar" value="No" disabled="disabled"/> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                   <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_congestion">Congestion nasal</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idCongestion1" name="congestion" value="Si" disabled="disabled"/> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idCongestion2" name="congestion" value="No" disabled="disabled"/> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_fiebre">Fiebre</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idFiebre1" name="fiebre" value="Si" disabled="disabled"/> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idFiebre2" name="fiebre" value="No" disabled="disabled"/> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_fiebre1">Fiebre menor de 38°C</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idFiebre11" name="fiebre1" value="Si" disabled="disabled"/> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idFiebre12" name="fiebre1" value="No" disabled="disabled"/> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_fiebre2">Fiebre mayor igual a 38°C</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idFiebre21" name="fiebre2" value="Si" disabled="disabled"/> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idFiebre22" name="fiebre2" value="No" disabled="disabled"/> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_otro">Otro</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idOtro1" name="otro" value="Si" disabled="disabled"/> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idOtro2" name="otro" value="No" disabled="disabled"/> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_observacion">Observación</label>
		                                        <div class="col-lg-5">
													<textarea class="form-control" rows="10" id="idObservacion" name="observacion" placeholder="Ingrese Observacion" readonly style="resize: none;"></textarea>
		                                        </div>
		                                    </div>
		                                    <h4>¿En qué fecha iniciaron los síntomas? <br/> Sino recuerdas la fecha exacta, coloca una fecha aproximada</h4>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_fechasintoma">Fecha de Sintomatología</label>
		                                        <div class="col-lg-5">
													<input type="date" class="form-control" id="idFechaSin" name="fechasintoma" disabled="disabled" placeholder="Ingrese Fecha de Sintomatología"/>
		                                        </div>
		                                    </div>
		                                    <h4>Situaciones de riesgo</h4>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_alerta">¿Haz recibido un SMS o alerta sobre posible contacto con un caso confirmado de COVID-19, en los últimos 14 días</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idAlerta1" name="alerta" value="Si" disabled="disabled"/> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idAlerta2" name="alerta" value="No" disabled="disabled"/> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_contacto">¿En los últimos 14 días, has tenido contacto con un caso confirmado de coronavirus COVID-19?</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idContacto1" name="contacto" value="Si" disabled="disabled"/> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idContacto2" name="contacto" value="No" disabled="disabled"/> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_salir">¿En los últimos 14 días, te has desplazado a un distrito diferente al de tu residencia?</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idSalir1" name="salir" value="Si" disabled="disabled"/> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idSalir2" name="salir" value="No" disabled="disabled"/> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_trabajo">¿Trabajas en algún establecimiento de salud?</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idTrabajo1" name="trabajo" value="Si" disabled="disabled"/> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idTrabajo2" name="trabajo" value="No" disabled="disabled"/> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <h4>Tienes algunas de las siguiente enfermedades o condiciones <br/> Marca las que apliquen</h4>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_obesidad">Obesidad</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idObesidad1" name="obesidad" value="Si" disabled="disabled"/> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idObesidad2" name="obesidad" value="No" disabled="disabled"/> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_pulmonar">Enfermedad pulmonar crónica</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idPulmonar1" name="pulmonar" value="Si" disabled="disabled"/> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idPulmonar2" name="pulmonar" value="No" disabled="disabled"/> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_asma">Asma</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idAsma1" name="asma" value="Si" disabled="disabled"/> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idAsma2" name="asma" value="No" disabled="disabled"/> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_diabetes">Diabetes</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idDiabetes1" name="diabetes" value="Si" disabled="disabled"/> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idDiabetes2" name="diabetes" value="No" disabled="disabled"/> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_hipertension">Hipertensión arterial</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idHipertension1" name="hipertension" value="Si" disabled="disabled"/> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idHipertension2" name="hipertension" value="No" disabled="disabled"/> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_inmune">Enfermedad o tratamiento inmunosupresor</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idInmune1" name="inmune" value="Si" disabled="disabled"/> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idInmune2" name="inmune" value="No" disabled="disabled"/> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_cardio">Enfermedad cardiovascular</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idCardio1" name="cardio" value="Si" disabled="disabled"/> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idCardio2" name="cardio" value="No" disabled="disabled"/> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_renal">Insuficiencia renal crónica</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idRenal1" name="renal" value="Si" disabled="disabled"/> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idRenal2" name="renal" value="No" disabled="disabled"/> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_cancer">Cáncer</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idCancer1" name="cancer" value="Si" disabled="disabled"/> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idCancer2" name="cancer" value="No" disabled="disabled"/> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_estados">Estado</label>
		                                        <div class="col-lg-5">
													<select id="idEstadoS" name="estados" class='form-control'>
							                                 <option value=" " >[SELECCIONE]</option>
							                                 <option value="Pendiente">Pendiente</option>
							                                 <option value="Infectado">Posiblemente Infectado</option>
							                                 <option value="No Infectado">No Infectado</option>
							                         </select>
		                                        </div>
		                                    </div>
		                                    
		                                </div>		                        
										<div class="modal-footer" style="padding: 5px 20px; text-align:center">
											<button type="button" class="btn-ghost blue" id="btnRegS" onclick="postValidarRegistraS()">REGISTRAR SÍNTOMAS</button>
											<button type="button" class="btn-ghost red" id="resetBtnS">Cerrar</button>
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
	function tablaCiudadano(){
		$("#id_table_ciudadano").DataTable().destroy();
		$("#id_table_ciudadano tbody").empty();
        $.getJSON("ServletCiudadano",{opcion:"listarCiudadanos"}, function(data) {
        	$.each(data, function(i, item){
				//alert( index + ": " + item );

				var sintomas='<button type="button" class="btn-ghost dorado secundary round quitar-borde" onclick="buscarSintomas('+item.numDocumento+","+																									
																									')">Síntomas</button>';																										
																									
				var estado='<button type="button" class="btn-ghost blue secundary round quitar-borde" onclick="buscarEstado('+item.numDocumento+","+																									
																									')">Estado</button>';
																									
				$("#id_table_ciudadano").append("<tr><td>"+item.nombre+"</td>"+
												  "<td>"+item.tipoDocumento+"</td>"+
												  "<td>"+item.numDocumento+"</td>"+
												  "<td>"+item.nacionalidad+"</td>"+
												  "<td>"+item.fechanac+"</td>"+
												  "<td>"+item.dis+"</td>"+
												  "<td>"+item.direccion+"</td>"+
												  "<td>"+sintomas+"</td>"+
												  "<td>"+estado+"</td>");
			});
	    	$("#id_table_ciudadano").DataTable().draw();
			$("#id_table_ciudadano").DataTable();	     
	    });		        		    
	}
		    
	
	
		

	function eliminarCiudadano(cod){
		swal({
			  title: "Seguro de eliminar Ciudadano con Código : "+cod,
			  text: "",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willSave) => {
			  if (willSave) {
				  $.ajax({
						url:  'ServletCiudadano',
						type: 'POST',
						data: {opcion:"eliminarCiudadano",codigo:cod},
						success:function(data){
							if(data==1){
								//console.log(data);
								swal("Registro eliminado correctamente...","","success");
								tablaCiudadano();
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
	function postValidarRegistraS() {
		var validator2 = $('#id_registraS').data('bootstrapValidator');
        validator2.validate();
        if (validator2.isValid()) {
        	saveSintomas();
        }
	}
	function saveEstado(){
		
		var json,json2,cod,nrodoc,est,hosp,con,dep,prov,dis;
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
			dep=$("#idDepartamento").val();
			prov=$("#idProvincia").val();
			dis=$("#idDistrito").val();
			json=JSON.stringify({codestado:cod,numdocumento:nrodoc,estado:est,hospitalizado:hosp,condicion:con,
								 ubigeo:dis});
			
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
								tablaCiudadano();
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
	
	var code=null;
	function buscarEstado(nrodoc){
		console.log(nrodoc);
		$.getJSON("ServletEstado",{opcion:"buscarEstado",cod:nrodoc}, function(data) { 
			console.log(data);
			code=data.numdocumento;
			$("#idNroDocumento").attr("readonly", true);
			$("#idEstado").attr("disabled", "disabled");
			$("#idHospitalizado1").attr("disabled", "disabled");
			$("#idHospitalizado2").attr("disabled", "disabled");
			$("#idCondicion").attr("disabled", "disabled");
			//$("#idDistrito").attr("disabled", "disabled");
			if(nrodoc==data.numdocumento){
				console.log("Mal");
				$("#idCodigo").val(data.codestado);		
				$("#idNroDocumento").val(data.numdocumento);
				$("#idEstado").val(data.estado);	
				
				var hos=document.getElementsByName('hospitalizado');
				for(i=0; i<hos.length; i++){
					if(hos[i].value==data.hospitalizado){
						hos[i].checked = true;
					}
				}
				
			//	if($("#idHospitalizado1").val()==hosp){
			//		$("#idHospitalizado1").attr('checked', true);
			//	}
			//	if($("#idHospitalizado2").val()==hosp){
			//		$("#idHospitalizado2").attr('checked', true);
			//	}
				
				$("#idCondicion").val(data.condicion);
				$("#idDepartamento").val(data.departamento);
				$("#idDepartamento").attr("disabled", "disabled");
				
				$('#idProvincia').empty();
				$("#idProvincia").append("<option value='"+data.provincia+"'>"+data.provincia+"</option>");	
				$("#idProvincia").attr("selected",true);
				$("#idProvincia").attr("disabled", "disabled");
				
				$('#idDistrito').empty();
				$("#idDistrito").append("<option value='"+data.ubigeo+"'>"+data.distrito+"</option>");	
				$("#idDistrito").attr("selected",true);
				$("#idDistrito").attr("disabled", "disabled");
				
				$("#idMensaje").text("Estado");
				$("#btnReg").hide();
				$('#idModalRegistra').modal({backdrop: 'static',keyboard:false,show:true});
			}
		});
		
		if(nrodoc!=code){
			console.log(code);
			$('#id_registra').trigger("reset");
			$('#id_registra').data('bootstrapValidator').resetForm(true);
			$("#idCodigo").val("0");		
			$("#idNroDocumento").val(nrodoc);
			$("#idEstado").attr("disabled", false);
			$("#idHospitalizado1").attr("disabled", false);
			$("#idHospitalizado2").attr("disabled", false);
			$("#idCondicion").attr("disabled", false);
			$("#idDepartamento").attr("disabled", false);
			$('#idProvincia').empty();
			$("#idProvincia").append("<option value=''>[SELECCIONE]</option>");
			$("#idProvincia").attr("disabled", false);
			
			$('#idDistrito').empty();
			$("#idDistrito").append("<option value=''>[SELECCIONE]</option>");
			$("#idDistrito").attr("disabled", false);
			$("#idMensaje").text("Registrar Estado");
			$("#btnReg").text("REGISTRAR ESTADO");
			$("#btnReg").show();
			$('#idModalRegistra').modal({backdrop: 'static',keyboard:false,show:true});
		}
		
		
	}
	
	
	function saveSintomas(){
		
		var json,json2,cod,dni,gusto,tos,garganta,respirar,congestion,fiebre,fiebre1,fiebre2,otro,observacion,dias,mes,ano,alerta,
			contacto,salir,trabajo,obesidad,pulmonar,asma,diabetes,hipertension,inmune,cardio,renal,cancer,estado;
		cod=$('#idCodigoS').val();
		dni=$('#idDni').val();
		
   		//gusto=$('#idGusto').val();
		var gus=document.getElementsByName('gusto');
		for(i=0; i<gus.length; i++){
			if(gus[i].checked){
				gusto=gus[i].value;			
			}
		}
		
   		//tos=$("#idTos").val();
		var to=document.getElementsByName('tos');
		for(i=0; i<to.length; i++){
			if(to[i].checked){
				tos=to[i].value;			
			}
		}
		//garganta=$("#idGarganta").val();
		var garga=document.getElementsByName('garganta');
		for(i=0; i<garga.length; i++){
			if(garga[i].checked){
				garganta=garga[i].value;			
			}
		}
		
		//respirar=$("#idRespirar").val();
		var respi=document.getElementsByName('respirar');
		for(i=0; i<respi.length; i++){
			if(respi[i].checked){
				respirar=respi[i].value;			
			}
		}
		
		//congestion=$("#idCongestion").val();
		var conges=document.getElementsByName('congestion');
		for(i=0; i<conges.length; i++){
			if(conges[i].checked){
				congestion=conges[i].value;			
			}
		}
		
		//fiebre=$("#idFiebre").val();
		var fieb=document.getElementsByName('fiebre');
		for(i=0; i<fieb.length; i++){
			if(fieb[i].checked){
				fiebre=fieb[i].value;			
			}
		}
		
		//fiebre1=$("#idFiebre1").val();
		var fieb1=document.getElementsByName('fiebre1');
		for(i=0; i<fieb1.length; i++){
			if(fieb1[i].checked){
				fiebre1=fieb1[i].value;			
			}
		}
		
		//fiebre2=$("#idFiebre2").val();
		var fieb2=document.getElementsByName('fiebre2');
		for(i=0; i<fieb2.length; i++){
			if(fieb2[i].checked){
				fiebre2=fieb2[i].value;			
			}
		}
		
		//otro=$("#idOtro").val();
		var otr=document.getElementsByName('otro');
		for(i=0; i<otr.length; i++){
			if(otr[i].checked){
				otro=otr[i].value;			
			}
		}
		
		observacion=$("#idObservacion").val();
		fecreg=$("#idFechaSin").val();
		
		//alerta=$("#idAlerta").val();
		var alert=document.getElementsByName('alerta');
		for(i=0; i<alert.length; i++){
			if(alert[i].checked){
				alerta=alert[i].value;			
			}
		}
		
		//contacto=$("#idContacto").val();
		var contact=document.getElementsByName('contacto');
		for(i=0; i<contact.length; i++){
			if(contact[i].checked){
				contacto=contact[i].value;			
			}
		}
		
		//salir=$("#idSalir").val();
		var sal=document.getElementsByName('salir');
		for(i=0; i<sal.length; i++){
			if(sal[i].checked){
				salir=sal[i].value;			
			}
		}
		
		//trabajo=$("#idTrabajo").val();
		var trabaj=document.getElementsByName('trabajo');
		for(i=0; i<trabaj.length; i++){
			if(trabaj[i].checked){
				trabajo=trabaj[i].value;			
			}
		}
		
		//obesidad=$("#idObesidad").val();
		var obesi=document.getElementsByName('obesidad');
		for(i=0; i<obesi.length; i++){
			if(obesi[i].checked){
				obesidad=obesi[i].value;			
			}
		}
		
		//pulmonar=$("#idPulmonar").val();
		var pulmon=document.getElementsByName('pulmonar');
		for(i=0; i<pulmon.length; i++){
			if(pulmon[i].checked){
				pulmonar=pulmon[i].value;			
			}
		}
		
		//asma=$("#idAsma").val();
		var asm=document.getElementsByName('asma');
		for(i=0; i<asm.length; i++){
			if(asm[i].checked){
				asma=asm[i].value;			
			}
		}
		
		//diabetes=$("#idDiabetes").val();
		var diabet=document.getElementsByName('diabetes');
		for(i=0; i<diabet.length; i++){
			if(diabet[i].checked){
				diabetes=diabet[i].value;			
			}
		}
		
		hipertension=$("#idHipertension").val();
		var hiperten=document.getElementsByName('hipertension');
		for(i=0; i<hiperten.length; i++){
			if(hiperten[i].checked){
				hipertension=hiperten[i].value;			
			}
		}
		
		//inmune=$("#idInmune").val();
		var inmu=document.getElementsByName('inmune');
		for(i=0; i<inmu.length; i++){
			if(inmu[i].checked){
				inmune=inmu[i].value;			
			}
		}
		
		//cardio=$("#idCardio").val();
		var cardi=document.getElementsByName('cardio');
		for(i=0; i<cardi.length; i++){
			if(cardi[i].checked){
				cardio=cardi[i].value;			
			}
		}
		
		//renal=$("#idRenal").val();
		var rena=document.getElementsByName('renal');
		for(i=0; i<rena.length; i++){
			if(rena[i].checked){
				renal=rena[i].value;			
			}
		}
		
		//cancer=$("#idCancer").val();
		var canc=document.getElementsByName('cancer');
		for(i=0; i<canc.length; i++){
			if(canc[i].checked){
				cancer=canc[i].value;			
			}
		}
		
		estado=$("#idEstadoS").val();
		json=JSON.stringify({codigo:cod,dni:dni,gusto:gusto,tos:tos,garganta:garganta,respirar:respirar,congestion:congestion,
							 fiebre:fiebre,fiebre1:fiebre1,fiebre2:fiebre2,otro:otro,observacion:observacion,fechareg:fecreg,alerta:alerta,contacto:contacto,salir:salir,trabajo:trabajo,obesidad:obesidad,
							 pulmonar:pulmonar,asma:asma,diabetes:diabetes,hipertension:hipertension,inmune:inmune,
							 cardio:cardio,renal:renal,cancer:cancer,estado:estado});
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
		   				url:  'ServletCiudadano',
		   				type: 'POST',
		   				data: {opcion:"saveSintomas",datos:json},
		   				success:function(data){
		   					//console.log(data);
		   					if(data==1){
								swal("Registro Guardado correctamente...","","success");
								tablaCiudadano();
								$("#idModalRegistraS").modal("hide");
								$('#id_registraS').data('bootstrapValidator').resetForm(true);
			   			    	$('#id_registraS').trigger("reset");
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
	
	function buscarSintomas(dni){
		console.log(dni);
		$.getJSON("ServletCiudadano",{opcion:"listarSintomas",cod:dni}, function(data) {    
	   		$('#idCodigoS').val(data.codigo);
	   		console.log(data.codigo);
	   		$("#idDni").attr("readonly", true);
	   		$('#idDni').val(data.dni);
	   		
	   		var gus=document.getElementsByName('gusto');
			for(i=0; i<gus.length; i++){
				if(gus[i].value==data.gusto){
					gus[i].checked = true;
				}
			}
			
			var to=document.getElementsByName('tos');
			for(i=0; i<to.length; i++){
				if(to[i].value==data.tos){
					to[i].checked = true;
				}
			}
			
			var garga=document.getElementsByName('garganta');
			for(i=0; i<garga.length; i++){
				if(garga[i].value==data.garganta){
					garga[i].checked = true;
				}
			}
			
			var respi=document.getElementsByName('respirar');
			for(i=0; i<respi.length; i++){
				if(respi[i].value==data.respirar){
					respi[i].checked = true;
				}
			}
			
			var conges=document.getElementsByName('congestion');
			for(i=0; i<conges.length; i++){
				if(conges[i].value==data.congestion){
					conges[i].checked = true;
				}
			}
			
			var fieb=document.getElementsByName('fiebre');
			for(i=0; i<fieb.length; i++){
				if(fieb[i].value==data.fiebre){
					fieb[i].checked = true;
				}
			}
			
			var fieb1=document.getElementsByName('fiebre1');
			for(i=0; i<fieb1.length; i++){
				if(fieb1[i].value==data.fiebre1){
					fieb1[i].checked = true;
				}
			}
			
			var fieb2=document.getElementsByName('fiebre2');
			for(i=0; i<fieb2.length; i++){
				if(fieb2[i].value==data.fiebre2){
					fieb2[i].checked = true;
				}
			}
			
			var otr=document.getElementsByName('otro');
			for(i=0; i<otr.length; i++){
				if(otr[i].value==data.otro){
					otr[i].checked = true;
				}
			}
			
			var aler=document.getElementsByName('alerta');
			for(i=0; i<aler.length; i++){
				if(aler[i].value==data.alerta){
					aler[i].checked = true;
				}
			}
			
			var contact=document.getElementsByName('contacto');
			for(i=0; i<contact.length; i++){
				if(contact[i].value==data.contacto){
					contact[i].checked = true;
				}
			}
			
			var sal=document.getElementsByName('salir');
			for(i=0; i<sal.length; i++){
				if(sal[i].value==data.salir){
					sal[i].checked = true;
				}
			}
			
			var trab=document.getElementsByName('trabajo');
			for(i=0; i<trab.length; i++){
				if(trab[i].value==data.trabajo){
					trab[i].checked = true;
				}
			}
			
			var obesi=document.getElementsByName('obesidad');
			for(i=0; i<obesi.length; i++){
				if(obesi[i].value==data.obesidad){
					obesi[i].checked = true;
				}
			}
			
			var pulmo=document.getElementsByName('pulmonar');
			for(i=0; i<pulmo.length; i++){
				if(pulmo[i].value==data.pulmonar){
					pulmo[i].checked = true;
				}
			}
			
			var asm=document.getElementsByName('asma');
			for(i=0; i<asm.length; i++){
				if(asm[i].value==data.asma){
					asm[i].checked = true;
				}
			}
			
			var diabe=document.getElementsByName('diabetes');
			for(i=0; i<diabe.length; i++){
				if(diabe[i].value==data.diabetes){
					diabe[i].checked = true;
				}
			}
			
			var hiperten=document.getElementsByName('hipertension');
			for(i=0; i<hiperten.length; i++){
				if(hiperten[i].value==data.hipertension){
					hiperten[i].checked = true;
				}
			}
			
			var inmu=document.getElementsByName('inmune');
			for(i=0; i<inmu.length; i++){
				if(inmu[i].value==data.inmune){
					inmu[i].checked = true;
				}
			}
			
			var cardi=document.getElementsByName('cardio');
			for(i=0; i<cardi.length; i++){
				if(cardi[i].value==data.cardio){
					cardi[i].checked = true;
				}
			}
			
			var rena=document.getElementsByName('renal');
			for(i=0; i<rena.length; i++){
				if(rena[i].value==data.renal){
					rena[i].checked = true;
				}
			}
			
			var canc=document.getElementsByName('cancer');
			for(i=0; i<canc.length; i++){
				if(canc[i].value==data.cancer){
					canc[i].checked = true;
				}
			}    		
			
			
			$("#idObservacion").val(data.observacion);
			$("#idFechaSin").val(data.fechareg);
			$("#idEstadoS").val(data.estado);
	   		$("#idMensajeS").text("Síntomas");
			$("#btnRegS").text("ACTUALIZAR SÍNTOMAS");
			$('#idModalRegistraS').modal({backdrop: 'static',keyboard:false,show:true});
		});
	}

	function editarCiudadano(nrodoc,nac,tipdoc,numcel,nom,dia,mes,ano,dir,dep,prov,dis){
		$("#idNumDocumento").val(nrodoc);		
		$("#idNacionalidad").val(nac);
		$("#idTipoDocumento").val(tipdoc);
		$("#idNumCelular").val(numcel);
		$("#idNombre").val(nom);
		$("#idDia").val(dia);
		$("#idMes").val(mes);
		$("#idAno").val(ano);
		$("#idDireccion").val(dir);
		$("#idDepartamento").val(dep);
		$("#idProvincia").val(prov);
		$("#idDistrito").val(dis);
		$("#idMensaje").text("Actualizar Ciudadano");
		$("#btnReg").text("ACTUALIZAR CIUDADANO");
		$('#idModalRegistra').modal({backdrop: 'static',keyboard:false,show:true});
	}
	
	
	function mostrarVentana(){
		$('#id_registra').trigger("reset");
		$('#id_registra').data('bootstrapValidator').resetForm(true);
		$("#idCodigo").val("0");		
		$("#idMensaje").text("Registrar Ciudadano");
		$("#btnReg").text("REGISTRAR CIUDADANO");
		$('#idModalRegistra').modal({backdrop: 'static',keyboard:false,show:true});
	}
	
	function mostrarDepartamentos(){
		$.getJSON("ServletUbigeo",{opcion:"listarDepartamentos"},
		  function(data){
			$.each(data,function(index,item){
			  $("#idDepartamento").append("<option value='"+item.dep+"'>"+
							item.dep+"</option>");	
			  
			})
		})
		
		$( "#idDepartamento" ).change(function() {
			$('#idDistrito').empty();
			mostrarProvincias();
		});
	//	$('#idDistrito').val("[Seleccione]");
	//	$('#idProvincia').empty();
	}
	function mostrarProvincias(){
		var dep = $('#idDepartamento').val();
//		dep=dep.replace(" ","-");
//		alert(dep);
		$('#idProvincia').empty();
		$("#idProvincia").append("<option value=''>[SELECCIONE]</option>");
		$("#idDistrito").append("<option value=''>[SELECCIONE]</option>");
		if(dep!=""){
			$.getJSON("ServletUbigeo",{opcion:"listarProvincias",cod:dep},
			  function(data){
				$.each(data,function(index,item){
				  $("#idProvincia").append("<option value='"+item.prov+"'>"+
								item.prov+"</option>");	
					})
			})
		}
		
		$( "#idProvincia" ).change(function() {
			$('#idDistrito').empty();
			console.log("erro0");
			mostrarDistritos();
		});
	}
	function mostrarDistritos(){
		var dep = $('#idDepartamento').val();
//		dep=dep.replace(" ","-");
		var pro = $('#idProvincia').val();
//		pro=pro.replace(" ","-");
		if(pro!=""){
			console.log("erro2");
			$.getJSON("ServletUbigeo",{opcion:"listarDistritos",cod1:dep,cod2:pro},
			  function(data){
			  	$('#idDistrito').empty();
			  	$("#idDistrito").append("<option value=''>[SELECCIONE]</option>");
				$.each(data,function(index,item){
				  $("#idDistrito").append("<option value='"+item.codigo+"'>"+
								item.distrito+"</option>");	
					})

			})
		}
	}
	
	
</script>
<script>	
	$(document).ready(function() {	
		mostrarDepartamentos();
		tablaCiudadano();
		$('#resetBtn').click(function() {
	        $('#id_registra').data('bootstrapValidator').resetForm(true);
	        $('#idModalRegistra').modal("hide");
	    });   
		$('#resetBtnS').click(function() {
	        $('#id_registra').data('bootstrapValidator').resetForm(true);
	        $('#idModalRegistraS').modal("hide");
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
	        },     
	    }
	});
	
	$('#id_registraS').bootstrapValidator({
	    message: 'This value is not valid',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	estados: {
	            validators: {
	                notEmpty: {
	                    message: 'El campo Estado es requerido. No puede estar vacio'
	                }
	            }
	        }     
	        
	
	    }
	});
});
</script>


</body>
</html>












