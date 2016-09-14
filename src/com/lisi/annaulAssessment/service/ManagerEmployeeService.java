package com.lisi.annaulAssessment.service;

import java.util.List;

import com.lisi.annaualAssessment.orm.PresentYearObjectives;

public interface ManagerEmployeeService {

	public void savePresentYearObjectives(PresentYearObjectives presentyearObj,String yearOfEmp);
	
	public List<PresentYearObjectives> retrievePresentYearObjectives();
	
	public void updateDevelopmentGoals(PresentYearObjectives developmentGoals);
	
}
