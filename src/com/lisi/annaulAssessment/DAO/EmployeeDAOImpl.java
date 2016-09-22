/**
 * 
 */
package com.lisi.annaulAssessment.DAO;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lisi.annaualAssessment.orm.CensusForm;
import com.lisi.annaulAssessment.pojo.CensusFormPojo;
import com.lisi.annaulAssessment.util.Converters;

/**
 * @author manikanta.b
 *
 */
@Repository("EmployeeDAO")
public class EmployeeDAOImpl implements EmployeeDAO {

	@Autowired
	private SessionFactory sessionFactory;

	
	// returns all the exempt employees on where condition basiscs 
	
	@Override
	public List<CensusForm> getExemptEmployees(int clockNumber,String empStatus,String currentYear) {
	//	String statement = "from CensusForm where exemptOrNonExempt=? and supervisorClockNumber=? and annaulYear=?";

		String statement = "from CensusForm where supervisorClockNumber=? and annaulYear=?";
		
		Query query = sessionFactory.getCurrentSession().createQuery(statement);

	//	query.setString(0, empStatus);
		query.setInteger(0, clockNumber);
		query.setString(1, currentYear.trim());
		// year should pass
		
		// sessionFactory.getCurrentSession().createQuery(query).list();
		return (List<CensusForm>) query.list();
	}


	@Override
	public List<Integer> getEmployees() {
		String statement = "select c.empClockNumber from CensusForm c";

		List<Integer> empClockNumbers= new ArrayList<Integer>();
		Query query = sessionFactory.getCurrentSession().createQuery(statement);

	//	query.setString(0, "exempt");
		
		// sessionFactory.getCurrentSession().createQuery(query).list();
		
		List list=query.list();
		
		Iterator iterator = list.iterator();
		Integer i;
		while(iterator.hasNext())
		{
			 i = (Integer)iterator.next();
		
			 empClockNumbers.add(i);
		}		
		
		return empClockNumbers;
	}


	@Override
	public int getEmployeeClockNumbers(String empName,String year) {
		
		
		int clockNumber = (int) sessionFactory.getCurrentSession().createQuery("select empClockNumber from Hierarchy  where employeeADName = :empName and apprisalYear = :year")
				.setString("empName",empName).setString("year", year.trim()).uniqueResult();
		/*
		if(clockNumber.equals("null")){
			
			return 0;
		}*/
		
		return clockNumber;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<CensusForm> getEmployeeRole(String year) {
		String statement = "from CensusForm where annaulYear=?";

		Query query = sessionFactory.getCurrentSession().createQuery(statement);

		query.setParameter(0,year.trim());
		
		List<CensusForm> censusFormData=query.list();
		
		return censusFormData;
		
	}


	@Override
	public CensusForm getLoginEmployeeDetails(int clockNumber,String username, String currentYear) {
		
		String statement = " from CensusForm where empClockNumber=? and annaulYear=?";
		
		Query query = sessionFactory.getCurrentSession().createQuery(statement);
		
		query.setInteger(0, clockNumber);
		query.setString(1, currentYear);
		
		CensusForm census=(CensusForm)query.uniqueResult();
		
		if(census==null){
			
			return null;
		}
		
		return census;
	}


	

}

/*
 * List<CensusFormFields>list=ht.execute(new
 * HibernateCallback<List<CensusFormFields>>(){
 * 
 * @Override public List<CensusFormFields> doInHibernate(Session ses) throws
 * HibernateException, SQLException { SQLQuery
 * sqlquery=ses.createSQLQuery(query); sqlquery.addEntity(CensusForm.class);
 * List<CensusForm>list=sqlquery.list();
 * 
 * System.out.println(list); return list; }
 * 
 * });
 * 
 * return list;
 */