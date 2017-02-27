/**
 * 
 */
package com.lisi.annualassessment.service;

import java.util.List;

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.pojo.CensusFormFields;
import com.lisi.annualassessment.pojo.CensusFormPojo;

/**
 * @author manikanta.b
 *
 */
public interface EmployeeService {
	
	
	public List<CensusForm> getExemptEmployees(int clockNumber,String empStatus,String currentYear);

	public List<Integer> getEmployees(String string);
	
	public int getEmployeeClockNumbers(String empName,String year);
	
	
	public List<CensusForm> getEmployeeRole(String currentYear);

	public CensusForm getLoginEmployeeDetails(int clockNumber,String username, String currentYear);

	public List<CensusForm> getSupervorsEmployeesList(int supervisorClockNumber);
	
	public String getEmailInformation(String clockNumber,String annalYear);

	public List<CensusForm> getSupervorEmployeesList(Integer supervisorClockNumber);

	public List<CensusForm> getHrManagerEmployees(int clockNumber, String currentYear);

	public List<CensusForm> getFactoryLocation(String clockNumber,String currentYear);
	
	public String[] getSalaryReviewStatus(String trim);

	String getSharedLocationPath();
	
	
}
