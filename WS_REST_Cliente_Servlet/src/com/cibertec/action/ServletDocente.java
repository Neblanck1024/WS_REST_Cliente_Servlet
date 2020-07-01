package com.cibertec.action;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cibertec.entidad.DocenteBean;
import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
public class ServletDocente extends HttpServlet {
	private static final String REST_DOCENTE="http://localhost:8080/WS_REST_Servidor/rest/docente/";
	private static final String REST_DISTRITO="http://localhost:8080/WS_REST_Servidor/rest/distrito/";
	//Crear un cliente para el acceso a las URLs
	Client cliente=Client.create();
	
	private static final long serialVersionUID = 1L;
    public ServletDocente() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String metodo=request.getParameter("opcion");
		if(metodo.equals("listarDocentes"))
			listarDocentes(request,response);
		else if(metodo.equals("listarDistritos"))
			listarDistritos(request,response);
		else if(metodo.equals("saveDocente"))
			saveDocente(request,response);
		else if(metodo.equals("eliminarDocente"))
			eliminarDocente(request,response);
	}
	private void eliminarDocente(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cod=request.getParameter("codigo");
			WebResource wr=
					cliente.resource(REST_DOCENTE+cod);
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
	private void saveDocente(HttpServletRequest request, HttpServletResponse response) {
		try {
			//recuperar el json
			String valor=request.getParameter("datos");
			//convertir la variable valor a una entidad
			Gson json=new Gson();
			DocenteBean bean=json.
						fromJson(valor,DocenteBean.class);
			WebResource wr=cliente.resource(REST_DOCENTE);
			ClientResponse cr;
			
			System.out.println(bean.getCodigo());
			System.out.println(bean.getNombre());
			System.out.println(bean.getPaterno());
			System.out.println(bean.getMaterno());
			System.out.println(bean.getSexo());
			System.out.println(bean.getNumHijos());
			System.out.println(bean.getSueldo());
			System.out.println(bean.getDireccion());
			System.out.println(bean.getCodigoDistrito());
			
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
	private void listarDistritos(HttpServletRequest request, HttpServletResponse response) {
		try {
			WebResource wr=cliente.resource(REST_DISTRITO);
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
	private void listarDocentes(HttpServletRequest request, HttpServletResponse response) {
		try {
			WebResource wr=cliente.resource(REST_DOCENTE);
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



