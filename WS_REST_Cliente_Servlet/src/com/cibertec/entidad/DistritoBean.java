package com.cibertec.entidad;
import java.io.Serializable;
public class DistritoBean implements Serializable{
	private int codigo;
	private String distrito;
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getDistrito() {
		return distrito;
	}
	public void setDistrito(String distrito) {
		this.distrito = distrito;
	}
}

