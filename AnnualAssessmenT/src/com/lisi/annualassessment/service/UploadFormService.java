package com.lisi.annualassessment.service;

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.orm.Disciplinary;

public interface UploadFormService {
	
	
	public void saveEmployeeDetails(CensusForm censusForm);
	
	
	public void saveEmpDisciplinary(Disciplinary disciplinary);
	
	
	public void deleteEmpDetails(CensusForm delCensusForm);
	
	
	public void deleteExistingEmployees(int delExisEmp);


	public void deleteHierarchy(int delEmp);


	public void deleteDisciplinary(int delEmp);


	public void updateEmployeeDetails(CensusForm censusForm);


	public void fetchCensusForm(String clockNumber,String currentYear);


	
	
//	public void checkUserRole

}
