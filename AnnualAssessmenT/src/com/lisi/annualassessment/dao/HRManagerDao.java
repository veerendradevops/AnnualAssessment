package com.lisi.annualassessment.dao;

import java.util.List;

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.orm.Department;
import com.lisi.annualassessment.orm.ExemptSection2;
import com.lisi.annualassessment.orm.JobKnowledgeAndSkill;

public interface HRManagerDao {

	List getAllHRManagerEmploeeeList();

	List<CensusForm> getHrManagerEmployees(int clockNumber, String year);

	List<CensusForm> getSupervisorEmployee(int clock, String currentYear,String role,String loginUser);

	List<CensusForm> getHRGeneralistEmployee(int clock, String currentYear);

	List<CensusForm> getHRAdminEmployee(int clock, String currentYear);

	public List<CensusForm> getCensusFormFactoryLocation(List<String> factoryLocation, String year,String clockNumber,String role);

	public List<CensusForm> getCensusFormEmpShift(List<Integer> empShift, String year,String clockNumber,String role); 

	public List<CensusForm> getCensusFormFactoryLocationAndEmpShift(List<String> factoryLocation,
			List<Integer> empShift, String year,String clockNumber,String role);

	public List<CensusForm> getCensusFormAnnualYear(String year,String clockNumber,String role);

	public List<Department> getAllDepartments();

	public String[] gethourlyRate(String costCenter, String year);

	public List<CensusForm> getHrEmployeeView(int clockID, String currentYear, String status,String role);
	
	public List<ExemptSection2> getAllExemptSection2Data(String annualYear);

	public List<JobKnowledgeAndSkill> getAllNonExemptSection3Data(String annualYear);

	String[] gethourlyRate(List<String> factoryLocation, String costCenter, List<Integer> shift, String year);

	List<CensusForm> getSupervisorEmployee(int clock, String currentYear);
	
	
	//added for factoryLocation And Shift Filter
		List<CensusForm> getCensusFormFactoryLocationShift(String year, String clockNumber, String role);
		
		
		List<CensusForm> getSearchClockId(int clockNumber, String role, String year,String filterContent);
		List<CensusForm> getSearchJobTitle(int clockNumber, String role, String year,String filterContent);
		List<CensusForm> getSearchName(int clockNumber, String role, String year,String filterContent);

		
		List getYearsInDatabase(String loginClock);

}
