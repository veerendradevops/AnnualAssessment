/**
 * 
 */
package com.lisi.annualassessment.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.dao.EmployeeDAO;
import com.lisi.annualassessment.util.Converters;


/**
 * @author manikanta.b
 *
 */
@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeDAO dao;

	@Override
	public List<CensusForm> getExemptEmployees(int clockNumber,String empStatus,String currentYear) {

	

		return dao.getExemptEmployees(clockNumber,empStatus,currentYear);
	}

	@Override
	public List<Integer> getEmployees(String year) {
		// TODO Auto-generated method stub
		 return dao.getEmployees(year);
	}

	@Override
	public int getEmployeeClockNumbers(String empName,String currentYear) {
		// TODO Auto-generated method stub
		return dao.getEmployeeClockNumbers(empName,currentYear);
	}

	@Override
	public List<CensusForm> getEmployeeRole(String currentYear) {
		// TODO Auto-generated method stub
		return dao.getEmployeeRole(currentYear);
	}

	@Override
	public CensusForm getLoginEmployeeDetails(int clockNumber,String username, String currentYear) {
		// TODO Auto-generated method stub
		return dao.getLoginEmployeeDetails(clockNumber,username,currentYear);
	}

	@Override
	public List<CensusForm> getSupervorsEmployeesList(int supervisorClockNumber) {
		List<CensusForm> supervisorEmployees=dao.getSupervisorsEmployeesDao(supervisorClockNumber);
		return supervisorEmployees;
	}

	@Override
	public String getEmailInformation(String clockNumber, String annalYear) {		
		return dao.getEmailInformation(clockNumber, annalYear);
	}

	@Override
	public List<CensusForm> getSupervorEmployeesList(Integer supervisorClockNumber) {
		// TODO Auto-generated method stub
		return dao.getSupervisorEmployeesDao(supervisorClockNumber);
	}

	@Override
	public List<CensusForm> getHrManagerEmployees(int clockNumber, String currentYear) {
		// TODO Auto-generated method stub
		return dao.getHrManagerEmployees(clockNumber, currentYear);
	}

	@Override
	public List<CensusForm> getFactoryLocation(String clockNumber, String currentYear) {

		return dao.getFactoryLocatinDao(clockNumber, currentYear);
	}
	@Override
	public String getSharedLocationPath() {
		
		return dao.getSharedLocationPath();
	}
	@Override
	public String[] getSalaryReviewStatus(String year) {
		return dao.getSalaryReviewStatus(year);
		 
	}


}
