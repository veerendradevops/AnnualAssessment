/**
 * 
 */
package com.lisi.annaulAssessment.service;


import java.util.List;

import javax.persistence.Column;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lisi.annaualAssessment.orm.CensusForm;
import com.lisi.annaulAssessment.DAO.EmployeeDAO;
import com.lisi.annaulAssessment.pojo.CensusFormPojo;


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
	public List<Integer> getEmployees() {
		// TODO Auto-generated method stub
		 return dao.getEmployees();
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

}
