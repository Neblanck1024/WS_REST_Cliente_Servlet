package com.cibertec.action;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
public class ServletUbigeo extends HttpServlet {
//	private static final String REST_DEPARTAMENTO="http://localhost:8080/WS_REST_Servidor/rest/departamentos/";
//	private static final String REST_DISTRITO="http://localhost:8080/WS_REST_Servidor/rest/distrito/";
//	
//	private static final String REST_DEPARTAMENTO="http://covid19.j.layershift.co.uk/Servicio/rest/departamentos/";
//	private static final String REST_DISTRITO="http://covid19.j.layershift.co.uk/Servicio/rest/distrito/";
	
	private static final String REST_DEPARTAMENTO="http://env-6410274.j.layershift.co.uk/servicio/rest/departamentos/";
	private static final String REST_DISTRITO="http://env-6410274.j.layershift.co.uk/servicio/rest/distrito/";
	//Crear un cliente para el acceso a las URLs
	Client cliente=Client.create();
	
	private static final long serialVersionUID = 1L;
    public ServletUbigeo() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String metodo=request.getParameter("opcion");
		if(metodo.equals("listarDepartamentos"))
			listarDepartamentos(request,response);
		else if(metodo.equals("listarProvincias"))
			listarProvincias(request,response);
		else if(metodo.equals("listarDistritos"))
			listarDistritos(request,response);
	}
	private void listarProvincias(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cod=request.getParameter("cod");
			WebResource wr=cliente.resource(REST_DEPARTAMENTO+cod);
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
	private void listarDistritos(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cod1=request.getParameter("cod1");
			String cod2=request.getParameter("cod2");
//			cod1=cod1.replace("-", " ");
//			cod2=cod2.replace("-", " ");
			WebResource wr=cliente.resource(REST_DISTRITO+cod1+"/"+cod2);
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
	private void listarDepartamentos(HttpServletRequest request, HttpServletResponse response) {
		try {
			WebResource wr=cliente.resource(REST_DEPARTAMENTO);
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



