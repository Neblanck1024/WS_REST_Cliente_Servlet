package com.cibertec.entidad;

import java.io.Serializable;

public class NacionalidadBean implements Serializable{

	private int idnac;
	private String pais;
	private String gentilicio;
	private String isonac;
	
	public int getIdnac() {
		return idnac;
	}
	public void setIdnac(int idnac) {
		this.idnac = idnac;
	}
	public String getPais() {
		return pais;
	}
	public void setPais(String pais) {
		this.pais = pais;
	}
	public String getGentilicio() {
		return gentilicio;
	}
	public void setGentilicio(String gentilicio) {
		this.gentilicio = gentilicio;
	}
	public String getIsonac() {
		return isonac;
	}
	public void setIsonac(String isonac) {
		this.isonac = isonac;
	}
	
}
