package com.lisi.annualassessment.orm;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ScanDocs")
public class ScanDocs {
	
	@Id
	@Column(name = "serial")
	private int serial;
	@Column(name = "ScanDocsPath")
	String scanDocsPath;
	
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public String getScanDocsPath() {
		return scanDocsPath;
	}
	public void setScanDocsPath(String scanDocsPath) {
		this.scanDocsPath = scanDocsPath;
	}
	

}
