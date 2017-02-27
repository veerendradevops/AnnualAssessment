package com.lisi.annualassessment.dao;

import java.util.List;

import com.lisi.annualassessment.orm.PresentYearObjectives;

public interface ManagerEmployeeDAO {

	
	public void savePresentYearObjectives(PresentYearObjectives presentyearObj,String yearOfEmp) ;
	
	public PresentYearObjectives retrievePresentYearObjectives(String clockNumber,String year);
	
	public void updateDevelopmentGoals(PresentYearObjectives developmentGoals,String clock,String year);
	
	public void updateMeetingSummary(PresentYearObjectives meetingSummary);
	
}
