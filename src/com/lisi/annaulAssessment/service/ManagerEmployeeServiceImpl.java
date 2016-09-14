package com.lisi.annaulAssessment.service;

import java.util.List;

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
	public List<PresentYearObjectives> retrievePresentYearObjectives() {
		// TODO Auto-generated method stub
		return managerEmployeedao.retrievePresentYearObjectives();
	}

	@Override
	public void updateDevelopmentGoals(PresentYearObjectives developmentGoals) {
	managerEmployeedao.updateDevelopmentGoals(developmentGoals);
		
	}

}
