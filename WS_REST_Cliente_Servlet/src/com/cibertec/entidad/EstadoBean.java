package com.cibertec.entidad;

import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement
public class EstadoBean {
	private int codestado;
	private String numdocumento;
	private String estado;
	private String hospitalizado;
	private String condicion;
	private int ubigeo;
	private String fechareg;
	private String departamento;
	private String provincia;
	private String distrito;
	
	public int getCodestado() {
		return codestado;
	}
	public void setCodestado(int codestado) {
		this.codestado = codestado;
	}
	public String getNumdocumento() {
		return numdocumento;
	}
	public void setNumdocumento(String numdocumento) {
		this.numdocumento = numdocumento;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getHospitalizado() {
		return hospitalizado;
	}
	public void setHospitalizado(String hospitalizado) {
		this.hospitalizado = hospitalizado;
	}
	public String getCondicion() {
		return condicion;
	}
	public void setCondicion(String condicion) {
		this.condicion = condicion;
	}
	public int getUbigeo() {
		return ubigeo;
	}
	public void setUbigeo(int ubigeo) {
		this.ubigeo = ubigeo;
	}
	public String getFechareg() {
		return fechareg;
	}
	public void setFechareg(String fechareg) {
		this.fechareg = fechareg;
	}
	public String getDepartamento() {
		return departamento;
	}
	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}
	public String getProvincia() {
		return provincia;
	}
	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}
	public String getDistrito() {
		return distrito;
	}
	public void setDistrito(String distrito) {
		this.distrito = distrito;
	}	
}
