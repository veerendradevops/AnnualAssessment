package com.lisi.annualassessment.dao;

import java.util.Collections;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.pojo.UploadForm;
import com.lisi.annualassessment.util.Converters;

@Repository("EmailNotificationDAO")
public class EmailNotificationDAOImpl implements EmailNotificationDAO {

	private static final Logger log = Logger.getLogger(ManagerEmployeeDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<CensusForm> getExemptFormDetails(String exempt, String factoryLocation,String year) {

		Query query;
		log.info("started getExemptFormDetails()");
		System.out.println(factoryLocation);
		
		List<CensusForm> censusForms = Collections.EMPTY_LIST;

		if (factoryLocation.isEmpty()) {
			log.info(" factoryLocation.isEmpty( ");
			String statement = "from CensusForm where annaulYear=?";
			query = sessionFactory.getCurrentSession().createQuery(statement);

		//	query.setParameter(0, exempt.trim());
			query.setParameter(0, year.trim());

		}

		else {

			log.info(" factoryLocation.is Not Empty ");
			String statement = "from CensusForm where exemptOrNonExempt=? and factoryLocation=? and annaulYear=?";
			query = sessionFactory.getCurrentSession().createQuery(statement);

			query.setParameter(0, exempt.trim());
			query.setParameter(1, factoryLocation.trim());
			query.setParameter(2, year.trim());

		}
		
		censusForms = query.list();
		
		if(censusForms.isEmpty()){
			
			
			
			
		}
		
		return censusForms;

	}

	@Override
	public List<CensusForm> getExemptFormDetails(String exempt, UploadForm form,String year) {

		Query query;
		log.info("DAO");

	//	String statement = "from CensusForm where exemptOrNonExempt=? and contains(factoryLocation,:city) or contains(factoryLocation,:torrance) or contains(factoryLocation,:america)";
		String statement = "from CensusForm where  factoryLocation like ? or factoryLocation like ?  or factoryLocation like ? and annaulYear=? and eStatus!=?";
		query = sessionFactory.getCurrentSession().createQuery(statement);

	//	query.setParameter(0, exempt.trim());

		System.out.println(form.getCoi() + " coi");
		System.out.println(form.getTorrance() + " torr");
		System.out.println(form.getAmerica() + " amer");
/*
		if(form.getCoi()==null){
			
			form.setCoi("");
		}
		if(form.getTorrance()==null){
			
			form.setTorrance("");
		}
		if(form.getAmerica()==null){
			
			form.setAmerica("");
		}*/
		
		log.info(form.getCoi() + " coi");
		log.info(form.getTorrance() + " torr");
		log.info(form.getAmerica() + " amer");

		if ((String.valueOf(form.getCoi()).equalsIgnoreCase("null") || form.getCoi().isEmpty()) && (String.valueOf(form.getTorrance()).equalsIgnoreCase("null") ||form.getTorrance().isEmpty())) {

			form.setCoi(form.getAmerica());
			form.setTorrance(form.getAmerica());
		}

		if ((String.valueOf(form.getAmerica()).equalsIgnoreCase("null") || form.getAmerica().isEmpty()) && (String.valueOf(form.getTorrance()).equalsIgnoreCase("null") || form.getTorrance().isEmpty())) {

			form.setAmerica(form.getCoi());
			form.setTorrance(form.getCoi());
		}

		if ((String.valueOf(form.getAmerica()).equalsIgnoreCase("null") ||form.getAmerica().isEmpty()) && (String.valueOf(form.getCoi()).equalsIgnoreCase("null") || form.getCoi().isEmpty())) {

			form.setAmerica(form.getTorrance());
			form.setCoi(form.getTorrance());
		}

		if ( String.valueOf(form.getCoi()).equalsIgnoreCase("null") ||  form.getCoi().isEmpty()) {

			form.setCoi(form.getAmerica());

		}
		if ( String.valueOf(form.getAmerica()).equalsIgnoreCase("null") || form.getAmerica().isEmpty()) {

			form.setAmerica(form.getCoi());

		}

		if ( String.valueOf(form.getTorrance()).equalsIgnoreCase("null") || form.getTorrance().isEmpty()) {
			form.setTorrance(form.getCoi());
		}
		
		
		
		query.setParameter(0, "%"+form.getCoi()+"%");
		query.setParameter(1, "%"+form.getTorrance()+"%");
		query.setParameter(2, "%"+form.getAmerica()+"%");
		query.setParameter(3, year.trim());
		query.setParameter(4, "Terminated");

		return (List<CensusForm>) query.list();
	}

	/*if ((String.valueOf(form.getCoi()).equalsIgnoreCase("null") || form.getCoi().isEmpty()) && (String.valueOf(form.getTorrance()).equalsIgnoreCase("null") ||form.getTorrance().isEmpty())) {

	form.setCoi(form.getAmerica());
	form.setTorrance(form.getAmerica());
}

if ((String.valueOf(form.getAmerica()).equalsIgnoreCase("null") || form.getAmerica().isEmpty()) && (String.valueOf(form.getTorrance()).equalsIgnoreCase("null") || form.getTorrance().isEmpty())) {

	form.setAmerica(form.getCoi());
	form.setTorrance(form.getCoi());
}

if ((String.valueOf(form.getAmerica()).equalsIgnoreCase("null") ||form.getAmerica().isEmpty()) && (String.valueOf(form.getCoi()).equalsIgnoreCase("null") || form.getCoi().isEmpty())) {

	form.setAmerica(form.getTorrance());
	form.setCoi(form.getTorrance());
}

if ( String.valueOf(form.getCoi()).equalsIgnoreCase("null") ||  form.getCoi().isEmpty()) {

	form.setCoi(form.getAmerica());

}
if ( String.valueOf(form.getAmerica()).equalsIgnoreCase("null") || form.getAmerica().isEmpty()) {

	form.setAmerica(form.getCoi());

}

if ( String.valueOf(form.getTorrance()).equalsIgnoreCase("null") || form.getTorrance().isEmpty()) {
	form.setTorrance(form.getCoi());
}*/
	
	
}
