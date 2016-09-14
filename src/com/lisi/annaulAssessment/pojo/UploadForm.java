package com.lisi.annaulAssessment.pojo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * @author
 *
 */
public class UploadForm {

	private String name;
	private CommonsMultipartFile file;;

	
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
