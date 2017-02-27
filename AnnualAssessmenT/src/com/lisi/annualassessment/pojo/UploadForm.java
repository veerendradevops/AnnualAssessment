package com.lisi.annualassessment.pojo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * @author
 *
 */
public class UploadForm {

	private String name;
	private CommonsMultipartFile file;
	
	private String uploadYear;
	
	
	
	
	private CommonsMultipartFile destinationlocation;
	
	private String coi,torrance,america;
	
	
	

	
	

	public String getUploadYear() {
		return uploadYear;
	}

	public void setUploadYear(String uploadYear) {
		this.uploadYear = uploadYear;
	}

	public String getCoi() {
		return coi;
	}

	public void setCoi(String coi) {
		this.coi = coi;
	}

	public String getTorrance() {
		return torrance;
	}

	public void setTorrance(String torrance) {
		this.torrance = torrance;
	}

	public String getAmerica() {
		return america;
	}

	public void setAmerica(String america) {
		this.america = america;
	}

	public CommonsMultipartFile getDestinationlocation() {
		return destinationlocation;
	}

	public void setDestinationlocation(CommonsMultipartFile destinationlocation) {
		this.destinationlocation = destinationlocation;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public CommonsMultipartFile getFile() {
		return file;
	}

	public void setFile(CommonsMultipartFile file) {
		this.file = file;
		this.name = file.getOriginalFilename();
	}

	
	
}
