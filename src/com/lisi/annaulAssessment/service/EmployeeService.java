/**
 * 
 */
package com.lisi.annaulAssessment.service;

import java.util.List;

import com.lisi.annaualAssessment.orm.CensusForm;
import com.lisi.annaulAssessment.pojo.CensusFormFields;
import com.lisi.annaulAssessment.pojo.CensusFormPojo;

/**
 * @author manikanta.b
 *
 */
public interface EmployeeService {
	
	
	public List<CensusForm> getExemptEmployees(int clockNumber,String empStatus,String currentYear);

	public List<Integer> getEmployees();
	
	public int getEmployeeClockNumbers(String empName,String year);
	
	
	public List<CensusForm> getEmployeeRole(String currentYear);

	public CensusForm getLoginEmployeeDetails(int clockNumber,String username, String currentYear);
	
	
}
