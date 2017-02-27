package com.lisi.annualassessment.service;

import java.util.List;

import com.lisi.annualassessment.orm.PresentYearObjectives;

public interface ManagerEmployeeService {

	public void savePresentYearObjectives(PresentYearObjectives presentyearObj,String yearOfEmp);
	
	public PresentYearObjectives retrievePresentYearObjectives(String clock,String year);
	
	public void updateDevelopmentGoals(PresentYearObjectives developmentGoals,String clock,String year);
	
	public void updateMeetingSummary(PresentYearObjectives meetingsummary);
	
}
