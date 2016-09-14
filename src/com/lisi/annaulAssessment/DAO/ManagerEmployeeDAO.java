package com.lisi.annaulAssessment.DAO;

import java.util.List;

import com.lisi.annaualAssessment.orm.PresentYearObjectives;

public interface ManagerEmployeeDAO {

	
	public void savePresentYearObjectives(PresentYearObjectives presentyearObj,String yearOfEmp) ;
	
	public List<PresentYearObjectives> retrievePresentYearObjectives();
	
	public void updateDevelopmentGoals(PresentYearObjectives developmentGoals);
	
}
