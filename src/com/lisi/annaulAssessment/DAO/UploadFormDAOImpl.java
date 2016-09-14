package com.lisi.annaulAssessment.DAO;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lisi.annaualAssessment.orm.CensusForm;
import com.lisi.annaualAssessment.orm.Disciplinary;
import com.lisi.annaualAssessment.orm.Hierarchy;
import com.lisi.annaulAssessment.controller.CensusFileUploadController;

@Repository("UploadFormDAO")
public class UploadFormDAOImpl implements UploadFormDAO {

	private static final Logger log = Logger.getLogger(UploadFormDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void uploadEmployee(CensusForm censusForm) {

		try {

			sessionFactory.getCurrentSession().save(censusForm);
		} catch (Exception e) {

			System.out.println(e);
		}
	}

	@Override
	public void saveEmpDisciplinary(Disciplinary disciplinary) {

		try {

			sessionFactory.getCurrentSession().save(disciplinary);
		} catch (Exception e) {

			System.out.println(e);
		}

	}

	@Override
	public void deleteEmpDetails(CensusForm delCensusForm) {

		// delete Hierarchy form

		Hierarchy hierarchy = new Hierarchy();

		hierarchy.setEmpClockNumber(delCensusForm.getEmpClockNumber());

		sessionFactory.getCurrentSession().delete(hierarchy);

		// delete CensusForm form

		CensusForm census = new CensusForm();

		census.setEmpClockNumber(delCensusForm.getEmpClockNumber());

		sessionFactory.getCurrentSession().delete(census);

		// delete Disciplinary form

		Disciplinary disciplinary = new Disciplinary();

		disciplinary.setEmpClockNumber(delCensusForm.getEmpClockNumber());

		sessionFactory.getCurrentSession().delete(disciplinary);

	}

	@Override
	public void deleteExistingEmp(int employeeClock) {

		String hql = "DELETE FROM CensusForm WHERE empClockNumber =?";

		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		query.setInteger(0, employeeClock);

		int result = query.executeUpdate();

		if (result == 0) {

			log.info("records were not deleted");
		} else {

			log.info(employeeClock + " record is delted");
		}

	}

	@Override
	public void deleteHierarchy(int delEmp) {

		String hql = "DELETE FROM Hierarchy WHERE empClockNumber =?";

		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		query.setInteger(0, delEmp);

		int result = query.executeUpdate();

		if (result == 0) {

			log.info("records were not deleted");
		} else {

			log.info(delEmp + " record is delted");
		}

	}

	@Override
	public void deleteDisciplinary(int delEmp) {

		String hql = "DELETE FROM Disciplinary WHERE empClockNumber =?";

		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		query.setInteger(0, delEmp);

		int result = query.executeUpdate();

		if (result == 0) {

			log.info("records were not deleted");
		} else {

			log.info(delEmp + " record is delted");
		}

	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
