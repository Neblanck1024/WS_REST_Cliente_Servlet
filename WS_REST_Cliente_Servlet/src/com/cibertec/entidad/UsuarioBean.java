package com.cibertec.entidad;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class UsuarioBean {
	private int idusuario;
	private String nomusuario;
	private String patusuario;
	private String matusuario;
	private String numcelular;
	private int nacionalidad;
	private String tipodocumento;
	private String numdocumento;
	private String correo;
	private String login;
	private String pass;
	public int getIdusuario() {
		return idusuario;
	}
	public void setIdusuario(int idusuario) {
		this.idusuario = idusuario;
	}
	public String getNomusuario() {
		return nomusuario;
	}
	public void setNomusuario(String nomusuario) {
		this.nomusuario = nomusuario;
	}
	public String getPatusuario() {
		return patusuario;
	}
	public void setPatusuario(String patusuario) {
		this.patusuario = patusuario;
	}
	public String getMatusuario() {
		return matusuario;
	}
	public void setMatusuario(String matusuario) {
		this.matusuario = matusuario;
	}
	public String getNumcelular() {
		return numcelular;
	}
	public void setNumcelular(String numcelular) {
		this.numcelular = numcelular;
	}
	public int getNacionalidad() {
		return nacionalidad;
	}
	public void setNacionalidad(int nacionalidad) {
		this.nacionalidad = nacionalidad;
	}
	public String getTipodocumento() {
		return tipodocumento;
	}
	public void setTipodocumento(String tipodocumento) {
		this.tipodocumento = tipodocumento;
	}
	public String getNumdocumento() {
		return numdocumento;
	}
	public void setNumdocumento(String numdocumento) {
		this.numdocumento = numdocumento;
	}
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	
		
}
