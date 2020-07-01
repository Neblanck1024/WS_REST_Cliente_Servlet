package com.cibertec.action;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cibertec.entidad.UsuarioBean;
import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
public class ServletUsuario extends HttpServlet {
//	private static final String REST_USUARIO="http://localhost:8080/WS_REST_Servidor/rest/usuario/";
//	private static final String REST_NACIONALIDAD="http://localhost:8080/WS_REST_Servidor/rest/nacionalidad/";
	
//	private static final String REST_USUARIO="http://covid19.j.layershift.co.uk/Servicio/rest/usuario/";
//	private static final String REST_NACIONALIDAD="http://covid19.j.layershift.co.uk/Servicio/rest/nacionalidad/";
	
	private static final String REST_USUARIO="http://env-6410274.j.layershift.co.uk/servicio/rest/usuario/";
	private static final String REST_NACIONALIDAD="http://env-6410274.j.layershift.co.uk/servicio/rest/nacionalidad/";
	//Crear un cliente para el acceso a las URLs
	Client cliente=Client.create();
	
	private static final long serialVersionUID = 1L;
    public ServletUsuario() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String metodo=request.getParameter("opcion");
		if(metodo.equals("listarUsuarios"))
			listarUsuarios(request,response);
		else if(metodo.equals("listarNacionalidad"))
			listarNacionalidad(request,response);
		else if(metodo.equals("saveUsuario"))
			saveUsuario(request,response);
		else if(metodo.equals("eliminarUsuario"))
			eliminarUsuario(request,response);
	}
	private void listarNacionalidad(HttpServletRequest request, HttpServletResponse response) {
		try {
			WebResource wr=cliente.resource(REST_NACIONALIDAD);
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
	private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cod=request.getParameter("codigo");
			WebResource wr=
					cliente.resource(REST_USUARIO+cod);
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
	private void saveUsuario(HttpServletRequest request, HttpServletResponse response) {
		try {
			//recuperar el json
			String valor=request.getParameter("datos");
			//convertir la variable valor a una entidad
			Gson json=new Gson();
			UsuarioBean bean=json.
						fromJson(valor,UsuarioBean.class);
			WebResource wr=cliente.resource(REST_USUARIO);
			ClientResponse cr;
			
			System.out.println(bean.getNumcelular());
			System.out.println(bean.getNumdocumento());

			if(bean.getIdusuario()==0) {				
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
	private void listarUsuarios(HttpServletRequest request, HttpServletResponse response) {
		try {
			WebResource wr=cliente.resource(REST_USUARIO);
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

}



