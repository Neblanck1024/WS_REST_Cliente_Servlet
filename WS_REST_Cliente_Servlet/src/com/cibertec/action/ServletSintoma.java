package com.cibertec.action;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cibertec.entidad.SintomasBean;
import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
public class ServletSintoma extends HttpServlet {

	
//	private static final String REST_SINTOMAS="http://localhost:8080/WS_REST_Servidor/rest/sintomas/";
	
//	private static final String REST_SINTOMAS="http://covid19.j.layershift.co.uk/Servicio/rest/sintomas/";
	
	private static final String REST_SINTOMAS="http://env-6410274.j.layershift.co.uk/servicio/rest/sintomas/";
	
	//Crear un cliente para el acceso a las URLs
	Client cliente=Client.create();
	
	private static final long serialVersionUID = 1L;
    public ServletSintoma() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String metodo=request.getParameter("opcion");
		if(metodo.equals("saveSintomas"))
			saveSintomas(request,response);
	}
	
	private void saveSintomas(HttpServletRequest request, HttpServletResponse response) {
		try {
			//recuperar el json
			String valor=request.getParameter("datos");
			//convertir la variable valor a una entidad
			Gson json=new Gson();
			SintomasBean bean=json.fromJson(valor,SintomasBean.class);
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
	
}



