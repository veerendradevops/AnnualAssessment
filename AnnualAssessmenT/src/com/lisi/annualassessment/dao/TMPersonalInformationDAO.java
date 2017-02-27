package com.lisi.annualassessment.dao;

import java.util.List;

import com.lisi.annualassessment.orm.CensusForm;



public interface TMPersonalInformationDAO {
	
	
	public List<CensusForm> getEmployeeDetails(String empClockNumber,String currentYear);
	
	public void insertSalaryReview(CensusForm employee,String clock,String years);

	public CensusForm getEmployeeForm(String clock, String year);
	
	public void updatePrintDate(String empClockNumber,String currentYear);
}
