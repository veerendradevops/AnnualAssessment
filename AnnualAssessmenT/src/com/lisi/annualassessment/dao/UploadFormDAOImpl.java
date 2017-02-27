package com.lisi.annualassessment.dao;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.orm.Disciplinary;
import com.lisi.annualassessment.orm.Hierarchy;
import com.lisi.annualassessment.util.Converters;
import com.lisi.annualassessment.controller.CensusFileUploadController;

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

		/*
		 * Disciplinary disciplinary = new Disciplinary();
		 * 
		 * disciplinary.setEmpClockNumber(delCensusForm.getEmpClockNumber());
		 * 
		 * sessionFactory.getCurrentSession().delete(disciplinary);
		 */

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

		/*
		 * String hql = "DELETE FROM Disciplinary WHERE empClockNumber =?";
		 * 
		 * Query query = sessionFactory.getCurrentSession().createQuery(hql);
		 * 
		 * query.setInteger(0, delEmp);
		 * 
		 * int result = query.executeUpdate();
		 * 
		 * if (result == 0) {
		 * 
		 * log.info("records were not deleted"); } else {
		 * 
		 * log.info(delEmp + " record is delted"); }
		 */

	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void uploadEmployeeClock(CensusForm censusForm) {

		String statement = "update CensusForm set empfirstName=?,emplastName=?,costCenter=?,companyPsid=?,DOH=?,shift=?,"
				+ "eStatus=?,jobTitle=?,empEmailAddress=?,mor=?,disciplinaryDescription=?,classification2=?,compStartDate=?,"
				+ "currentHrlyRate=?,annaulRate=?,discDate=?,factoryLocation=?,hourlyOrSalary=?,hrGeneralistClockNumber=?,"
				+ "hrGeneralistFirstName=?,hrGeneralistLastName=?,hrGeneralistCostCenter=?,hrManagerClockNumber=?,hrManagerFirstName=?"
				+ ",hrManagerLastName=?,hrManagerCostCenter=?,nextYearHourlyRate=?,nextYearAnnualRate=?,minValue=?,midValue=?,maxValue=?,supervisorClockNumber=?"
				+ ", supervisorFirstName=?,supervisorLasttName=?,supervisorCostCenter=?,exemptOrNonExempt=?,payGradeId=?,reasonForCompRecord=?,"
				+ "salaryIncreaseOrNot=?,completedDate=?,hrAdmin=?,percentageOfIncrease=?"

				+ "where empClockNumber=? and annaulYear=?";

		Query query = sessionFactory.getCurrentSession().createQuery(statement);

		query.setParameter(0, censusForm.getEmpfirstName());
		query.setParameter(1, censusForm.getEmplastName());
		query.setParameter(2, censusForm.getCostCenter());
		query.setParameter(3, censusForm.getCompanyPsid());
		query.setParameter(4, censusForm.getDOH());
		query.setInteger(5, censusForm.getShift());
		query.setParameter(6, censusForm.geteStatus());
		query.setParameter(7, censusForm.getJobTitle());
		query.setParameter(8, censusForm.getEmpEmailAddress());
		query.setParameter(9, censusForm.getMor());
		query.setParameter(10, censusForm.getDisciplinaryDescription());
		query.setParameter(11, censusForm.getClassification2());
		query.setParameter(12, censusForm.getCompStartDate());
		query.setParameter(13, censusForm.getCurrentHrlyRate());
		query.setParameter(14, censusForm.getAnnaulRate());
		query.setParameter(15, censusForm.getDiscDate());
		query.setParameter(16, censusForm.getFactoryLocation());
		query.setParameter(17, censusForm.getHourlyOrSalary());
		query.setInteger(18, censusForm.getHrGeneralistClockNumber());
		query.setParameter(19, censusForm.getHrGeneralistFirstName());
		query.setParameter(20, censusForm.getHrGeneralistLastName());
		query.setParameter(21, censusForm.getHrGeneralistCostCenter());
		query.setInteger(22, censusForm.getHrManagerClockNumber());
		query.setParameter(23, censusForm.getHrManagerFirstName());
		query.setParameter(24, censusForm.getHrManagerLastName());
		query.setParameter(25, censusForm.getHrManagerCostCenter());
		query.setParameter(26, censusForm.getCurrentHrlyRate());
		query.setParameter(27, censusForm.getAnnaulRate());
		query.setParameter(28, censusForm.getMinValue());
		query.setParameter(29, censusForm.getMidValue());
		query.setParameter(30, censusForm.getMaxValue());
		query.setInteger(31, censusForm.getSupervisorClockNumber());
		query.setParameter(32, censusForm.getSupervisorFirstName());
		query.setParameter(33, censusForm.getSupervisorLasttName());
		query.setParameter(34, censusForm.getSupervisorCostCenter());
		query.setParameter(35, censusForm.getExemptOrNonExempt());
		
		query.setParameter(36, censusForm.getPayGradeId());
		query.setParameter(37, censusForm.getReasonForCompRecord());
		query.setParameter(38, censusForm.getSalaryIncreaseOrNot());
		query.setParameter(39, censusForm.getCompletedDate());
		query.setParameter(40, censusForm.getHrAdmin());
		query.setParameter(41, censusForm.getPercentageOfIncrease());
		
		
		query.setInteger(42, censusForm.getEmpClockNumber());
		query.setParameter(43, censusForm.getAnnaulYear());

		/*
		 * if (String.valueOf(censusForm.getMin()).equalsIgnoreCase("null")) {
		 * 
		 * query.setParameter(26, ""); } else { query.setParameter(26,
		 * censusForm.getMin()); } if
		 * (String.valueOf(censusForm.getMid()).equalsIgnoreCase("null")) {
		 * 
		 * query.setParameter(27, ""); } else { query.setParameter(27,
		 * censusForm.getMid()); } if
		 * (String.valueOf(censusForm.getMax()).equalsIgnoreCase("null")) {
		 * 
		 * query.setParameter(28, ""); } else { query.setParameter(28,
		 * censusForm.getMax()); }
		 */
		// query.setParameter(26,censusForm.getMin());
		// query.setParameter(27, censusForm.getMid());
		// query.setParameter(28, censusForm.getMax());
		// query.setParameter(29,censusForm.getPayGradeId());
		/*
		 * query.setParameter(30,censusForm.getReasonForCompRecord());
		 * query.setParameter(31,censusForm.getSalaryIncreaseOrNot());
		 * query.setParameter(32,censusForm.getSupervisorClockNumber());
		 * query.setParameter(33,censusForm.getSupervisorFirstName());
		 */
		/*
		 * query.setParameter(34,censusForm.getSupervisorLasttName());
		 * query.setParameter(35,censusForm.getSupervisorCostCenter());
		 * query.setParameter(36,censusForm.getExemptOrNonExempt());
		 * query.setParameter(37,censusForm.getCompletedDate());
		 * query.setParameter(38,censusForm.getStatus());
		 * query.setParameter(39,censusForm.getHrAdmin());
		 */

		/*
		 * query.setInteger(28, censusForm.getEmpClockNumber());
		 * query.setParameter(29, Converters.getCurrentYear());
		 */

		query.executeUpdate();

	}

	@Override
	public void fetchCensusForm(String clockNumber, String currentYear) {

		String statement = "from CensusForm";

	}
}
