/**
 * 
 */
package com.lisi.annualassessment.dao;

import java.util.List;

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.pojo.CensusFormFields;
import com.lisi.annualassessment.pojo.CensusFormPojo;

/**
 * @author manikanta.b
 *
 */
public interface EmployeeDAO {

	
	public List<CensusForm> getExemptEmployees(int clockNumber,String empStatus,String currentYear);
	
	public List<Integer> getEmployees(String year);
	
	
	public int getEmployeeClockNumbers(String empName,String year);
	
	
	public List<CensusForm> getEmployeeRole(String currentYear);

	public CensusForm getLoginEmployeeDetails(int clockNumber,String username, String currentYear);

	public List<CensusForm> getSupervisorsEmployeesDao(int supervisorClockNumber);
	
	public String getEmailInformation(String clockNumber,String annalYear);

	public List<CensusForm> getHrManagerEmployees(int clockNumber, String year);

	public List<CensusForm> getSupervisorEmployeesDao(Integer supervisorClockNumber);
	
	public List<CensusForm> getFactoryLocatinDao(String clockNumber, String currentYear);
	
	public String[] getSalaryReviewStatus(String year);

	public String getSharedLocationPath();
	
}
