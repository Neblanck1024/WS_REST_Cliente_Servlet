<%@page import="com.cibertec.entidad.UsuarioBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/bootstrapValidator.min.css" rel="stylesheet">
<link href="css/bootstrap-datepicker.css" rel="stylesheet">
<link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="css/estilosTabla.css" rel="stylesheet">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="sweetalert/sweetalert.min.js"></script>

<script src="https://kit.fontawesome.com/81046aa3bf.js" crossorigin="anonymous"></script>
<title>Principal</title>
</head>
<body>

	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="index.jsp">CORONAVIRUS</a>      
	    </div>
	    <ul class="nav navbar-nav">
	      <li>
	      	<button type="button" data-toggle='modal' class='btn-ghost dorado' id="validateBtnw2" 
			onclick="mostrarVentana()"><i class="fas fa-clipboard-list"></i> Realizar Triaje</button>
	      </li>
	    </ul>
		<button type="button" class='btn-ghost dorado usuario' id="validateBtnw2" onclick="location.href='login.jsp'"><i class="far fa-user"></i></i> Iniciar Sesión</button>
	  </div>
	</nav>	
	
	<!-- INICIO DIV NUEVO -->
 	<div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 50%">
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 5px 20px">
					<h4 id="idMensaje">Registro de Ciudadano</h4>
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
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombre Completo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idNombre" name="nombre" placeholder="Ingrese Nombre"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nacionalidad">Nacionalidad</label>
		                                        <div class="col-lg-5">
													<select id="idNacionalidad" name="nacionalidad" class='form-control'>
														<option value="">[SELECCIONE]</option>	
							                    	</select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_tipodocumento">Tipo Documento</label>
		                                        <div class="col-lg-5">
													<select class="form-control" id="idTipoDocumento" name="tipodocumento" >
															 <option value="">[SELECCIONE]</option>
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
		                                        <label class="col-lg-3 control-label" for="id_reg_numdocumento">Nro. Documento</label>
		                                        <div class="col-lg-5">
													<input type="number" class="form-control" id="idNumDocumento" name="numdocumento" placeholder="Ingrese el Num. Documento"/>
		                                        </div>
		                                    </div>		                                    		                                   	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_fechanac">Fecha Nacimiento</label>
		                                        <div class="col-lg-5">
													<input type="date" class="form-control" id="idFechaNac" min='1899-01-01' max='2020-07-01' onkeydown="return false" name="fechanac" placeholder="Ingrese Fecha Nacimiento"/>
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
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_direccion">Dirección</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idDireccion" name="direccion" placeholder="Ingrese Dirección"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_numcelular">Num. Celular</label>
		                                        <div class="col-lg-5">
													<input type="number" class="form-control" id="idNumCelular" name="numcelular" placeholder="Ingrese Num Celular"/>
		                                        </div>
		                                    </div>		                                    
		                                    
		                                    
		                                    
		                                </div>		                        
										<div class="modal-footer" style="padding: 5px 20px; text-align:center">
											<button type="button" data-toggle='modal' class="btn-ghost blue" id="btnReg" onclick="postValidarRegistra()">REGISTRAR CIUDADANO</button>
											<button type="button" class="btn-ghost red" id="resetBtn">Cerrar</button>
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
							<input type="hidden" id="idCodigoS" name="cod">												
		                    
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading" style="text-align: center;font-size: 14px">
		                               
		                            </div>
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <div class="col-lg-5">
													<input class="form-control" type="hidden" id="idDni" name="dni" placeholder="Ingrese DNI"/>
		                                        </div>
		                                    </div>
		                                   <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_gusto">Disminución del gusto o del olfato</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idGusto1" name="gusto" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idGusto2" name="gusto" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_Tos">Tos</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idTos1" name="tos" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idTos2" name="tos" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_garganta">Dolor de garganta</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idGarganta1" name="garganta" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idGarganta2" name="garganta" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_respirar">Dificultad para respirar</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idRespirar1" name="respirar" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idRespirar2" name="respirar" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                   <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_congestion">Congestion nasal</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idCongestion1" name="congestion" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idCongestion2" name="congestion" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_fiebre">Fiebre</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idFiebre1" name="fiebre" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idFiebre2" name="fiebre" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_fiebre1">Fiebre menor de 38°C</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idFiebre11" name="fiebre1" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idFiebre12" name="fiebre1" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_fiebre2">Fiebre mayor igual a 38°C</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idFiebre21" name="fiebre2" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idFiebre22" name="fiebre2" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_otro">Otro</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idOtro1" name="otro" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idOtro2" name="otro" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_observacion">Observación</label>
		                                        <div class="col-lg-5">
													<textarea class="form-control" rows="10" id="idObservacion" name="observacion" placeholder="Ingrese Observacion" style="resize: none;"></textarea>
		                                        </div>
		                                    </div>
		                                    <h4>¿En qué fecha iniciaron los síntomas? <br/> Sino recuerdas la fecha exacta, coloca una fecha aproximada</h4>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_fechasintoma">Fecha de Sintomatología</label>
		                                        <div class="col-lg-5">
													<input type="date" class="form-control" id="idFechaSin" name="fechasintoma" min='1899-01-01' max='2020-07-01' onkeydown="return false" placeholder="Ingrese Fecha de Sintomatología"/>
		                                        </div>
		                                    </div>
		                                    <h4>Situaciones de riesgo</h4>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_alerta">¿Haz recibido un SMS o alerta sobre posible contacto con un caso confirmado de COVID-19, en los últimos 14 días</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idAlerta1" name="alerta" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idAlerta2" name="alerta" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_contacto">¿En los últimos 14 días, has tenido contacto con un caso confirmado de coronavirus COVID-19?</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idContacto1" name="contacto" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idContacto2" name="contacto" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_salir">¿En los últimos 14 días, te has desplazado a un distrito diferente al de tu residencia?</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idSalir1" name="salir" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idSalir2" name="salir" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_trabajo">¿Trabajas en algún establecimiento de salud?</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idTrabajo1" name="trabajo" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idTrabajo2" name="trabajo" value="No" /> No
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
						                                    <input type="radio" id="idObesidad1" name="obesidad" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idObesidad2" name="obesidad" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_pulmonar">Enfermedad pulmonar crónica</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idPulmonar1" name="pulmonar" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idPulmonar2" name="pulmonar" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_asma">Asma</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idAsma1" name="asma" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idAsma2" name="asma" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_diabetes">Diabetes</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idDiabetes1" name="diabetes" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idDiabetes2" name="diabetes" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_hipertension">Hipertensión arterial</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idHipertension1" name="hipertension" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idHipertension2" name="hipertension" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_inmune">Enfermedad o tratamiento inmunosupresor</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idInmune1" name="inmune" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idInmune2" name="inmune" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_cardio">Enfermedad cardiovascular</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idCardio1" name="cardio" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idCardio2" name="cardio" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_renal">Insuficiencia renal crónica</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idRenal1" name="renal" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idRenal2" name="renal" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-5 control-label" for="id_reg_cancer">Cáncer</label>
		                                        <div class="col-lg-5">
													<div class="radio">
						                                <label>
						                                    <input type="radio" id="idCancer1" name="cancer" value="Si" /> Sí
						                                </label>
						                            </div>
						                            <div class="radio">
						                                <label>
						                                    <input type="radio" id="idCancer2" name="cancer" value="No" /> No
						                                </label>
						                            </div>
		                                        </div>
		                                    </div>
		                                    
		                                    
		                                </div>		                        
										<div class="modal-footer" style="padding: 5px 20px; text-align:center">
											<button type="button" class="btn-ghost blue" id="btnRegS" onclick="postValidarRegistraS()">REGISTRAR SÍNTOMAS</button>
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
	function postValidarRegistra() {
		var validator = $('#id_registra').data('bootstrapValidator');
	    validator.validate();
	    if (validator.isValid()) {
	    	saveCiudadano();
	    }
	}
	function postValidarRegistraS() {
		var validator2 = $('#id_registraS').data('bootstrapValidator');
	    validator2.validate();
	    if (validator2.isValid()) {
	    	saveSintomas();
	    }
	}
	function saveCiudadano(){
		
		var json,json2,nrodoc,nac,tipdoc,numcel,nom,fecnac,dir,dep,prov,dis;
			nrodoc=$("#idNumDocumento").val();		
			nac=$("#idNacionalidad").val();
			tipdoc=$("#idTipoDocumento").val();
			numcel=$("#idNumCelular").val();
			nom=$("#idNombre").val();
			fecnac=$("#idFechaNac").val();
			mes=$("#idMes").val();
			ano=$("#idAno").val();
			dir=$("#idDireccion").val();
			dep=$("#idDepartamento").val();
			prov=$("#idProvincia").val();
			dis=$("#idDistrito").val();
			json=JSON.stringify({numDocumento:nrodoc,nacionalidad:nac,tipoDocumento:tipdoc,
								 numCelular:numcel,nombre:nom,fechanac:fecnac,direccion:dir,ubigeo:dis});
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
		   				data: {opcion:"saveCiudadano",datos:json},
		   				success:function(data){
		   					//console.log(data);
		   					if(data==1){
		   						$("#idDni").val(nrodoc);	
								swal("Registro Guardado correctamente...","","success");
								$("#idCodigoS").val("0");
								$("#idMensajeS").text("Síntomas");
					    		$('#idModalRegistra').modal('hide');
					    		setTimeout(function () {
					    		     $('#idModalRegistraS').modal({
					    		       backdrop: 'static',
					    		       keyboard: false,
					    		       show:true
					    		     });
					    		}, 500);
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
	function saveSintomas(){
		
		var json,json2,cod,dni,gusto,tos,garganta,respirar,congestion,fiebre,fiebre1,fiebre2,otro,observacion,fecreg,alerta,
			contacto,salir,trabajo,obesidad,pulmonar,asma,diabetes,hipertension,inmune,cardio,renal,cancer;
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
		
		json=JSON.stringify({codigo:cod,dni:dni,gusto:gusto,tos:tos,garganta:garganta,respirar:respirar,congestion:congestion,
							 fiebre:fiebre,fiebre1:fiebre1,fiebre2:fiebre2,otro:otro,observacion:observacion,fechareg:fecreg,
							 alerta:alerta,contacto:contacto,salir:salir,trabajo:trabajo,obesidad:obesidad,
							 pulmonar:pulmonar,asma:asma,diabetes:diabetes,hipertension:hipertension,inmune:inmune,
							 cardio:cardio,renal:renal,cancer:cancer});
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
		   				url:  'ServletSintoma',
		   				type: 'POST',
		   				data: {opcion:"saveSintomas",datos:json},
		   				success:function(data){
		   					console.log(data);
		   					if(data==1){
								swal("Registro Guardado correctamente...","","success");
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
	function mostrarVentana(){
		$('#id_registra').trigger("reset");
		$('#id_registra').data('bootstrapValidator').resetForm(true);
		$("#idCodigo").val("0");		
		$("#idMensaje").text("Registrar Ciudadano");
		$("#btnReg").text("REGISTRAR CIUDADANO");
		$('#idModalRegistra').modal({backdrop: 'static',keyboard:false,show:true});
	}
	function mostrarVentana2(){
		$('#id_registraS').trigger("reset");
		$('#id_registraS').data('bootstrapValidator').resetForm(true);
		$("#idCodigoS").val("0");		
		$("#idMensajeS").text("Registrar Ciudadano");
		$("#btnRegS").text("REGISTRAR CIUDADANO");
		$('#idModalRegistraS').modal({backdrop: 'static',keyboard:false,show:true});
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
	
	function mostrarNacionalidad(){
		$.getJSON("ServletUsuario",{opcion:"listarNacionalidad"},
		  function(data){
			$.each(data,function(index,item){
			  $("#idNacionalidad").append("<option value='"+item.gentilicio+"'>"+
							item.gentilicio+"</option>");	
				})
		})
	}
	</script>

	<script>	
		$(document).ready(function() {			
			mostrarNacionalidad();
			mostrarDepartamentos();
			
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
		    	nombre: {
		            validators: {
		                notEmpty: {
		                    message: 'El campo Nombre es requerido. No puede estar vacio'
		                },
		                stringLength: {
		                    min: 3,
		                    max: 30,
		                    message: 'El nombre debe contener minimo 3 y maximo de 30 letras'
		                },
		                regexp: {
		                    regexp: /^[a-zA-Z\s\á\é\í\ó\ú\Á\É\Í\Ó\Ú\ñ\Ñ]+$/,
		                    message: 'El nombre sólo puede contener letras'
		                }
		            }
		        },
		        nacionalidad:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo nacionalidad es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        tipodocumento:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo tipodocumento es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        numdocumento:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo numdocumento es requerido. No puede estar vacio'
		                },
		                stringLength: {
		                    min: 8,
		                    max: 8,
		                    message: 'El Nro. Documento debe tener 8 dígitos'
		                }
		        	}
		        },
		        fechanac:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo fechanac es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        departamento:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo departamento es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        provincia:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo provincia es requerido. No puede estar vacio'
		                },
		                stringLength: {
		                    min: 3,
		                    message: 'El campo provincia es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        distrito:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo distrito es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        direccion:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo direccion es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        numcelular:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo numcelular es requerido. No puede estar vacio'
		                },
		                stringLength: {
		                    min: 9,
		                    max: 9,
		                    message: 'El num celular debe contener minimo 9 números'
		                }
		        	}
		        }
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
		        gusto:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo gusto es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        tos:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo tos es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        garganta:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo garganta es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        respirar:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo respirar es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        congestion:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo congestion es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        fiebre:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo fiebre es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        fiebre1:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        fiebre2:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        otro:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo otro es requerido. No puede estar vacio'
		                }
		        	}
		        },
		    	observacion: {
		            validators: {
		                stringLength: {
		                    max: 100,
		                    message: 'La observacion debe contener máximo de 100 letras'
		                },
		                regexp: {
		                    regexp: /^[a-zA-Z\s\á\é\í\ó\ú\Á\É\Í\Ó\Ú\ñ\Ñ]+$/,
		                    message: 'El nombre sólo puede contener letras'
		                }
		            }
		        },
		        fechasintoma:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo fechasintoma es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        alerta:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo alerta es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        contacto:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo contacto es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        salir:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo salir es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        trabajo:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo trabajo es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        obesidad:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo obesidad es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        pulmonar:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo pulmonar es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        asma:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo asma es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        diabetes:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo diabetes es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        hipertension:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo hipertension es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        inmune:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo inmune es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        cardio:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo cardio es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        renal:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo renal es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        cancer:{
		        	validators:{
		        		notEmpty: {
		                    message: 'El campo cancer es requerido. No puede estar vacio'
		                }
		        	}
		        },
		        
		
		    }
		});
	});
</script>


</body>
</html>




