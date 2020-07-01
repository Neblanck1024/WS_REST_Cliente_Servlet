package com.cibertec.entidad;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class CiudadanoBean {

	private String NumDocumento;
	private String Nacionalidad;
	private String TipoDocumento;
	private String NumCelular;
	private String nombre;
	private String fechanac;
	private String direccion;
	private int ubigeo;
	private String dis;
	private String fechareg;
	
	public String getNumDocumento() {
		return NumDocumento;
	}
	public void setNumDocumento(String numDocumento) {
		NumDocumento = numDocumento;
	}
	public String getNacionalidad() {
		return Nacionalidad;
	}
	public void setNacionalidad(String nacionalidad) {
		Nacionalidad = nacionalidad;
	}
	public String getTipoDocumento() {
		return TipoDocumento;
	}
	public void setTipoDocumento(String tipoDocumento) {
		TipoDocumento = tipoDocumento;
	}
	public String getNumCelular() {
		return NumCelular;
	}
	public void setNumCelular(String numCelular) {
		NumCelular = numCelular;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getFechanac() {
		return fechanac;
	}
	public void setFechanac(String fechanac) {
		this.fechanac = fechanac;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public int getUbigeo() {
		return ubigeo;
	}
	public void setUbigeo(int ubigeo) {
		this.ubigeo = ubigeo;
	}
	public String getDis() {
		return dis;
	}
	public void setDis(String dis) {
		this.dis = dis;
	}
	public String getFechareg() {
		return fechareg;
	}
	public void setFechareg(String fechareg) {
		this.fechareg = fechareg;
	}
}
