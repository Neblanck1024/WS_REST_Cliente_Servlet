package com.cibertec.action;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cibertec.entidad.ContagiadoBean;
import com.cibertec.entidad.EstadoBean;
import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
public class ServletEstado extends HttpServlet {
//	private static final String REST_ESTADO="http://localhost:8080/WS_REST_Servidor/rest/estado/";
//	private static final String REST_ESTADO2="http://localhost:8080/WS_REST_Servidor/rest/estadocontagiado/";
//	private static final String REST_CONTAGIADO="http://localhost:8080/WS_REST_Servidor/rest/contagiado/";
//	private static final String REST_RECUPERADO="http://localhost:8080/WS_REST_Servidor/rest/recuperado/";
//	private static final String REST_FALLECIDO="http://localhost:8080/WS_REST_Servidor/rest/fallecido/";
//	private static final String REST_UCI="http://localhost:8080/WS_REST_Servidor/rest/uci/";
//	private static final String REST_DEPA="http://localhost:8080/WS_REST_Servidor/rest/departamentos/";
	
//	private static final String REST_ESTADO="http://covid19.j.layershift.co.uk/Servicio/rest/estado/";
//	private static final String REST_ESTADO2="http://covid19.j.layershift.co.uk/Servicio/rest/estadocontagiado/";
//	private static final String REST_CONTAGIADO="http://covid19.j.layershift.co.uk/Servicio/rest/contagiado/";
//	private static final String REST_RECUPERADO="http://covid19.j.layershift.co.uk/Servicio/rest/recuperado/";
//	private static final String REST_FALLECIDO="http://covid19.j.layershift.co.uk/Servicio/rest/fallecido/";
//	private static final String REST_UCI="http://covid19.j.layershift.co.uk/Servicio/rest/uci/";
//	private static final String REST_DEPA="http://covid19.j.layershift.co.uk/Servicio/rest/departamentos/";
	
	private static final String REST_ESTADO="http://env-6410274.j.layershift.co.uk/servicio/rest/estado/";
	private static final String REST_ESTADO2="http://env-6410274.j.layershift.co.uk/servicio/rest/estadocontagiado/";
	private static final String REST_CONTAGIADO="http://env-6410274.j.layershift.co.uk/servicio/rest/contagiado/";
	private static final String REST_RECUPERADO="http://env-6410274.j.layershift.co.uk/servicio/rest/recuperado/";
	private static final String REST_FALLECIDO="http://env-6410274.j.layershift.co.uk/servicio/rest/fallecido/";
	private static final String REST_UCI="http://env-6410274.j.layershift.co.uk/servicio/rest/uci/";
	private static final String REST_DEPA="http://env-6410274.j.layershift.co.uk/servicio/rest/departamentos/";
	
	//Crear un cliente para el acceso a las URLs
	Client cliente=Client.create();
	
	private static final long serialVersionUID = 1L;
    public ServletEstado() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String metodo=request.getParameter("opcion");
		if(metodo.equals("listarEstados"))
			listarEstados(request,response);
		else if(metodo.equals("listarEstadosXContagiado"))
			listarEstadosXContagiado(request,response);
		else if(metodo.equals("buscarEstado"))
			buscarEstado(request,response);
		else if(metodo.equals("saveEstado"))
			saveEstado(request,response);
		else if(metodo.equals("eliminarEstado"))
			eliminarEstado(request,response);
		else if(metodo.equals("numContagiados"))
			numContagiados(request,response);
		else if(metodo.equals("numRecuperados"))
			numRecuperados(request,response);
		else if(metodo.equals("numFallecidos"))
			numFallecidos(request,response);
		else if(metodo.equals("numUCIs"))
			numUCIs(request,response);
		else if(metodo.equals("numContagiadosXDep"))
			numContagiadosXDep(request,response);
		else if(metodo.equals("numRecuperadosXDep"))
			numRecuperadosXDep(request,response);
		else if(metodo.equals("numFallecidosXDep"))
			numFallecidosXDep(request,response);
		else if(metodo.equals("numUCIsXDep"))
			numUCIsXDep(request,response);
		else if(metodo.equals("listarDepartamentos"))
			listarDepartamentos(request,response);
	}
	private void numUCIsXDep(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cod=request.getParameter("cod");
			WebResource wr=cliente.resource(REST_UCI+cod);
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
	private void numFallecidosXDep(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cod=request.getParameter("cod");
			WebResource wr=cliente.resource(REST_FALLECIDO+cod);
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
	private void numRecuperadosXDep(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cod=request.getParameter("cod");
			WebResource wr=cliente.resource(REST_RECUPERADO+cod);
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
	private void numContagiadosXDep(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cod=request.getParameter("cod");
			WebResource wr=cliente.resource(REST_CONTAGIADO+cod);
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
			WebResource wr=cliente.resource(REST_DEPA);
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
	private void numContagiados(HttpServletRequest request, HttpServletResponse response) {
		try {
			WebResource wr=cliente.resource(REST_CONTAGIADO);
			ClientResponse cr=wr.
					accept("application/json").
					get(ClientResponse.class);
			String valor=cr.getEntity(String.class);
			response.setContentType
			("application/json;charset=UTF-8");
			PrintWriter pw=response.getWriter();
			pw.println(valor);
			
			Gson json=new Gson();
			ContagiadoBean bean=json.
					fromJson(valor,ContagiadoBean.class);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void numRecuperados(HttpServletRequest request, HttpServletResponse response) {
		try {
			WebResource wr=cliente.resource(REST_RECUPERADO);
			ClientResponse cr=wr.
					accept("application/json").
					get(ClientResponse.class);
			String valor=cr.getEntity(String.class);
			response.setContentType
			("application/json;charset=UTF-8");
			PrintWriter pw=response.getWriter();
			pw.println(valor);
			
			Gson json=new Gson();
			ContagiadoBean bean=json.
					fromJson(valor,ContagiadoBean.class);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void numFallecidos(HttpServletRequest request, HttpServletResponse response) {
		try {
			WebResource wr=cliente.resource(REST_FALLECIDO);
			ClientResponse cr=wr.
					accept("application/json").
					get(ClientResponse.class);
			String valor=cr.getEntity(String.class);
			response.setContentType
			("application/json;charset=UTF-8");
			PrintWriter pw=response.getWriter();
			pw.println(valor);
			
			Gson json=new Gson();
			ContagiadoBean bean=json.
					fromJson(valor,ContagiadoBean.class);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void numUCIs(HttpServletRequest request, HttpServletResponse response) {
		try {
			WebResource wr=cliente.resource(REST_UCI);
			ClientResponse cr=wr.
					accept("application/json").
					get(ClientResponse.class);
			String valor=cr.getEntity(String.class);
			response.setContentType
			("application/json;charset=UTF-8");
			PrintWriter pw=response.getWriter();
			pw.println(valor);
			
			Gson json=new Gson();
			ContagiadoBean bean=json.
					fromJson(valor,ContagiadoBean.class);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void eliminarEstado(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cod1=request.getParameter("codigo1");
			String cod2=request.getParameter("codigo2");
			WebResource wr=
					cliente.resource(REST_ESTADO+cod1+"/"+cod2);
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
	private void saveEstado(HttpServletRequest request, HttpServletResponse response) {
		try {
			//recuperar el json
			String valor=request.getParameter("datos");
			//convertir la variable valor a una entidad
			Gson json=new Gson();
			EstadoBean bean=json.
						fromJson(valor,EstadoBean.class);
			WebResource wr=cliente.resource(REST_ESTADO);
			ClientResponse cr;
			
			System.out.println(bean.getCodestado());
			
			//--------------------------------------------------
			if(bean.getCodestado()==0) {				
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
	private void listarEstados(HttpServletRequest request, HttpServletResponse response) {
		try {
			WebResource wr=cliente.resource(REST_ESTADO2);
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
	private void listarEstadosXContagiado(HttpServletRequest request, HttpServletResponse response) {
		try {
			WebResource wr=cliente.resource(REST_ESTADO2);
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
	
	private void buscarEstado(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cod=request.getParameter("cod");
			WebResource wr=cliente.resource(REST_ESTADO+cod);
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



