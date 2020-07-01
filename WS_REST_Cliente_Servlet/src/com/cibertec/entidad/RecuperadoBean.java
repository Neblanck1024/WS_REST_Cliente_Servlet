package com.cibertec.entidad;

import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement
public class RecuperadoBean {

	private String numrecuperado;

	public String getNumrecuperado() {
		return numrecuperado;
	}

	public void setNumrecuperado(String numrecuperado) {
		this.numrecuperado = numrecuperado;
	}

}
