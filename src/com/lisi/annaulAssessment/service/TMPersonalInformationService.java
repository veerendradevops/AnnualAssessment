package com.lisi.annaulAssessment.service;

import java.util.List;

import com.lisi.annaualAssessment.orm.CensusForm;

public interface TMPersonalInformationService {

	
	
	public List<CensusForm> getEmployeeDetails(String empClockNumber,String currentYear);

}
