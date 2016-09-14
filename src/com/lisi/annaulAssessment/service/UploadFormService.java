package com.lisi.annaulAssessment.service;

import com.lisi.annaualAssessment.orm.CensusForm;
import com.lisi.annaualAssessment.orm.Disciplinary;

public interface UploadFormService {
	
	
	public void saveEmployeeDetails(CensusForm censusForm);
	
	
	public void saveEmpDisciplinary(Disciplinary disciplinary);
	
	
	public void deleteEmpDetails(CensusForm delCensusForm);
	
	
	public void deleteExistingEmployees(int delExisEmp);


	public void deleteHierarchy(int delEmp);


	public void deleteDisciplinary(int delEmp);
	
//	public void checkUserRole

}
