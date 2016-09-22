package com.lisi.annaulAssessment.DAO;

import java.util.List;


import com.lisi.annaualAssessment.orm.CensusForm;



public interface TMPersonalInformationDAO {
	
	
	public List<CensusForm> getEmployeeDetails(String empClockNumber,String currentYear);
	

}
