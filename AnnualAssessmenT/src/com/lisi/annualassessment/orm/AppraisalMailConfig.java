package com.lisi.annualassessment.orm;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "AppraisalMailConfig ")
public class AppraisalMailConfig {
	
	@Id
	@Column(name = "serial")
	private int serial;
	
	@Column(name = "usertype")
	private String usertype;
	
	@Column(name = "whento")
	private String whento;
	
	@Column(name = "mail_from")
	private String mail_from;
	
	@Column(name = "mail_to")
	private String mail_to;
	
	@Column(name = "cc_list")
	private String cc_list;
	
	@Column(name = "mail_subject")
	private String mail_subject;
	
	@Column(name = "mail_body")
	private String mail_body;
	
	@Column(name = "status")
	private String status;
	
	

	public int getSerial() {
		return serial;
	}

	public void setSerial(int serial) {
		this.serial = serial;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String getWhento() {
		return whento;
	}

	public void setWhento(String whento) {
		this.whento = whento;
	}

	public String getMail_from() {
		return mail_from;
	}

	public void setMail_from(String mail_from) {
		this.mail_from = mail_from;
	}

	public String getMail_to() {
		return mail_to;
	}

	public void setMail_to(String mail_to) {
		this.mail_to = mail_to;
	}

	public String getCc_list() {
		return cc_list;
	}

	public void setCc_list(String cc_list) {
		this.cc_list = cc_list;
	}

	public String getMail_subject() {
		return mail_subject;
	}

	public void setMail_subject(String mail_subject) {
		this.mail_subject = mail_subject;
	}

	public String getMail_body() {
		return mail_body;
	}

	public void setMail_body(String mail_body) {
		this.mail_body = mail_body;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
