package com.lisi.annualassessment.dao;

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.orm.Disciplinary;

public interface UploadFormDAO {
	
	
	public void uploadEmployee(CensusForm censusForm);
		
		
	public void saveEmpDisciplinary(Disciplinary disciplinary);
	
	public void deleteEmpDetails(CensusForm delCensusForm);
	
	
	public void deleteExistingEmp(int employeeClock);


	public void deleteHierarchy(int delEmp);


	public void deleteDisciplinary(int delEmp);


	public void uploadEmployeeClock(CensusForm censusForm);


	public void fetchCensusForm(String clockNumber, String currentYear);

}
