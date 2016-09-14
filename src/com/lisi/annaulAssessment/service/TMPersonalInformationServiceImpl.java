package com.lisi.annaulAssessment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lisi.annaualAssessment.orm.CensusForm;
import com.lisi.annaulAssessment.DAO.TMPersonalInformationDAO;

@Service("tMPersonalInformationService")
@Transactional
public class TMPersonalInformationServiceImpl implements TMPersonalInformationService{
	
	@Autowired
	private TMPersonalInformationDAO  tMPersonalInformationDAO;

	@Override
	public List<CensusForm> getEmployeeDetails(String empClockNumber) {
		
		return tMPersonalInformationDAO.getEmployeeDetails(empClockNumber);
	}
	
	

}
