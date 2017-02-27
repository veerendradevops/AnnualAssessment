package com.lisi.annualassessment.service;

import java.util.List;

import com.lisi.annualassessment.orm.CensusForm;

public interface TMPersonalInformationService {

	
	
	public List<CensusForm> getEmployeeDetails(String empClockNumber,String currentYear);

	public void insertSalaryReview(CensusForm employee,String clock,String year);

	public CensusForm getEmployeeForm(String clock, String year);
	
	public void updatePrintDate(String empClockNumber,String currentYear);
}
