package com.lisi.annaulAssessment.Emp.Form;

import java.text.ParseException;
import java.util.Set;

import javax.persistence.Column;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.lisi.annaualAssessment.orm.CensusForm;
import com.lisi.annaualAssessment.orm.Disciplinary;
import com.lisi.annaualAssessment.orm.Hierarchy;
import com.lisi.annaulAssessment.controller.CensusFileUploadController;
import com.lisi.annaulAssessment.controller.ExemptEmployeeController;
import com.lisi.annaulAssessment.pojo.XlsxHeader;
import com.lisi.annaulAssessment.service.UploadFormService;
import com.lisi.annaulAssessment.util.Converters;

import net.sf.jasperreports.engine.export.EmptyGridCell;

public class XLSXFormValidation {

	private static final Logger log = Logger.getLogger(XLSXFormValidation.class);

	/*
	 * @Autowired private CensusFileUploadController censusFileUploadController;
	 */

	/**
	 * @param args
	 */

	// private static String clockNumber;

	public static CensusForm setCensusFormFields(CensusForm censusForm, Hierarchy hierarchy, Disciplinary disciplinary,
			String columnName, String columnValue) {

		System.out.println(columnName + " name  " + columnValue);

		/*
		 * if(columnName.trim().equals("")){
		 * 
		 * return censusForm; }
		 * 
		 */
		if (String.valueOf(columnValue.trim()).equalsIgnoreCase("null")
				|| String.valueOf(columnValue.trim()).isEmpty()) {

			return censusForm;
		}

		if (String.valueOf(columnName.trim()).equalsIgnoreCase("null") || String.valueOf(columnName.trim()).isEmpty()) {

			return censusForm;
		}

		if (XlsxHeader.EmpClockNumber.getValue().equalsIgnoreCase(columnName)) {

			log.info("emp clock");

			String clockNumber = replaceDotZeros(columnValue.trim());

			log.info(clockNumber);
			if (String.valueOf(clockNumber).length() > 5) {

				CensusFileUploadController.cellOneErrorMessage = clockNumber;
				CensusFileUploadController.cellTwoErrorMessage += "employee clock number exceeded;";

				return null;
			}
			CensusFileUploadController.cellOneErrorMessage = clockNumber;

			censusForm.setEmpClockNumber(Integer.parseInt(clockNumber));
			hierarchy.setEmpClockNumber(Integer.parseInt(clockNumber));
			// disciplinary.setEmpClockNumber(Integer.parseInt(clockNumber));
			censusForm.setHierarchy(hierarchy);
			// censusForm.setDisciplinary(disciplinary);

			return censusForm;
		} else if (XlsxHeader.emplastName.getValue().equalsIgnoreCase(columnName)) {

			if (columnValue.length() > 30) {
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "employee last name is  exceeded more than thirty characters;";
				return null;
			}
			CensusFileUploadController.lastName = columnValue.trim();
			log.info("emp l name");
			censusForm.setEmplastName(columnValue.trim());
			return censusForm;
		} else if (XlsxHeader.empfirstName.getValue().equalsIgnoreCase(columnName)) {

			if (columnValue.length() > 30) {

				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "employee first name is  exceeded more than thirty characters;";
				return null;
			}

			log.info("emp f name");
			censusForm.setEmpfirstName(columnValue.trim());

			CensusFileUploadController.firstName = columnValue.trim();

			hierarchy.setEmployeeADName(columnValue.substring(0, 1).trim() + "" + censusForm.getEmplastName());

			censusForm.setHierarchy(hierarchy);
			return censusForm;
		} else if (XlsxHeader.companyPSID.getValue().equalsIgnoreCase(columnName)) { // PSID

			if (columnValue.length() > 3) {

				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "COMPANY PSID is  exceeded more than three characters;";
				return null;
			}
			log.info("psid");
			censusForm.setCompanyPsid(columnValue);
			return censusForm;
		} /*
			 * else if
			 * (XlsxHeader.company.getValue().equalsIgnoreCase(columnName)) {
			 * 
			 * censusForm.setCompany(columnValue); return censusForm;
			 * 
			 * }
			 */
		else if (XlsxHeader.EStatus.getValue().equalsIgnoreCase(columnName)) {

			if (columnValue.length() > 20) {

				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "EStatus is  exceeded more than 20 characters;";
				return null;
			}
			if (columnValue.contains("Active") || columnValue.contains("Leave of Absence")
					|| columnValue.contains("Terminated")) {

				censusForm.seteStatus(columnValue);
				return censusForm;
			}

			log.info("e status");
			// censusForm.seteStatus(columnValue);

		} else if (XlsxHeader.factoryLocation.getValue().equalsIgnoreCase(columnName)) {

			log.info("factory loc");
			/*
			 * if (columnValue.length() > 40) {
			 * 
			 * CensusFileUploadController.cellOneErrorMessage=String.valueOf(
			 * censusForm.getEmpClockNumber());
			 * CensusFileUploadController.cellTwoErrorMessage=
			 * "factoryLocation is  exceeded more than 40 characters"; return
			 * null; }
			 */
			censusForm.setFactoryLocation(columnValue);
			return censusForm;
			/*
			 * if ("VWB".equalsIgnoreCase(censusForm.getCompanyPsid())) {
			 * log.info("VWB"); censusForm.setFactoryLocation(columnValue);
			 * 
			 * return censusForm; } else if (columnValue.isEmpty()) {
			 * 
			 * return null;
			 * 
			 * } else { censusForm.setFactoryLocation(columnValue); return
			 * censusForm; }
			 */

		} else if (XlsxHeader.JobTitle.getValue().equalsIgnoreCase(columnName)) {

			log.info("job title");
			if (columnValue.length() > 60) {
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "JobTitle is  exceeded more than 60 characters;";
				return null;
			}

			censusForm.setJobTitle(columnValue);
			return censusForm;
		} else if (XlsxHeader.shift.getValue().equalsIgnoreCase(columnName)) {

			log.info("shift");
			String shiftValue = replaceDotZeros(columnValue.trim());
			if (shiftValue.length() > 1) {
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "shift is  exceeded more than 1 characters;";
				return null;
			}

			censusForm.setShift(Integer.parseInt(shiftValue));

			return censusForm;

		} else if (XlsxHeader.costCenter.getValue().equalsIgnoreCase(columnName)) {

			log.info("cost center");
			if (columnValue.length() > 7) {
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "Cost Center is  exceeded more than 7 characters;";
				return null;
			}

			censusForm.setCostCenter(columnValue);
			return censusForm;
		} else if (XlsxHeader.dateOfHire.getValue().equalsIgnoreCase(columnName)) {

			if (columnValue.isEmpty()) {
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "dateOfHire is  exceeded more than 1 characters;";
				return null;
			}
			log.info("doh");
			try {
				censusForm.setDOH(Converters.getParsedDate(columnValue));
				return censusForm;
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// censusForm.setDOH(columnValue);
		} else if (XlsxHeader.classification.getValue().equals(columnName)) {

			log.info("classification");
			if (columnValue.length() > 1) {
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "classification is  exceeded more than 1 characters;";
				return null;
			}

			if (columnValue.equalsIgnoreCase("H")) {

				censusForm.setExemptOrNonExempt("non-Exempt");
			} else if (columnValue.equalsIgnoreCase("S")) {
				log.info("exempt");
				censusForm.setExemptOrNonExempt("exempt");
			} else {
				log.info("else");
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "classification is empty;";
				return null;
			}
			censusForm.setHourlyOrSalary(columnValue); // Hourly or Salary...

			return censusForm;

		} else if (XlsxHeader.emailAddress.getValue().equals(columnName)) {

			log.info("email address = " + censusForm.getExemptOrNonExempt());
			if (censusForm.getHourlyOrSalary().equalsIgnoreCase("S")) {

				log.info("s " + columnValue);
				if (columnValue.contains("@LISI-AEROSPACE.COM")
						|| columnValue.equalsIgnoreCase("@lisi-aerospace.com")) {

					log.info("s if");
					censusForm.setEmpEmailAddress(columnValue);
					return censusForm;
				} else {
					censusForm.setEmpEmailAddress(columnValue);
					return censusForm;

				}

			} else if (censusForm.getHourlyOrSalary().equalsIgnoreCase("H")) {
				log.info("h");
				censusForm.setEmpEmailAddress(columnValue);
				return censusForm;
			} else {
				log.info("neither of the condition is satisfied...");
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "email address does not belong to H OR S;";

				return null;

			}

		}

		/*
		 * 
		 * supervisor form details....
		 */
		else if (XlsxHeader.supervisorClockNumber.getValue().equals(columnName)) {

			log.info("supervisor clock num");
			String clockNumber = replaceDotZeros(columnValue.trim());
			if (clockNumber.length() > 5) {
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "supervisorClockNumber is wrong;";
				return null;
			}
			boolean status = false;
			Set<String> empClock = CensusFileUploadController.employee;
			status = empClock.contains(String.valueOf(clockNumber));

			System.out.println("status of the supervisor : " + status);
			if (status == false) {

				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage = "supervisorClockNumber is not an employee;";
				return null;
			}

			censusForm.setSupervisorClockNumber(Integer.parseInt(clockNumber));

			hierarchy.setSupervisorClockNumber(Integer.parseInt(clockNumber));

			censusForm.setHierarchy(hierarchy);

			return censusForm;
		} else if (XlsxHeader.supervisorFName.getValue().equals(columnName)) {

			log.info("super f name");
			if (columnValue.length() > 30) {
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "supervisorfname is more than 30 chars;";
				return null;
			}

			censusForm.setSupervisorFirstName(columnValue.trim());
			return censusForm;

		} else if (XlsxHeader.supervisorLName.getValue().equalsIgnoreCase(columnName.trim())) {

			log.info("supervisor l name");
			if (columnValue.length() > 30) {

				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "supervisorLastname is more than 30 chars;";
				return null;
			}

			censusForm.setSupervisorLasttName(columnValue.trim());
			return censusForm;

		} else if (XlsxHeader.supervisorCostCenter.getValue().equals(columnName)) {

			log.info("super cost center");

			censusForm.setSupervisorCostCenter(columnValue);
			return censusForm;
		}

		else if (XlsxHeader.HRManagerClock.getValue().equalsIgnoreCase(columnName.trim())) {

			log.info("hr manager clock");
			String clockNumber = replaceDotZeros(columnValue.trim());

			if (clockNumber.length() > 5) {
				log.info("range extended");

				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "Hr Manager is more than 5 chars;";
				return null;
			}
			boolean status = false;
			Set<String> empClock = CensusFileUploadController.employee;
			status = empClock.contains(String.valueOf(clockNumber));

			log.info(status);
			if (status == false) {

				log.info("not a employee");
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "Hr Manager is not an employee;";
				return null;
			}

			censusForm.setHrManagerClockNumber(Integer.parseInt(clockNumber));
			hierarchy.setHrManagerClockNumber(Integer.parseInt(clockNumber));
			censusForm.setHierarchy(hierarchy);
			log.info("hr manager clock");
			log.info(censusForm);
			return censusForm;
		} else if (XlsxHeader.HRManagerFname.getValue().equalsIgnoreCase(columnName)) {

			if (columnValue.trim().length() > 30) {
				CensusFileUploadController.cellOneErrorMessage = String.valueOf(censusForm.getEmpClockNumber());
				CensusFileUploadController.cellTwoErrorMessage += "Hr Manager first name is more than 30 chars;";

				return null;
			}
			censusForm.setHrManagerFirstName(columnValue.trim());

			return censusForm;
		} else if (XlsxHeader.HRManagerLname.getValue().equalsIgnoreCase(columnName)) {

			if (columnValue.trim().length() > 30) {

				CensusFileUploadController.cellOneErrorMessage = String.valueOf(censusForm.getEmpClockNumber());
				CensusFileUploadController.cellTwoErrorMessage += "Hr Manager last name is more than 30 chars;";
				return null;
			}
			censusForm.setHrManagerLastName(columnValue.trim());
			return censusForm;

		} else if (XlsxHeader.HrManagerCostCenter.getValue().equalsIgnoreCase(columnName)) {
			/*
			 * if (columnValue.trim().length() > 7) {
			 * 
			 * return null; }
			 */

			censusForm.setHrManagerCostCenter(columnValue);
			return censusForm;

		}

		else if (XlsxHeader.HRGeneralistClock.getValue().equalsIgnoreCase(columnName)) {
			String clockNumber = replaceDotZeros(columnValue.trim());

			if (clockNumber.trim().length() > 5) {

				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "Hr Generalist clock name is more than 5 chars;";
				return null;
			}
			// log.info("sup : " + columnValue);
			boolean status = false;
			Set<String> empClock = CensusFileUploadController.employee;
			status = empClock.contains(String.valueOf(clockNumber));

			if (status == false) {

				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "HRGeneralist is not an employee;";
				return null;
			}

			censusForm.setHrGeneralistClockNumber(Integer.parseInt(clockNumber));
			hierarchy.setHrGeneralistClockNumber(Integer.parseInt(clockNumber));
			censusForm.setHierarchy(hierarchy);

			return censusForm;
		} else if (XlsxHeader.HRGeneralistFName.getValue().equalsIgnoreCase(columnName)) {
			if (columnValue.trim().length() > 30) {
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage = "Hr Manager last name is more than 30 chars;";
				return null;
			}

			censusForm.setHrGeneralistFirstName(columnValue.trim());
			return censusForm;
		} else if (XlsxHeader.HRGeneralistLname.getValue().equalsIgnoreCase(columnName)) {
			if (columnValue.trim().length() > 30) {
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "Hr Manager first name is more than 30 chars;";
				return null;
			}
			censusForm.setHrGeneralistLastName(columnValue.trim());
			return censusForm;
		} else if (XlsxHeader.HrGenerlistCostCenter.getValue().equalsIgnoreCase(columnName)) {
			/*
			 * if (columnValue.trim().length() > 7) {
			 * 
			 * return null; }
			 */

			censusForm.setHrGeneralistCostCenter(columnValue);
			return censusForm;
		} else if (XlsxHeader.mor.getValue().equalsIgnoreCase(columnName)) {

			/*
			 * if (columnValue.trim().length() > 50) {
			 * 
			 * return null; }
			 */
			censusForm.setMor(columnValue);
			return censusForm;
		}

		else if (XlsxHeader.discDate.getValue().equalsIgnoreCase(columnName)) {

			// disc date data.......
			try {
				if (columnValue.isEmpty()) {
					/*
					 * CensusFileUploadController.cellOneErrorMessage =
					 * String.valueOf(CensusFileUploadController.
					 * cellOneErrorMessage);
					 * CensusFileUploadController.cellTwoErrorMessage +=
					 * "discDate should not be empty;";
					 */
					return censusForm;
				}
				censusForm.setDiscDate(Converters.getParsedDate(columnValue));
				// censusForm.setDisciplinary(disciplinary);

				return censusForm;
			} catch (ParseException e) {

				e.printStackTrace();
				return null;
			}
		} else if (XlsxHeader.disciplinaryDescription.getValue().equalsIgnoreCase(columnName)) {

			System.out.println("disciplinaryDescription " + columnValue);
			/*
			 * if (columnValue.trim().length() > 100) {
			 * 
			 * return null; }
			 */
			if (columnValue.isEmpty()) {
				System.out.println("its empty");

				censusForm.setDisciplinaryDescription(" ");
				return censusForm;
			} else if (!columnValue.isEmpty()) {
				censusForm.setDisciplinaryDescription(columnValue);
				return censusForm;

			}
		}

		else if (XlsxHeader.increaseYN.getValue().contains(columnName.trim())) {

			if (columnValue.trim().equalsIgnoreCase("Y")) {
				log.info(censusForm.getEmpClockNumber());
				log.info(columnValue);
				log.info("yes for increase");
				// censusForm.setHourlyOrSalary(columnValue);
				censusForm.setSalaryIncreaseOrNot(columnValue);
				return censusForm;

			} else if (columnValue.trim().equalsIgnoreCase("N")) {

				System.out.println("no condition");

				System.out.println(censusForm.getDiscDate());

				/*
				 * if (censusForm.getDiscDate() == null &&
				 * censusForm.getDisciplinaryDescription().isEmpty()) {
				 * CensusFileUploadController.cellOneErrorMessage = String
				 * .valueOf(CensusFileUploadController.cellOneErrorMessage);
				 * CensusFileUploadController.cellTwoErrorMessage +=
				 * "increase condition is not satisfied;";
				 * 
				 * return null; } else {
				 */
				// censusForm.setHourlyOrSalary(columnValue);
				censusForm.setSalaryIncreaseOrNot(columnValue);
				return censusForm;
				// }
			} else if (columnValue.trim().isEmpty()) {
				log.info("empty " + censusForm.getEmpClockNumber());
				log.info("empty : " + columnValue);
				log.info("increase condition is shit");
				censusForm.setSalaryIncreaseOrNot(" ");
				// CensusFileUploadController.cellOneErrorMessage = String
				// .valueOf(CensusFileUploadController.cellOneErrorMessage);
				// CensusFileUploadController.cellTwoErrorMessage += "increase
				// condition is not satisfied;";
				// return null;
				return censusForm;
			}/*else if(columnValue.trim().equalsIgnoreCase("y") || columnValue.trim().equalsIgnoreCase("N")){
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "employee salary status is wrong.";
				return null;
				
			}*/

		} else if (XlsxHeader.JobAttribute.getValue().equalsIgnoreCase(columnName)) {

			log.info("jboAttribute");

			if (columnValue.substring(0, 1).trim().equalsIgnoreCase("e") || columnValue.contains("Executive")) {

				// censusForm.setHourlyOrSalary(" ");
				censusForm.setClassification2(columnValue);

			} else {
				
				/*if(String.valueOf(censusForm.getSalaryIncreaseOrNot()).isEmpty() || 
						String.valueOf(censusForm.getSalaryIncreaseOrNot()).equalsIgnoreCase("null")){
					
					CensusFileUploadController.cellOneErrorMessage = String
							.valueOf(CensusFileUploadController.cellOneErrorMessage);
					CensusFileUploadController.cellTwoErrorMessage += "Salary is blank.";
					return null;
				}*/
				
				if(censusForm.getMin().trim().length()==0){
					CensusFileUploadController.cellOneErrorMessage = String
							.valueOf(CensusFileUploadController.cellOneErrorMessage);
					CensusFileUploadController.cellTwoErrorMessage += "minimum salary is not numeric.";
					return null;
					
				}
				censusForm.setClassification2(columnValue);
				/*
				 * if(censusForm.getHourlyOrSalary().isEmpty()){
				 * CensusFileUploadController.cellOneErrorMessage = String
				 * .valueOf(CensusFileUploadController.cellOneErrorMessage);
				 * CensusFileUploadController.cellTwoErrorMessage +=
				 * "increase condition is not satisfied;"; return null;
				 * 
				 * }
				 */
			}
			

			return censusForm;
		}

		else if (XlsxHeader.reasonForCompRecord.getValue().equalsIgnoreCase(columnName)) {

			censusForm.setReasonForCompRecord(columnValue);
			return censusForm;
		} else if (XlsxHeader.startDate.getValue().equalsIgnoreCase(columnName)) {

			try {

				/*if (columnValue.isEmpty()) {
					CensusFileUploadController.cellOneErrorMessage = String
							.valueOf(CensusFileUploadController.cellOneErrorMessage);
					CensusFileUploadController.cellTwoErrorMessage += "Start date is empty;";
					return null;

				}*/
				censusForm.setCompStartDate(Converters.getParsedDate(columnValue));
				return censusForm;
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
		} else if (XlsxHeader.min.getValue().equalsIgnoreCase(columnName)) {

			System.out.println(columnName + " columnName");

			censusForm.setMin(columnValue);
			return censusForm;
		}

		else if (XlsxHeader.max.getValue().equalsIgnoreCase(columnName)) {

			censusForm.setMax(columnValue);
			return censusForm;
		}

		else if (XlsxHeader.mid.getValue().equalsIgnoreCase(columnName)) {

			censusForm.setMid(columnValue);
			return censusForm;
		}

		else if (XlsxHeader.payGrade.getValue().equalsIgnoreCase(columnName)) {

			censusForm.setPayGradeId(columnValue);
			return censusForm;
		}

		else if (XlsxHeader.currentHrlRate.getValue().equalsIgnoreCase(columnName)) {

			censusForm.setCurrentHrlyRate(columnValue);

			return censusForm;
		} else if (XlsxHeader.currentAnnualRate.getValue().equalsIgnoreCase(columnName)) {

			censusForm.setAnnaulRate(columnValue);

			return censusForm;
		}else{
			
			return censusForm;
		}
	/*	System.out.println("return null value");
		System.out.println(columnName + "  at the end...  " + columnValue);
		return null;*/
		return censusForm;
	}

	public static String replaceDotZeros(String columnValue) {

		String clockNumber = "";

		if (columnValue.contains(".0")) {
			clockNumber = columnValue.replace(".0", "");

			return clockNumber;
		} else if (columnValue.isEmpty()) {

			try {
				throw new Exception("clock number is missing");
			} catch (Exception e) {

				e.printStackTrace();
			}
		} else {

			clockNumber = columnValue;
		}

		return clockNumber;
	}

}
