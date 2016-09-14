package com.lisi.annaulAssessment.DAO;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lisi.annaualAssessment.orm.CensusForm;
import com.lisi.annaulAssessment.controller.ExemptEmployeeController;

@Repository("tMPersonalInformationDAO")
public class TMPersonalInformationDAOImpl implements TMPersonalInformationDAO {

	private static final Logger log=Logger.getLogger(TMPersonalInformationDAOImpl.class);
			
			
	
	private Query query = null;

	@Autowired
	private SessionFactory sessionFactory;
	
	

	@SuppressWarnings("unchecked")
	@Override
	public List<CensusForm> getEmployeeDetails(String empClockNumber) {

		try {

		log.info("particular clock number " + empClockNumber);

			String statement = "from CensusForm where empClockNumber=?";

			query = sessionFactory.getCurrentSession().createQuery(statement);
			
			query.setInteger(0, Integer.parseInt(empClockNumber.trim()));
			
			/*List<CensusForm> censusData=query.list();

			log.info(censusData);*/
			
			return (List<CensusForm>) query.list();
		}

		catch (Exception exception) {
			System.out.println(exception.getMessage());

		}
		return (List<CensusForm>) query.list();

	}

}
