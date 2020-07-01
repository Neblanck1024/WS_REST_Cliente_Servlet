package com.cibertec.entidad;

import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement
public class FallecidoBean {

	private String numfallecido;

	public String getNumfallecido() {
		return numfallecido;
	}

	public void setNumfallecido(String numfallecido) {
		this.numfallecido = numfallecido;
	}

}
