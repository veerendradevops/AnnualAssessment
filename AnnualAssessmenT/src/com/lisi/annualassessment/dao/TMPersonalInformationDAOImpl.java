package com.lisi.annualassessment.dao;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.controller.ExemptEmployeeController;

@Repository("tMPersonalInformationDAO")
public class TMPersonalInformationDAOImpl implements TMPersonalInformationDAO {

	private static final Logger log = Logger.getLogger(TMPersonalInformationDAOImpl.class);

	private Query query = null;

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<CensusForm> getEmployeeDetails(String empClockNumber, String currentYear) {

		try {

			log.info("particular clock number " + empClockNumber);

			String statement = "from CensusForm where empClockNumber=? and annaulYear=?";

			query = sessionFactory.getCurrentSession().createQuery(statement);

			query.setInteger(0, Integer.parseInt(empClockNumber.trim()));
			query.setString(1, currentYear.trim());
			
			System.out.println("Factory ::: "+query);
			return (List<CensusForm>) query.list();
		}

		catch (Exception exception) {
			System.out.println(exception.getMessage());
			exception.printStackTrace();

		}
		return (List<CensusForm>) query.list();

	}

	@Override
	public void insertSalaryReview(CensusForm employee,String clock,String year) {
		String statement="update CensusForm set percentageOfIncrease=?, nextYearHourlyRate=?,nextYearAnnualRate=? where empClockNumber=? and annaulYear=?";
		try{
		query =sessionFactory.getCurrentSession().createQuery(statement);
		query.setParameter(0,employee.getPercentageOfIncrease());
		query.setParameter(1 ,employee.getNextYearHourlyRate());
		query.setParameter(2 ,employee.getNextYearAnnualRate());
		query.setParameter(3 ,Integer.parseInt(clock));
		query.setParameter(4, year);
		
		query.executeUpdate();
		System.out.println("Enter DAOImpl class");
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
	}

	@Override
	public CensusForm getEmployeeForm(String clockNumber, String year) {

		String statement = "from CensusForm where empClockNumber=? and annaulYear=?";

		query = sessionFactory.getCurrentSession().createQuery(statement);

		query.setInteger(0, Integer.parseInt(clockNumber.trim()));
		query.setString(1, year);
		System.out.println("Factory ::: " + query);
		CensusForm censusform = (CensusForm) query.uniqueResult();

		return censusform;
	}
	
	@Override
	public void updatePrintDate(String empClockNumber, String currentYear) {


		
		Date printDate=new Date();
		log.info("Enter updatePrintDate ::: "+printDate);
		
		
		String statement="update CensusForm set printDate=? where empClockNumber=? and annaulYear=?";
		
		try{
		query=sessionFactory.getCurrentSession().createQuery(statement);
		query.setParameter(0,printDate.toString());
		query.setInteger(1, Integer.parseInt(empClockNumber.trim()));
		query.setString(2, currentYear);
		query.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
	}
}
