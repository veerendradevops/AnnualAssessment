package com.lisi.annaulAssessment.DAO;

import com.lisi.annaualAssessment.orm.CensusForm;
import com.lisi.annaualAssessment.orm.Disciplinary;

public interface UploadFormDAO {
	
	
	public void uploadEmployee(CensusForm censusForm);
		
		
	public void saveEmpDisciplinary(Disciplinary disciplinary);
	
	public void deleteEmpDetails(CensusForm delCensusForm);
	
	
	public void deleteExistingEmp(int employeeClock);


	public void deleteHierarchy(int delEmp);


	public void deleteDisciplinary(int delEmp);

}
