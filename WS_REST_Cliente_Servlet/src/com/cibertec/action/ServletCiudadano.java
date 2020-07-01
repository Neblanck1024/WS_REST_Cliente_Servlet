package com.cibertec.action;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cibertec.entidad.CiudadanoBean;
import com.cibertec.entidad.SintomasBean;
import com.cibertec.entidad.UsuarioBean;
import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
public class ServletCiudadano extends HttpServlet {
	
//	private static final String REST_CIUDADANO="http://localhost:8080/WS_REST_Servidor/rest/ciudadano/";
//	private static final String REST_SINTOMAS="http://localhost:8080/WS_REST_Servidor/rest/sintomas/";
//	private static final String REST_USUARIO="http://localhost:8080/WS_REST_Servidor/rest/usuario/";
	
//	private static final String REST_CIUDADANO="http://covid19.j.layershift.co.uk/Servicio/rest/ciudadano/";
//	private static final String REST_SINTOMAS="http://covid19.j.layershift.co.uk/Servicio/rest/sintomas/";
//	private static final String REST_USUARIO="http://covid19.j.layershift.co.uk/Servicio/rest/usuario/";
	
	private static final String REST_CIUDADANO="http://env-6410274.j.layershift.co.uk/servicio/rest/ciudadano/";
	private static final String REST_SINTOMAS="http://env-6410274.j.layershift.co.uk/servicio/rest/sintomas/";
	private static final String REST_USUARIO="http://env-6410274.j.layershift.co.uk/servicio/rest/usuario/";
	//Crear un cliente para el acceso a las URLs
	Client cliente=Client.create();
	
	private static final long serialVersionUID = 1L;
    public ServletCiudadano() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String metodo=request.getParameter("opcion");
		if(metodo.equals("listarCiudadanos"))
			listarCiudadanos(request,response);
		else if(metodo.equals("listarSintomas"))
			listarSintomas(request,response);
		else if(metodo.equals("saveCiudadano"))
			saveCiudadano(request,response);
		else if(metodo.equals("saveSintomas"))
			saveSintomas(request,response);
		else if(metodo.equals("eliminarCiudadano"))
			eliminarCiudadano(request,response);
		else if(metodo.equals("iniciarSesion"))
			iniciarSesion(request,response);
		else if(metodo.equals("cerrarSesion"))
			cerrarSesion(request,response);
	}
	
	private void eliminarCiudadano(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cod=request.getParameter("codigo");
			WebResource wr=
					cliente.resource(REST_CIUDADANO+cod);
			ClientResponse cr;
			cr=wr.type("application/json").delete(
					ClientResponse.class);
			String cad=cr.getEntity(String.class);
			response.setContentType
			("application/json;charset=UTF-8");
			PrintWriter pw=response.getWriter();
			pw.println(cad);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	private void saveCiudadano(HttpServletRequest request, HttpServletResponse response) {
		try {
			//recuperar el json
			String valor=request.getParameter("datos");
			//convertir la variable valor a una entidad
			Gson json=new Gson();
			CiudadanoBean bean=json.
						fromJson(valor,CiudadanoBean.class);
			WebResource wr=cliente.resource(REST_CIUDADANO);
			ClientResponse cr;
			
			System.out.println(bean.getNumDocumento());
			System.out.println(bean.getNacionalidad());
			System.out.println(bean.getTipoDocumento());
			System.out.println(bean.getNumCelular());
			System.out.println(bean.getNombre());
			System.out.println(bean.getFechareg());
			System.out.println(bean.getDireccion());
			System.out.println(bean.getDis());
			
//			Buscando NroDocumento
			String cod = bean.getNumDocumento();
			WebResource wr2=
					cliente.resource(REST_CIUDADANO+cod);
			ClientResponse cr2=wr2.
					accept("application/json").
					get(ClientResponse.class);
			String valorString=cr2.getEntity(String.class);
			response.setContentType
			("application/json;charset=UTF-8");
			CiudadanoBean bean2=json.
					fromJson(valorString,CiudadanoBean.class);
			//--------------------------------------------------
			
			if(bean2==null) {				
				cr=wr.type("application/json").post(
						ClientResponse.class,valor);							
			}
			else {
				cr=wr.type("application/json").put(
						ClientResponse.class,valor);
			}
			String cad=cr.getEntity(String.class);
			response.setContentType
			("application/json;charset=UTF-8");
			PrintWriter pw=response.getWriter();
			pw.println(cad);
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	private void saveSintomas(HttpServletRequest request, HttpServletResponse response) {
		try {
			//recuperar el json
			String valor=request.getParameter("datos");
			//convertir la variable valor a una entidad
			Gson json=new Gson();
			SintomasBean bean=json.
					fromJson(valor,SintomasBean.class);
			WebResource wr=cliente.resource(REST_SINTOMAS);
			ClientResponse cr;
			
			if(bean.getCodigo()==0) {				
				cr=wr.type("application/json").post(
						ClientResponse.class,valor);							
			}
			else {
				cr=wr.type("application/json").put(
						ClientResponse.class,valor);
			}
			String cad=cr.getEntity(String.class);
			response.setContentType
			("application/json;charset=UTF-8");
			PrintWriter pw=response.getWriter();
			pw.println(cad);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	private void listarCiudadanos(HttpServletRequest request, HttpServletResponse response) {
		try {
			WebResource wr=cliente.resource(REST_CIUDADANO);
			ClientResponse cr=wr.
					accept("application/json").
					get(ClientResponse.class);
			String valor=cr.getEntity(String.class);
			response.setContentType
			("application/json;charset=UTF-8");
			PrintWriter pw=response.getWriter();
			pw.println(valor);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void listarSintomas(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cod=request.getParameter("cod");
			WebResource wr=cliente.resource(REST_SINTOMAS+cod);
			ClientResponse cr=wr.
					accept("application/json").
					get(ClientResponse.class);
			String valor=cr.getEntity(String.class);
			response.setContentType
			("application/json;charset=UTF-8");
			PrintWriter pw=response.getWriter();
			pw.println(valor);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void iniciarSesion(HttpServletRequest request, HttpServletResponse response) {
		try {
//			Gson json=new Gson();	
			String usu, pas;
			usu=request.getParameter("login");
			pas=request.getParameter("clave");
			System.out.println(usu);
			System.out.println(pas);
			WebResource wr=cliente.resource(REST_USUARIO+usu+"/"+pas);
			ClientResponse cr=wr.
					accept("application/json").
					get(ClientResponse.class);
			String valor=cr.getEntity(String.class);
			System.out.println(valor);
			response.setContentType
			("application/json;charset=UTF-8");
			
			PrintWriter pw=response.getWriter();
			pw.println(valor);
			
			Gson json=new Gson();
			UsuarioBean bean=json.
					fromJson(valor,UsuarioBean.class);
						
			if (bean==null) {
				request.setAttribute("msj", "Usuario y/o clave incorrectos");
				request.getRequestDispatcher("login.jsp").forward(request, response);;
			}else {
				System.out.println(bean.getNacionalidad());
				//Crear sesión
				HttpSession sesion=request.getSession();				
				//Atributo para almacenar el usuario que ingreso
				sesion.setAttribute("objeto", bean);
				UsuarioBean usua= (UsuarioBean) sesion.getAttribute("objeto");
				//Direccionar p.w. "menu.jsp"
				if(usua!=null) {
					request.getRequestDispatcher("menu.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void cerrarSesion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		sesion.removeAttribute("objeto");
		//Cerrar sesion
		sesion.invalidate();
		response.sendRedirect("login.jsp");
	}

}



