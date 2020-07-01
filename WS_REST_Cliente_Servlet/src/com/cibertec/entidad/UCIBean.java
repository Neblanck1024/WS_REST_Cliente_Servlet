package com.cibertec.entidad;

import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement
public class UCIBean {

	private String numuci;

	public String getNumuci() {
		return numuci;
	}

	public void setNumuci(String numuci) {
		this.numuci = numuci;
	}
}
