package com.lisi.annualassessment.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lisi.annualassessment.orm.AppraisalMailConfig;
@Repository("AppraisalMailConfigDAO")
public class AppraisalMailConfigDAOImpl implements AppraisalMailConfigDAO{
	private static final Logger log = Logger.getLogger(AppraisalMailConfigDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<AppraisalMailConfig> getMailConfig(String userType, String status) {
		
		log.info("started getMailConfig()");
		String statement = "from AppraisalMailConfig where usertype=? and status=? ";
		Query query = sessionFactory.getCurrentSession().createQuery(statement);

		query.setParameter(0, userType.trim());

		query.setParameter(1, status.trim());
		log.info("End getMailConfig()");
		
		return (List<AppraisalMailConfig>) query.list();
	}
	
}
