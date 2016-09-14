/**
 * 
 */
package com.lisi.annaulAssessment.service;

import java.util.List;

import com.lisi.annaualAssessment.orm.CensusForm;
import com.lisi.annaulAssessment.pojo.CensusFormFields;

/**
 * @author manikanta.b
 *
 */
public interface EmployeeService {
	
	
	public List<CensusForm> getExemptEmployees(int clockNumber);

	public List<Integer> getEmployees();
	
	public int getEmployeeClockNumbers(String empName);
	
	
	public List<CensusForm> getEmployeeRole();
	
	
}
