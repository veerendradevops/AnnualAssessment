package com.lisi.annualassessment.dao;

import java.util.List;

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.pojo.UploadForm;

public interface EmailNotificationDAO {
	

	public List<CensusForm> getExemptFormDetails(String exempt,String factoryLocation,String year);

	public List<CensusForm> getExemptFormDetails(String exempt, UploadForm form,String year);
	

}
