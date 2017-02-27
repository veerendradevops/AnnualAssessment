/**
 * 
 */
package com.lisi.annualassessment.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lisi.annualassessment.controller.LoginController;
import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.util.Converters;
import com.sun.jndi.cosnaming.CNNameParser;

/**
 * @author manikanta.b
 *
 */
@Repository("EmployeeDAO")
public class EmployeeDAOImpl implements EmployeeDAO {
	
	private static final Logger log = Logger.getLogger(EmployeeDAO.class);

	@Autowired
	private SessionFactory sessionFactory;
	
	Query query;
	
	

	@Override
	public List<CensusForm> getExemptEmployees(int clockNumber, String empStatus, String currentYear) {
		

		log.info("ClockNumber ::: "+clockNumber);
		
		String statement = "from CensusForm where supervisorClockNumber=? and annaulYear=? and eStatus!=? and classification2 !=?";

		 query = sessionFactory.getCurrentSession().createQuery(statement);

		// query.setString(0, empStatus);
		query.setInteger(0, clockNumber);
		query.setString(1, currentYear.trim());
		query.setString(2, "Terminated");
		query.setString(3, "E - Executive");
		
		
		return (List<CensusForm>) query.list();
	}

	@Override
	public List<Integer> getEmployees(String year) {
		
		String statement = "select empClockNumber from CensusForm where annaulYear = ?";

		List<Integer> empClockNumbers = new ArrayList<Integer>();
		Query query = sessionFactory.getCurrentSession().createQuery(statement);

		
		query.setParameter(0, year.trim());
		// query.setString(0, "exempt");

		// sessionFactory.getCurrentSession().createQuery(query).list();

		List list = query.list();

		Iterator iterator = list.iterator();
		Integer i;
		while (iterator.hasNext()) {
			i = (Integer) iterator.next();

			empClockNumbers.add(i);
		}

		return empClockNumbers;
	}

	@Override
	public int getEmployeeClockNumbers(String empName, String year) {

		int clockNumber = (int) sessionFactory.getCurrentSession()
				.createQuery(
						"select empClockNumber from Hierarchy  where employeeADName = :empName and apprisalYear = :year")
				.setString("empName", empName).setString("year", year.trim()).uniqueResult();
		/*
		 * if(clockNumber.equals("null")){
		 * 
		 * return 0; }
		 */

		return clockNumber;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CensusForm> getEmployeeRole(String year) {
	
		String statement = "from CensusForm where annaulYear =:annualYear";

		Query query = sessionFactory.getCurrentSession().createQuery(statement);

		query.setParameter("annualYear", year.trim());

		List<CensusForm> censusFormData = query.list();
		
		if(censusFormData.isEmpty()){
			
			query = sessionFactory.getCurrentSession().createQuery(statement);

			int annualYear=Integer.parseInt(year.trim());
			
			String annualYearr = String.valueOf((annualYear-1));
			
			query.setParameter("annualYear", annualYearr);
			List<CensusForm> censusFormDataa = query.list();
			
			return censusFormDataa;
		}

		System.out.println(censusFormData.toString());
		return censusFormData;

	}

	@Override
	public CensusForm getLoginEmployeeDetails(int clockNumber, String username, String currentYear) {

		String statement = " from CensusForm where empClockNumber =:clockNumber and annaulYear =:year";

		 query = sessionFactory.getCurrentSession().createQuery(statement);

		query.setInteger("clockNumber", clockNumber);
		query.setString("year", currentYear);

		CensusForm census = (CensusForm) query.uniqueResult();

		if (census == null) {
			
			 query = sessionFactory.getCurrentSession().createQuery(statement);

			 int year = Integer.parseInt(currentYear);
			 int lastYear = (year-1);
			System.out.println("System year::::::"+lastYear);
				query.setInteger("clockNumber", clockNumber);
				query.setString("year", String.valueOf(lastYear));
		
				CensusForm censusForm = (CensusForm) query.uniqueResult();
			

				if(censusForm!=null){
					return censusForm;
				}
			return null;
		}

		return census;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CensusForm> getSupervisorsEmployeesDao(int supervisorClockNumber) {
		String statement = "from CensusForm cf where cf.supervisorClockNumber=?";
		Query query = sessionFactory.getCurrentSession().createQuery(statement);

		query.setParameter(0, supervisorClockNumber);
		
		
		List<CensusForm> supervisorsEmployeesList = query.list();
		
		return supervisorsEmployeesList;
	}
	
	@Override
	public String getEmailInformation(String clockNumber,String annalYear) {
			
			String result = "";

			String hqlQuery = "select empEmailAddress from CensusForm where empClockNumber=? and annaulYear=?";

			result = (String) sessionFactory.getCurrentSession().createQuery(hqlQuery)
					.setParameter(0, Integer.parseInt(clockNumber.trim())).setParameter(1, annalYear.trim()).uniqueResult();


			return result.toString();
		
	}

	@Override
	public List<CensusForm> getHrManagerEmployees(int clockNumber, String year) {
		
		String statement = "from CensusForm where hrManagerClockNumber=? and annaulYear=?";

		Query query = sessionFactory.getCurrentSession().createQuery(statement);

		// query.setString(0, empStatus);
		query.setInteger(0, clockNumber);
		query.setString(1, year);
		

		return (List<CensusForm>) query.list();
	}

	@Override
	public List<CensusForm> getSupervisorEmployeesDao(Integer supervisorClockNumber) {
		// TODO Auto-generated method stub
		return null;
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<CensusForm> getFactoryLocatinDao(String clockNumber, String currentYear) {
		System.out.println("clockNumber" + clockNumber);
		System.out.println("currentyear" + currentYear);
		String statement = "from CensusForm";
		Query query = sessionFactory.getCurrentSession().createQuery(statement);

		List<CensusForm> census = (List<CensusForm>) query.list();
		System.out.println("dao.");
		for (CensusForm c : census) {

			System.out.println(c.getFactoryLocation());

		}
		System.out.println("-------------------------------");

		return (List<CensusForm>) query.list();

	}
	
	
	@Override
	public String[] getSalaryReviewStatus(String year) {
		String[] results = new String[3];
		String statementForTorrance = "from CensusForm cf where cf.factoryLocation like ? and cf.annaulYear=? and eStatus !=? ORDER BY cf.role asc";
		Query torrance = sessionFactory.getCurrentSession().createQuery(statementForTorrance);
		torrance.setFirstResult(0);
		torrance.setMaxResults(1);

		torrance.setString(0, "%Torrance%");
		torrance.setString(1, year);
		torrance.setString(2, "Terminated");

		CensusForm torr = (CensusForm) torrance.uniqueResult();

		if (torr == null) {
			System.out.println("Sorry,No Employees found in Torrance");
			results[0] = "";
		} else {
			System.out.println("SalaryStatus::" + torr.getRole());
			System.out.println("EmpclockNumeber for Torrace" + torr.getEmpClockNumber());
			results[0] = String.valueOf(torr.getRole());
		}
		String statementForCoi = "from CensusForm cf where cf.factoryLocation like ? and cf.annaulYear=? and eStatus!=? ORDER BY cf.role asc";
		Query cityOfIndustry = sessionFactory.getCurrentSession().createQuery(statementForCoi);
		cityOfIndustry.setFirstResult(0);
		cityOfIndustry.setMaxResults(1);

		cityOfIndustry.setString(0, "%City of Industry%");
		cityOfIndustry.setString(1, year);
		cityOfIndustry.setString(2, "Terminated");

		CensusForm coi = (CensusForm) cityOfIndustry.uniqueResult();
		if (coi == null) {
			System.out.println("Sorry,No Employees found in City of Industry");
			results[1] = "";
		} else {
			System.out.println("Salary review status for COI " + String.valueOf(coi.getRole()));
			System.out.println("EmpclockNumeber for COI " + String.valueOf(coi.getEmpClockNumber()));
			results[1] = String.valueOf(coi.getRole());
		}
		String statementForAmerica = "from CensusForm cf where cf.factoryLocation like ? and cf.annaulYear=? and eStatus!=? ORDER BY cf.role asc";
		Query america = sessionFactory.getCurrentSession().createQuery(statementForAmerica);
		america.setFirstResult(0);
		america.setMaxResults(1);
		america.setString(0, "%North America%");
		america.setString(1, year);
		america.setString(2, "Terminated");

		CensusForm ameri = (CensusForm) america.uniqueResult();
		if (ameri == null) {
			System.out.println("Sorry,No Employees is their in America ");
			results[2] = "";
		} else {
			System.out.println("Salary review status for America " + ameri.getRole());
			System.out.println("America ClockNumber" + ameri.getEmpClockNumber());
			results[2] = String.valueOf(ameri.getRole());
		}
		return results;

	}
	

	@Override
	public String getSharedLocationPath() {
		String statement="select scanDocsPath from ScanDocs";
		Query query = sessionFactory.getCurrentSession().createQuery(statement);
		return (String)query.uniqueResult();
	}
	
	
}



