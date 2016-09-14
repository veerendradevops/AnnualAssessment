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
	public List<CensusForm> getExemptEmployees(int clockNumber) {

	

		return dao.getExemptEmployees(clockNumber);
	}

	@Override
	public List<Integer> getEmployees() {
		// TODO Auto-generated method stub
		 return dao.getEmployees();
	}

	@Override
	public int getEmployeeClockNumbers(String empName) {
		// TODO Auto-generated method stub
		return dao.getEmployeeClockNumbers(empName);
	}

	@Override
	public List<CensusForm> getEmployeeRole() {
		// TODO Auto-generated method stub
		return dao.getEmployeeRole();
	}

}
