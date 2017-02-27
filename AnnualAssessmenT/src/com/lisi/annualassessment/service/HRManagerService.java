package com.lisi.annualassessment.service;

import java.util.List;

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.orm.Department;
import com.lisi.annualassessment.orm.ExemptSection2;
import com.lisi.annualassessment.orm.JobKnowledgeAndSkill;

public interface HRManagerService {

	List getAllHREmployees();

	List<CensusForm> getHrManagerEmployees(int clockNumber, String year);

	
	
	
	List<CensusForm> getSupervisorEmployees(int parseInt, String currentYear,String role,String loginUser);

	List<CensusForm> getHRGeneralist(int parseInt, String currentYear);

	List<CensusForm> getHrAdminEmployees(int parseInt, String currentYear);

	List<CensusForm> getHrEmployeeViews(int parseInt, String currentYear, String string,String roles);

	public List<CensusForm> getCensusFormAnnualYear(String year,String clockNumber,String role);

	public List<Department> getAllDepartments();

	public String[] gethourlyRate(String costCenter, String year);

	public List<CensusForm> getCenscusFormEmpShift(List<Integer> empShipft, String year,String clockNumber,String role);

	public List<CensusForm> getCensusFormFactoryLocationAndEmpShift(List<String> FactoryLocation,
			List<Integer> empShift, String year,String clockNumber,String role);

	public List<CensusForm> getCensusFormFactoryLocation(List<String> factoryLocation, String year,String clockNumber,String role);
	
	public List<ExemptSection2> getAllExemptSection2Data(String annualYear);
	
	public List<JobKnowledgeAndSkill> getAllNonExemptSection3Data(String annualYear);

	String[] gethourlyRate(List<String> factoryLocation, String costCenter, List<Integer> shift, String year);

	List<CensusForm> getSupervisorEmployees(int parseInt, String currentYear);

	//added for factoryLocation And Shift Filter
	List<CensusForm> getCenscusFormFactoryLocation(String year, String clockNumber, String role);
	
	List getYearsInDatabase(String loginClock);
	
	List<CensusForm> getSearchClockId(int clockNumber, String role,String year,String filterContent);

	List<CensusForm> getSearchJobTitle(int clockNumber, String role, String year,String filterContent);

	List<CensusForm> getSearchName(int clockNumber, String role, String year,String filterContent);

	
}
