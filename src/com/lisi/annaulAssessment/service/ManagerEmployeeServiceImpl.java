package com.lisi.annaulAssessment.service;

import java.util.List;

import javax.persistence.metamodel.ManagedType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lisi.annaualAssessment.orm.PresentYearObjectives;
import com.lisi.annaulAssessment.DAO.ManagerEmployeeDAO;


@Service
@Transactional
public class ManagerEmployeeServiceImpl implements ManagerEmployeeService {

	@Autowired
	private ManagerEmployeeDAO managerEmployeedao;
	
	@Override
	public void savePresentYearObjectives(PresentYearObjectives presentyearObj,String yearOfEmp) {
		

		managerEmployeedao.savePresentYearObjectives(presentyearObj,yearOfEmp);
	}

	@Override
	public PresentYearObjectives retrievePresentYearObjectives(String clockNumber,String year) {
		// TODO Auto-generated method stub
		return managerEmployeedao.retrievePresentYearObjectives(clockNumber,year);
	}

	@Override
	public void updateDevelopmentGoals(PresentYearObjectives developmentGoals,String clock,String year) {
	managerEmployeedao.updateDevelopmentGoals(developmentGoals, clock, year);
		
	}

	@Override
	public void updateMeetingSummary(PresentYearObjectives meetingsummary) {
		
		managerEmployeedao.updateMeetingSummary(meetingsummary); 
		
	}
	
	

}
