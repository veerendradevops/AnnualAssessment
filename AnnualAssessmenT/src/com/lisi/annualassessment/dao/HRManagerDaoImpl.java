package com.lisi.annualassessment.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lisi.annualassessment.emp.form.EncryptDecryptProcess;
import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.orm.Department;
import com.lisi.annualassessment.orm.ExemptSection2;
import com.lisi.annualassessment.orm.JobKnowledgeAndSkill;

@Repository("hrManagerDao")
public class HRManagerDaoImpl implements HRManagerDao {
	@Autowired
	private SessionFactory session;

	@Override
	public List getAllHRManagerEmploeeeList() {
		Query query = session.getCurrentSession().createQuery("from CensusForm where hrManagerClockNumber=?");
		query.setParameter(0, 5951);

		return (List) query.list();
	}

	@Override
	public List<CensusForm> getHrManagerEmployees(int clockNumber, String year) {

		String statement = "from CensusForm  where empClockNumber in"
				+ " (select distinct supervisorClockNumber from CensusForm where hrManagerClockNumber=? and annaulYear=? and eStatus!=?) and annaulYear=?";
		/*
		 * String statement =
		 * "from CensusForm  where  hrManagerClockNumber=? and annaulYear=?)";
		 */
		Query query = session.getCurrentSession().createQuery(statement);

		// query.setString(0, empStatus);
		query.setInteger(0, clockNumber);
		query.setString(1, year);
		query.setString(2, "Terminated");
		query.setString(3, year);

		return (List<CensusForm>) query.list();
	}

	@Override
	public List<CensusForm> getSupervisorEmployee(int clock, String currentYear, String role, String loginUser) {

		System.out.println("fetch census");
		String statement = "from CensusForm where supervisorClockNumber=? and annaulYear=? and eStatus!=? and classification2 !=? and "
				+ role + "=?";

		Query query = session.getCurrentSession().createQuery(statement);

		query.setInteger(0, clock);
		query.setString(1, currentYear.trim());
		query.setString(2, "Terminated");
		query.setString(3, "E - Executive");
		query.setString(4, loginUser.trim());

		return (List<CensusForm>) query.list();
	}

	@Override
	public List<CensusForm> getHRGeneralistEmployee(int clock, String currentYear) {

		System.out.println("hr generalist ");
		System.out.println(clock);
		String statement = "from CensusForm  where empClockNumber in"
				+ " (select distinct supervisorClockNumber from CensusForm where hrGeneralistClockNumber=? and annaulYear=? and eStatus!=?) and annaulYear=?";
		/*
		 * String statement =
		 * "from CensusForm  where hrGeneralistClockNumber=? and annaulYear=?)";
		 */

		Query query = session.getCurrentSession().createQuery(statement);

		// query.setString(0, empStatus);
		query.setInteger(0, clock);
		query.setString(1, currentYear);
		query.setString(2, "Terminated");
		query.setString(3, currentYear);

		return (List<CensusForm>) query.list();
	}

	@Override
	public List<CensusForm> getHRAdminEmployee(int clock, String currentYear) {

		String statement = "from CensusForm  where empClockNumber in"
				+ " (select distinct supervisorClockNumber from CensusForm where hrAdmin=? and annaulYear=?  and eStatus!=?) and annaulYear=?";

		Query query = session.getCurrentSession().createQuery(statement);

		// query.setString(0, empStatus);
		query.setInteger(0, clock);
		query.setString(1, currentYear);
		query.setString(2, "Terminated");
		query.setString(3, currentYear);

		return (List<CensusForm>) query.list();

	}

	@Override
	public List<CensusForm> getHrEmployeeView(int clockID, String currentYear, String status, String role) {

		String statement = "from CensusForm where " + role
				+ " =? and annaulYear = ? and status = ? and eStatus!=? and annaulYear=?";

		Query query = session.getCurrentSession().createQuery(statement);

		query.setInteger(0, clockID);
		query.setString(1, currentYear);
		query.setString(2, status);
		query.setString(3, "Terminated");
		query.setString(4, currentYear);

		return (List<CensusForm>) query.list();
	}

	@Override
	public String[] gethourlyRate(String costCenter, String year) {

		double annualRate = 0.00;
		double percentageIncrease = 0.00;
		double nextAnnualRate = 0.00;
		String[] summaryValues = new String[3];
		String statement = "from CensusForm where costCenter=? and annaulRate is not NULL";

		Query query = session.getCurrentSession().createQuery(statement);
		query.setParameter(0, costCenter);

		List<CensusForm> object = query.list();

		for (CensusForm census : object) {

			if (census.getEmpClockNumber() == 22620) {

			}

			System.out.println("GethourlyRate first condition roate for -----------------------------------");
			System.out.println(census.getCostCenter());
			if ((!String.valueOf(census.getAnnaulRate()).equalsIgnoreCase("null"))
					&& (!census.getAnnaulRate().isEmpty())) {
				String annualRate_Decrypted = census.getAnnaulRate();
				String annualRate_Decrypt = EncryptDecryptProcess.decryptTechnique(annualRate_Decrypted);
				System.out.println("annualRate_Decrypt::::::::::   " + annualRate_Decrypt.trim());
				annualRate += Double.parseDouble(annualRate_Decrypt);
			}
			if ((!String.valueOf(census.getPercentageOfIncrease()).equalsIgnoreCase("null"))
					&& (!census.getPercentageOfIncrease().isEmpty())) {
				percentageIncrease += Double.parseDouble(census.getPercentageOfIncrease());
			}

			if (census.getNextYearAnnualRate() != null && !census.getNextYearAnnualRate().isEmpty()) {
				System.out.println("getNextYearAnnualRate null ::::::::::  else else");
				String annualRate_Decrypted = census.getAnnaulRate().trim();
				String annualRate_Decrypt = EncryptDecryptProcess.decryptTechnique(annualRate_Decrypted);
				System.out.println("getNextYearAnnualRate null :::::::::: " + annualRate_Decrypt);
				nextAnnualRate += Double.parseDouble(annualRate_Decrypt);
			}
		}
		summaryValues[0] = String.valueOf(annualRate);
		summaryValues[1] = String.valueOf(percentageIncrease);
		summaryValues[2] = String.valueOf(nextAnnualRate);

		double percentage = (((Double.parseDouble(summaryValues[2]) - Double.parseDouble(summaryValues[0])))
				/ Double.parseDouble(summaryValues[0]) * 100);
		System.out.println("percentage First condition::::::::::::::    " + percentage);
		String float_percentage = String.valueOf(percentage);

		String result = float_percentage.replaceAll("[-+^:,]", "");
		System.out.println("Result First condition::::::::::::::   " + result);

		summaryValues[1] = String.valueOf(result);

		if ((String.valueOf(percentage).equalsIgnoreCase("-Infinity")) || (String.valueOf(percentage).isEmpty())

				|| (String.valueOf(percentage).equalsIgnoreCase("NaN"))
				|| (String.valueOf(percentage).equalsIgnoreCase("NaN%"))) {
			System.out.println("infinite loop  " + summaryValues[1]);
			summaryValues[1] = "0.00";

		}

		return summaryValues;

	}

	@SuppressWarnings("unchecked")
	public List<Department> getAllDepartments() {
		String statement = "from Department";
		Query query = session.getCurrentSession().createQuery(statement);
		return (List<Department>) query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CensusForm> getCensusFormAnnualYear(String year, String clockNumber, String role) {

		// String statement = "from CensusForm where annaulYear=" + year + " and
		// " + role + "=" + clockNumber + " and classification2 not like
		// '%Executive%'";
		String statement = "from CensusForm where annaulYear=" + year + " and " + role + "=" + clockNumber
				+ " and eStatus!='Terminated' and classification2 not like '%Executive%'";
		Query query = session.getCurrentSession().createQuery(statement);

		// query.setParameter(0, clockNumber);
		// query.setParameter(1, role);
		return (List<CensusForm>) query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CensusForm> getCensusFormEmpShift(List<Integer> empShift, String year, String clockNumber,
			String role) {
		String statement = "from CensusForm where shift in (:empShifts) and annaulYear=" + year + " and " + role + "="
				+ clockNumber + " and classification2 not like '%Executive%'";
		Query query = session.getCurrentSession().createQuery(statement);
		query.setParameterList("empShifts", empShift);
		return (List<CensusForm>) query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CensusForm> getCensusFormFactoryLocationAndEmpShift(List<String> factoryLocation,
			List<Integer> empShift, String year, String clockNumber, String role) {
		// String statement = "from CensusForm where factoryLocation in
		// (:factoryLocations) and shift in (:empShifts) and annaulYear="
		// + year + " and " + role + "=" + clockNumber + " and classification2
		// not like '%Executive%'";
		String statement = "from CensusForm where factoryLocation in (:factoryLocations) and shift in (:empShifts) and annaulYear="
				+ year + " and " + role + "=" + clockNumber
				+ " and eStatus!='Terminated' and classification2 not like '%Executive%'";
		Query query = session.getCurrentSession().createQuery(statement);
		query.setParameterList("factoryLocations", factoryLocation);
		query.setParameterList("empShifts", empShift);
		return (List<CensusForm>) query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CensusForm> getCensusFormFactoryLocation(List<String> factoryLocation, String year, String clockNumber,
			String role) {
		// String statement = "from CensusForm where factoryLocation in
		// (:factoryLocations) and annaulYear=" + year
		// + " and " + role + "=" + clockNumber + " and classification2 not like
		// '%Executive%'";
		String statement = "from CensusForm where factoryLocation in (:factoryLocations) and annaulYear=" + year
				+ " and " + role + "=" + clockNumber
				+ " and eStatus!='Terminated' and classification2 not like '%Executive%'";
		Query query = session.getCurrentSession().createQuery(statement);
		query.setParameterList("factoryLocations", factoryLocation);

		return (List<CensusForm>) query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ExemptSection2> getAllExemptSection2Data(String annualYear) {
		String statement = "from ExemptSection2 where appraisalYear=" + annualYear + "";
		Query query = session.getCurrentSession().createQuery(statement);
		return (List<ExemptSection2>) query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<JobKnowledgeAndSkill> getAllNonExemptSection3Data(String annualYear) {
		String statement = "from JobKnowledgeAndSkill where annualYear=" + annualYear + "";
		Query query = session.getCurrentSession().createQuery(statement);
		return (List<JobKnowledgeAndSkill>) query.list();
	}

	@Override
	public String[] gethourlyRate(List<String> factoryLocation, String costCenter, List<Integer> shift, String year) {
		double annualRate = 0.00;
		double percentageIncrease = 0.00;
		double nextAnnualRate = 0.00;
		String[] summaryValues = new String[3];
		String statement = "from CensusForm where costCenter=? and annaulRate is not NULL and shift in (:empShifts) and factoryLocation in (:factoryLocations) and classification2 not like '%Executive%' and eStatus!='Terminated' ";

		Query query = session.getCurrentSession().createQuery(statement);
		query.setParameter(0, costCenter);
		query.setParameterList("empShifts", shift);
		query.setParameterList("factoryLocations", factoryLocation);

		List<CensusForm> object = query.list();

		for (CensusForm census : object) {
			System.out.println(" Second Condition Else roate for -----------------------------------");
			System.out.println(census.getCostCenter());
			if (!census.getAnnaulRate().equalsIgnoreCase("null") && !census.getAnnaulRate().isEmpty()) {

				String annualRate_Decrypt = EncryptDecryptProcess.decryptTechnique(census.getAnnaulRate().trim());
				System.out
						.println("Second condition ::::::::::  current annualRate_Decrypt ::::: " + annualRate_Decrypt);
				annualRate += Double.parseDouble(annualRate_Decrypt);
				// System.out.println("Second condition :::::::::: current
				// annualRate_Decrypted ::::: "+annualRate);
			}
			if (!census.getPercentageOfIncrease().equalsIgnoreCase("null")
					&& !census.getPercentageOfIncrease().isEmpty()) {
				System.out.println("Second condition ::::::::::  current census.getPercentageOfIncrease() ::::: "
						+ census.getPercentageOfIncrease());
				percentageIncrease += Double.parseDouble(census.getPercentageOfIncrease().trim());
				// System.out.println("Second condition :::::::::: current
				// getPercentageOfIncrease ::::: "+percentageIncrease);
			} else {
				percentageIncrease += Double.parseDouble("0.00");
			}
			if (!census.getNextYearAnnualRate().equalsIgnoreCase("null") && !census.getNextYearAnnualRate().isEmpty()) {

				String nextAnnlRate = EncryptDecryptProcess.decryptTechnique(census.getNextYearAnnualRate().trim());
				System.out.println("Second condition ::::::::::  nextAnnualRate nextAnnualRate ::::: " + nextAnnlRate);
				// nextAnnualRate += Double.parseDouble(nextAnnualRate);
				nextAnnualRate += Double.parseDouble(nextAnnlRate);
				// System.out.println("Second condition ::::::::::
				// nextAnnualRate ::::: "+nextAnnualRate);

			}
		}
		summaryValues[0] = String.valueOf(annualRate);
		summaryValues[1] = String.valueOf(percentageIncrease);
		summaryValues[2] = String.valueOf(nextAnnualRate);
		double percentage = ((Double.parseDouble(summaryValues[2]) - Double.parseDouble(summaryValues[0]))
				/ Double.parseDouble(summaryValues[0]));
		percentage = percentage * 100;
		// System.out.println("Percentage Result Final ::: " + percentage);

		String float_percentage = String.valueOf(percentage);
		String result = float_percentage.replaceAll("[-+^:,]", "");
		/* int index=float_percentage.indexOf("-"); */
		System.out.println("Percentage Result Final:::::::::: " + result);
		summaryValues[1] = String.valueOf(result);

		System.out.println("Percentage in Impl Class :::: " + summaryValues[1]);
		if ((String.valueOf(percentage).equalsIgnoreCase("-Infinity")) || (String.valueOf(percentage).isEmpty())

				|| (String.valueOf(percentage).equalsIgnoreCase("NaN"))
				|| (String.valueOf(percentage).equalsIgnoreCase("NaN%"))) {
			System.out.println("Enter into infine loop" + summaryValues[1]);
			summaryValues[1] = "0.00";

		}

		return summaryValues;

	}

	@Override
	public List<CensusForm> getSupervisorEmployee(int clock, String currentYear) {
		String statement = "from CensusForm where supervisorClockNumber=? and annaulYear=? and eStatus!=? and classification2 !=?";

		Query query = session.getCurrentSession().createQuery(statement);

		query.setInteger(0, clock);
		query.setString(1, currentYear.trim());
		query.setString(2, "Terminated");
		query.setString(3, "E - Executive");

		return (List<CensusForm>) query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CensusForm> getCensusFormFactoryLocationShift(String year, String clockNumber, String role) {

		System.out.println(" :::: Enter getCensusFormFactoryLocationShift DAO :::");
		System.out.println("" + year + " ::: " + clockNumber + " ::: " + role);

		/*
		 * Role based Factory location and Shift
		 */
		// String statement = "from CensusForm where annaulYear=" + year + " and
		// " + role + "="+ clockNumber + " and classification2 not like
		// '%Executive%'";
		String statement = "from CensusForm where annaulYear=" + year + " and " + role + "=" + clockNumber
				+ " and eStatus!='Terminated' and classification2 not like '%Executive%'";
		Query query = session.getCurrentSession().createQuery(statement);
		// query.setParameterList("empShifts", empShift);
		return (List<CensusForm>) query.list();
	}

	@Override
	public List getYearsInDatabase(String loginClock) {
		String statement = "from CensusForm cf where cf.empClockNumber=? ORDER BY cf.annaulYear desc";
		Query query = session.getCurrentSession().createQuery(statement);
		query.setString(0, loginClock);
		return (List<CensusForm>) query.list();
	}
	/*
	 * Added by Sriramulu.Kanithi for Search Based on name ,Jobtitle,ClockId
	 * 
	 * @see com.lisi.annualassessment.dao.HRManagerDao#getSearchClockId(int,
	 * java.lang.String, java.lang.String, java.lang.String)
	 */

	@Override
	public List<CensusForm> getSearchClockId(int clockNumber, String role, String year, String filterContent) {

		System.out.println("getSearchClockId Method :: " + clockNumber + " :: " + " ::: " + role + " ::" + year);
		Query query = null;
		try {
			String statement = "from CensusForm where annaulYear=" + year + " and " + "empClockNumber like '%"
					+ filterContent + "%' and empClockNumber in"
					+ " ((select distinct supervisorClockNumber from CensusForm where " + role
					+ "=? and annaulYear=?  and eStatus!=?)) and annaulYear=?";
			System.out.println("statement :: " + statement);
			query = session.getCurrentSession().createQuery(statement);
			System.out.println("query :: " + query);
			query.setInteger(0, clockNumber);
			query.setString(1, year);
			query.setString(2, "Terminated");
			query.setString(3, year);

		}

		catch (Exception exception) {
			System.out.println("exception is :: " + exception.getMessage());

		}
		return (List<CensusForm>) query.list();

	}

	@Override
	public List<CensusForm> getSearchJobTitle(int clockNumber, String role, String year, String filterContent) {

		System.out.println("getSearchJobTitle Method :: " + clockNumber + " :: " + " ::: " + role + " ::" + year);

		// TODO Auto-generated method stub
		String statement = "from CensusForm where annaulYear=" + year + " and " + "jobTitle like '%" + filterContent
				+ "%' and empClockNumber in" + " ((select distinct supervisorClockNumber from CensusForm where " + role
				+ "=? and annaulYear=?  and eStatus!=?)) and annaulYear=?";

		Query query = session.getCurrentSession().createQuery(statement);
		query.setInteger(0, clockNumber);
		query.setString(1, year);
		query.setString(2, "Terminated");
		query.setString(3, year);

		return (List<CensusForm>) query.list();
	}

	@Override
	public List<CensusForm> getSearchName(int clockNumber, String role, String year, String filterContent) {

		System.out.println("getSearchName Method  :: " + clockNumber + " :: " + " ::: " + role + " ::" + year);

		String statement = "from CensusForm where annaulYear=" + year + " and " + "empfirstName like '%" + filterContent
				+ "%'  or emplastName like '%" + filterContent + "%' and empClockNumber in"
				+ " ((select distinct supervisorClockNumber from CensusForm where " + role
				+ "=? and annaulYear=?  and eStatus!=?)) and annaulYear=?";

		Query query = session.getCurrentSession().createQuery(statement);
		query.setInteger(0, clockNumber);
		query.setString(1, year);
		query.setString(2, "Terminated");
		query.setString(3, year);
		return (List<CensusForm>) query.list();
	}

}
