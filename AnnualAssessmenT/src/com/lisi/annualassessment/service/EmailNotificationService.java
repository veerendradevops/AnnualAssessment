package com.lisi.annualassessment.service;

import java.util.List;

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.pojo.UploadForm;

public interface EmailNotificationService {
	
	public List<CensusForm> getExemptFormDetails(String exempt,String factoryLocation, String string);

	public List<CensusForm> getExemptFormDetails(String exempt, UploadForm form,String year);

}
