package com.lisi.annualassessment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lisi.annualassessment.dao.HRManagerDao;
import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.orm.Department;
import com.lisi.annualassessment.orm.ExemptSection2;
import com.lisi.annualassessment.orm.JobKnowledgeAndSkill;

@Service("hRManagerService")
@Transactional
public class HRManagerServiceImpl implements HRManagerService {
	@Autowired
	private HRManagerDao hrManagerDao;

	public List getAllHREmployees() {
		List hrEmployeeList = hrManagerDao.getAllHRManagerEmploeeeList();
		return hrEmployeeList;
	}

	@Override
	public List<CensusForm> getHrManagerEmployees(int clockNumber, String year) {

		return hrManagerDao.getHrManagerEmployees(clockNumber, year);
	}

	@Override
	public List<CensusForm> getSupervisorEmployees(int clock, String currentYear,String role,String loginUser) {
		// TODO Auto-generated method stub
		System.out.println("hr manager service..");
		return hrManagerDao.getSupervisorEmployee(clock, currentYear,role,loginUser);
	}

	@Override
	public List<CensusForm> getHRGeneralist(int clock, String currentYear) {
		// TODO Auto-generated method stub
		return hrManagerDao.getHRGeneralistEmployee(clock, currentYear);
	}

	@Override
	public List<CensusForm> getHrAdminEmployees(int clock, String currentYear) {
		// TODO Auto-generated method stub
		return hrManagerDao.getHRAdminEmployee(clock, currentYear);
	}

	@Override
	public List<CensusForm> getHrEmployeeViews(int clockID, String currentYear, String status,String role) {
		// TODO Auto-generated method stub
		return hrManagerDao.getHrEmployeeView(clockID, currentYear, status,role);
	}

	@Override
	public List<CensusForm> getCenscusFormEmpShift(List<Integer> empShipft, String year,String clockNumber,String role) {

		return hrManagerDao.getCensusFormEmpShift(empShipft, year,clockNumber,role);
	}

	@Override
	public List<CensusForm> getCensusFormAnnualYear(String year,String clockNumber,String role) {
		return hrManagerDao.getCensusFormAnnualYear(year,clockNumber,role);
	}

	@Override
	public List<Department> getAllDepartments() {
		return hrManagerDao.getAllDepartments();
	}

	@Override
	public String[] gethourlyRate(String costCenter, String year) {
		// TODO Auto-generated method stub
		return hrManagerDao.gethourlyRate(costCenter, year);
	}

	@Override
	public List<CensusForm> getCensusFormFactoryLocationAndEmpShift(List<String> FactoryLocation,
			List<Integer> empShift, String year,String clockNumber,String role) {

		return hrManagerDao.getCensusFormFactoryLocationAndEmpShift(FactoryLocation, empShift, year,clockNumber,role);
	}

	@Override
	public List<CensusForm> getCensusFormFactoryLocation(List<String> factoryLocation, String year,String clockNumber,String role) {

		return hrManagerDao.getCensusFormFactoryLocation(factoryLocation, year,clockNumber,role);
	}

	@Override
	public List<ExemptSection2> getAllExemptSection2Data(String annualYear) {
		return hrManagerDao.getAllExemptSection2Data(annualYear);
	}

	@Override
	public List<JobKnowledgeAndSkill> getAllNonExemptSection3Data(String annualYear) {
		return hrManagerDao.getAllNonExemptSection3Data(annualYear);
	}

	@Override
	public String[] gethourlyRate(List<String> factoryLocation, String costCenter, List<Integer> shift, String year) {
		// TODO Auto-generated method stub
		return hrManagerDao.gethourlyRate(factoryLocation, costCenter,shift, year);
	}
	@Override
	public List<CensusForm> getSupervisorEmployees(int clock, String currentYear) {
		// TODO Auto-generated method stub
		return hrManagerDao.getSupervisorEmployee(clock, currentYear);
	}


	//added for factoryLocation And Shift Filter
	
		@Override
		public List<CensusForm> getCenscusFormFactoryLocation(String year,String clockNumber,String role) {

			return hrManagerDao.getCensusFormFactoryLocationShift(year,clockNumber,role);
		}
		@Override
		public List getYearsInDatabase(String loginClock) {
			
			return hrManagerDao.getYearsInDatabase(loginClock);
		}

		@Override
		public List<CensusForm> getSearchClockId(int clockNumber, String role, String year,String filterContent) {
			// TODO Auto-generated method stub
			return hrManagerDao.getSearchClockId(clockNumber,role,year,filterContent);
		}

		@Override
		public List<CensusForm> getSearchJobTitle(int clockNumber, String role, String year,String filterContent) {
			// TODO Auto-generated method stub
		return hrManagerDao.getSearchJobTitle(clockNumber,role,year,filterContent);
		}

		@Override
		public List<CensusForm> getSearchName(int clockNumber, String role, String year,String filterContent) {
			// TODO Auto-generated method stub
			return hrManagerDao.getSearchName(clockNumber,role,year,filterContent);
		}

		
}
