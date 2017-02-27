package com.lisi.annualassessment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.dao.TMPersonalInformationDAO;

@Service("tMPersonalInformationService")
@Transactional
public class TMPersonalInformationServiceImpl implements TMPersonalInformationService {

	@Autowired
	private TMPersonalInformationDAO tMPersonalInformationDAO;

	@Override
	public List<CensusForm> getEmployeeDetails(String empClockNumber, String currentYear) {

		return tMPersonalInformationDAO.getEmployeeDetails(empClockNumber, currentYear);
	}

	@Override
	public void insertSalaryReview(CensusForm employee,String clock,String year) {
		tMPersonalInformationDAO.insertSalaryReview(employee,clock,year);
	}

	@Override
	public CensusForm getEmployeeForm(String clock, String year) {
		// TODO Auto-generated method stub
		return tMPersonalInformationDAO.getEmployeeForm(clock, year);
	}

	@Override
	public void updatePrintDate(String empClockNumber,String currentYear) {
		// TODO Auto-generated method stub
		 tMPersonalInformationDAO.updatePrintDate(empClockNumber,currentYear);
	}
}
