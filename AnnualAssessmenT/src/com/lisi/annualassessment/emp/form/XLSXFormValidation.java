package com.lisi.annualassessment.emp.form;

import java.text.ParseException;
import java.util.Set;

import javax.persistence.Column;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.lisi.annualassessment.orm.CensusForm;
import com.lisi.annualassessment.orm.Disciplinary;
import com.lisi.annualassessment.orm.Hierarchy;
import com.lisi.annualassessment.controller.CensusFileUploadController;
import com.lisi.annualassessment.controller.ExemptEmployeeController;
import com.lisi.annualassessment.pojo.XlsxHeader;
import com.lisi.annualassessment.service.UploadFormService;
import com.lisi.annualassessment.util.Converters;

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
/*
			CensusFileUploadController.cellOneErrorMessage = ""+censusForm.getEmpClockNumber();
			CensusFileUploadController.cellTwoErrorMessage += ""+columnName +"is not valid";

			return null;*/
			
		//	return null;
			return censusForm;
		}

		if (String.valueOf(columnName.trim()).equalsIgnoreCase("null") || String.valueOf(columnName.trim()).isEmpty()) {

			return censusForm;
		}

		if (XlsxHeader.EmpClockNumber.getValue().equalsIgnoreCase(columnName.trim())) {

			log.info("emp clock");

			String clockNumber = replaceDotZeros(columnValue.trim());

			log.info(clockNumber);
			if (clockNumber.trim().length() > 5 || clockNumber.trim().length() == 0
					|| clockNumber.trim().length() <= 0) {

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
		} else if (XlsxHeader.emplastName.getValue().equalsIgnoreCase(columnName.trim())) {

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
		} else if (XlsxHeader.empfirstName.getValue().equalsIgnoreCase(columnName.trim())) {

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
		} else if (XlsxHeader.companyPSID.getValue().equalsIgnoreCase(columnName.trim())) { // PSID

			if (columnValue.length() > 3) {

				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "COMPANY PSID is  exceeded more than three characters;";
				return null;
			}
			log.info("psid");
			censusForm.setCompanyPsid(columnValue);
			return censusForm;
		} 
		else if (XlsxHeader.EStatus.getValue().equalsIgnoreCase(columnName.trim())) {

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
			}else{
				
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "EStatus is  not a valid one;";
				return null;
			}

			
			// censusForm.seteStatus(columnValue);

		} else if (XlsxHeader.factoryLocation.getValue().equalsIgnoreCase(columnName.trim())) {

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

		} else if (XlsxHeader.JobTitle.getValue().equalsIgnoreCase(columnName.trim())) {

			log.info("job title");
			if (columnValue.length() > 60) {
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "JobTitle is  exceeded more than 60 characters;";
				return null;
			}

			censusForm.setJobTitle(columnValue);
			return censusForm;
		} else if (XlsxHeader.shift.getValue().equalsIgnoreCase(columnName.trim())) {

			log.info("shift");
			String shiftValue = replaceDotZeros(columnValue.trim());
			if (shiftValue.length() > 1) {
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "shift is  exceeded more than 1 characters;";
				return null;
			}

			if(Integer.parseInt(shiftValue)==1 || Integer.parseInt(shiftValue)==2 || Integer.parseInt(shiftValue)==3){
			
			censusForm.setShift(Integer.parseInt(shiftValue));

			return censusForm;
			}else{
				
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "shift is not valid number";
				return null;
				
			}

		} else if (XlsxHeader.costCenter.getValue().equalsIgnoreCase(columnName.trim())) {

			log.info("cost center");
			if (columnValue.trim().length() > 7) {
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "Cost Center is  exceeded more than 7 characters;";
				return null;
			}

			censusForm.setCostCenter(columnValue);
			return censusForm;
		} else if (XlsxHeader.dateOfHire.getValue().equalsIgnoreCase(columnName.trim())) {

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
		} else if (XlsxHeader.classification.getValue().equalsIgnoreCase(columnName.trim())) {

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
				CensusFileUploadController.cellTwoErrorMessage += "classification is not a valid one;";
				return null;
			}
			censusForm.setHourlyOrSalary(columnValue); // Hourly or Salary...

			return censusForm;

		} else if (XlsxHeader.emailAddress.getValue().equalsIgnoreCase(columnName.trim())) {

			log.info("email address = " + censusForm.getExemptOrNonExempt());
			if (String.valueOf(censusForm.getHourlyOrSalary()).equalsIgnoreCase("S")) {

				log.info("s " + columnValue);
				if (columnValue.toLowerCase().contains("lisi-aerospace.com")
						|| columnValue.toLowerCase().equalsIgnoreCase("lisi-aerospace.com")) {

					log.info("s if");
					censusForm.setEmpEmailAddress(columnValue);
					return censusForm;
				} else {
					/*censusForm.setEmpEmailAddress(columnValue);
					return censusForm;*/
					CensusFileUploadController.cellOneErrorMessage = String
							.valueOf(CensusFileUploadController.cellOneErrorMessage);
					CensusFileUploadController.cellTwoErrorMessage += "Email is missing for an exempt employee";

					return null;

				}

			} else if (String.valueOf(censusForm.getHourlyOrSalary()).equalsIgnoreCase("H")) {
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
		else if (XlsxHeader.supervisorClockNumber.getValue().equalsIgnoreCase(columnName.trim())) {

			log.info("supervisor clock num");

			if (String.valueOf(columnValue).equalsIgnoreCase("null")) {
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "supervisorClockNumber is wrong;";
				return null;

			}

			String clockNumber = replaceDotZeros(columnValue.trim());
			log.info(clockNumber + " " + censusForm.getEmpClockNumber());

			if (clockNumber.trim().length() <= 0 || clockNumber.trim().length() == 0
					|| clockNumber.trim().length() > 5) {
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

				if (clockNumber.equalsIgnoreCase("99999")) {

					System.out.println("super admin roles.");
				} else {

					CensusFileUploadController.cellOneErrorMessage = String
							.valueOf(CensusFileUploadController.cellOneErrorMessage);
					CensusFileUploadController.cellTwoErrorMessage = "supervisorClockNumber is not an employee;";
					return null;
				}
			}

			censusForm.setSupervisorClockNumber(Integer.parseInt(clockNumber));

			hierarchy.setSupervisorClockNumber(Integer.parseInt(clockNumber));

			censusForm.setHierarchy(hierarchy);

			return censusForm;
		} else if (XlsxHeader.supervisorFName.getValue().equalsIgnoreCase(columnName.trim())) {

			log.info("super f name");
			if (columnValue.length() > 30) {
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "supervisorfirstname is more than 30 chars;";
				return null;
			}

			censusForm.setSupervisorFirstName(columnValue.trim());
			return censusForm;

		} else if (XlsxHeader.supervisorLName.getValue().equalsIgnoreCase(columnName.trim().trim())) {

			log.info("supervisor l name");
			if (columnValue.length() > 30) {

				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "supervisorLastname is more than 30 chars;";
				return null;
			}

			censusForm.setSupervisorLasttName(columnValue.trim());
			return censusForm;

		} else if (XlsxHeader.supervisorCostCenter.getValue().equalsIgnoreCase(columnName.trim())) {

			log.info("super cost center");

			censusForm.setSupervisorCostCenter(columnValue);
			return censusForm;
		}

		else if (XlsxHeader.HRManagerClock.getValue().equalsIgnoreCase(columnName.trim().trim())) {

			if (String.valueOf(columnValue).equalsIgnoreCase("null")) {
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "HRManagerClock is wrong;";
				return null;

			}

			log.info("hr manager clock");
			String clockNumber = replaceDotZeros(columnValue.trim());

			log.info(clockNumber + " " + censusForm.getEmpClockNumber());

			if (clockNumber.trim().length() <= 0 || clockNumber.trim().length() == 0
					|| clockNumber.trim().length() > 5) {
				log.info("range extended");

				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "Hr Manager clock number is not valid;";
				return null;
			}
			boolean status = false;
			Set<String> empClock = CensusFileUploadController.employee;
			status = empClock.contains(String.valueOf(clockNumber));

			log.info(status);
			if (status == false) {

				if (clockNumber.equals("99999")) {

				} else {

					log.info("not a employee");
					CensusFileUploadController.cellOneErrorMessage = String
							.valueOf(CensusFileUploadController.cellOneErrorMessage);
					CensusFileUploadController.cellTwoErrorMessage += "Hr Manager is not an employee;";
					return null;
				}
			}

			censusForm.setHrManagerClockNumber(Integer.parseInt(clockNumber));
			hierarchy.setHrManagerClockNumber(Integer.parseInt(clockNumber));
			censusForm.setHierarchy(hierarchy);
			log.info("hr manager clock");
			log.info(censusForm);
			return censusForm;
		} else if (XlsxHeader.HRManagerFname.getValue().equalsIgnoreCase(columnName.trim())) {

			if (columnValue.trim().length() > 30) {
				CensusFileUploadController.cellOneErrorMessage = String.valueOf(censusForm.getEmpClockNumber());
				CensusFileUploadController.cellTwoErrorMessage += "Hr Manager first name is more than 30 chars;";

				return null;
			}
			censusForm.setHrManagerFirstName(columnValue.trim());

			return censusForm;
		} else if (XlsxHeader.HRManagerLname.getValue().equalsIgnoreCase(columnName.trim())) {

			if (columnValue.trim().length() > 30) {

				CensusFileUploadController.cellOneErrorMessage = String.valueOf(censusForm.getEmpClockNumber());
				CensusFileUploadController.cellTwoErrorMessage += "Hr Manager last name is more than 30 chars;";
				return null;
			}
			censusForm.setHrManagerLastName(columnValue.trim());
			return censusForm;

		} else if (XlsxHeader.HrManagerCostCenter.getValue().equalsIgnoreCase(columnName.trim())) {
			/*
			 * if (columnValue.trim().length() > 7) {
			 * 
			 * return null; }
			 */

			censusForm.setHrManagerCostCenter(columnValue);
			return censusForm;

		}

		else if (XlsxHeader.HRGeneralistClock.getValue().equalsIgnoreCase(columnName.trim())) {

			if (String.valueOf(columnValue).equalsIgnoreCase("null")) {
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "HRGeneralistClock is wrong;";
				return null;

			}
			String clockNumber = replaceDotZeros(columnValue.trim());

			log.info(clockNumber + " " + censusForm.getEmpClockNumber());
			if (clockNumber.trim().length() <= 0 || clockNumber.trim().length() == 0
					|| clockNumber.trim().length() > 5) {

				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "Hr Generalist number is not valid chars;";
				return null;
			}
			// log.info("sup : " + columnValue);
			boolean status = false;
			Set<String> empClock = CensusFileUploadController.employee;
			status = empClock.contains(String.valueOf(clockNumber));

			if (status == false) {

				if (clockNumber.equals("99999")) {

				} else {

					CensusFileUploadController.cellOneErrorMessage = String
							.valueOf(CensusFileUploadController.cellOneErrorMessage);
					CensusFileUploadController.cellTwoErrorMessage += "HRGeneralist is not an employee;";
					return null;
				}
			}

			censusForm.setHrGeneralistClockNumber(Integer.parseInt(clockNumber));
			hierarchy.setHrGeneralistClockNumber(Integer.parseInt(clockNumber));
			censusForm.setHierarchy(hierarchy);

			return censusForm;
		} else if (XlsxHeader.HRGeneralistFName.getValue().equalsIgnoreCase(columnName.trim())) {
			if (columnValue.trim().length() > 30) {
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage = "HRGeneralistFName is more than 30 chars;";
				return null;
			}

			censusForm.setHrGeneralistFirstName(columnValue.trim());
			return censusForm;
		} else if (XlsxHeader.HRGeneralistLname.getValue().equalsIgnoreCase(columnName.trim())) {
			if (columnValue.trim().length() > 30) {
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "HRGeneralistLname is more than 30 chars;";
				return null;
			}
			censusForm.setHrGeneralistLastName(columnValue.trim());
			return censusForm;
		} else if (XlsxHeader.HrGenerlistCostCenter.getValue().equalsIgnoreCase(columnName.trim())) {
			/*
			 * if (columnValue.trim().length() > 7) {
			 * 
			 * return null; }
			 */

			censusForm.setHrGeneralistCostCenter(columnValue);
			return censusForm;
		} else if (XlsxHeader.mor.getValue().equalsIgnoreCase(columnName.trim())) {

			/*
			 * if (columnValue.trim().length() > 50) {
			 * 
			 * return null; }
			 */
			censusForm.setMor(columnValue);
			return censusForm;
		}

		else if (XlsxHeader.discDate.getValue().equalsIgnoreCase(columnName.trim())) {

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
		} else if (XlsxHeader.disciplinaryDescription.getValue().equalsIgnoreCase(columnName.trim())) {

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
				censusForm.setSalaryIncreaseOrNot(columnValue.toUpperCase());
				return censusForm;

			} else if (columnValue.trim().equalsIgnoreCase("N")) {

				System.out.println("no condition");

				System.out.println(censusForm.getDiscDate());

				censusForm.setSalaryIncreaseOrNot(columnValue.toUpperCase());
				
				return censusForm;
				// }
			} else if (columnValue.trim().isEmpty()) {
				log.info("empty " + censusForm.getEmpClockNumber());
				log.info("empty : " + columnValue);
				log.info("increase condition is shit");
				censusForm.setSalaryIncreaseOrNot("");
				
				return censusForm;
			} 

		} else if (XlsxHeader.JobAttribute.getValue().equalsIgnoreCase(columnName.trim())) {

			log.info("jboAttribute");
			String recordStatus = "";
			
			if(String.valueOf(censusForm.getShift()).equalsIgnoreCase("null") ||String.valueOf(censusForm.getShift()).isEmpty() ){
				
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "shift is not a valid one.";
				
				recordStatus = "found errors";
			//	return null;
				
			}
	/*		
			if(columnValue.equalsIgnoreCase("Executive") || columnValue.equalsIgnoreCase("Shop Salaried")){
				
				
			}else{
				
				log.info(columnValue);
				
				if(!censusForm.getExemptOrNonExempt().equalsIgnoreCase("non-Exempt")){
					CensusFileUploadController.cellOneErrorMessage = String
							.valueOf(CensusFileUploadController.cellOneErrorMessage);
					CensusFileUploadController.cellTwoErrorMessage += "job attribute condition is not statisfied";
					
					recordStatus = "found errors";	
					
				}
			}*/
			
			if (String.valueOf(censusForm.getSalaryIncreaseOrNot()).isEmpty()
					|| String.valueOf(censusForm.getSalaryIncreaseOrNot()).equalsIgnoreCase("null")) {

				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "Salary increase condition is blank.";
				recordStatus = "found errors";
				// return null;
			}
			
			
			if(String.valueOf(censusForm.getHourlyOrSalary()).equalsIgnoreCase("S")){
			if(String.valueOf(censusForm.getEmpEmailAddress()).equalsIgnoreCase("null") ||
					String.valueOf(censusForm.getEmpEmailAddress()).isEmpty()){
				
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "Email is not existing for salaried employee";
				
				recordStatus = "found errors";
			//	return null;
				
			}
			}

			if ((String.valueOf(censusForm.getSupervisorClockNumber()).equalsIgnoreCase("null"))
					|| String.valueOf(censusForm.getSupervisorClockNumber()).length()==0) {

				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "supervisorClockNumber is wrong;";
			
				recordStatus = "found errors";
				//return null;

			}
			if ((String.valueOf(censusForm.getHrGeneralistClockNumber()).equalsIgnoreCase("null"))
					|| String.valueOf(censusForm.getHrGeneralistCostCenter()).length() == 0) {

				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "hr generalist is wrong;";
			
				recordStatus = "found errors";
				//return null;

			}

			if ((String.valueOf(censusForm.getHrManagerClockNumber()).equalsIgnoreCase("null"))
					|| String.valueOf(censusForm.getHrManagerClockNumber()).length() == 0) {

				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "hr generalist is wrong;";
				
				recordStatus = "found errors";
				//return null;

			}

			if (columnValue.substring(0, 1).trim().equalsIgnoreCase("e") || columnValue.contains("Executive")) {

				// censusForm.setHourlyOrSalary(" ");
				censusForm.setClassification2(columnValue);

			} else {

		//		String recordStatus = "";
				if ((String.valueOf(censusForm.getSupervisorClockNumber()).equalsIgnoreCase("null"))
						|| censusForm.getSupervisorClockNumber() == 0) {

					CensusFileUploadController.cellOneErrorMessage = String
							.valueOf(CensusFileUploadController.cellOneErrorMessage);
					CensusFileUploadController.cellTwoErrorMessage += "supervisor clock number is missing";
					recordStatus = "found errors";
					// return null;

				}

				if (String.valueOf(censusForm.getSalaryIncreaseOrNot()).isEmpty()
						|| String.valueOf(censusForm.getSalaryIncreaseOrNot()).equalsIgnoreCase("null")) {

					CensusFileUploadController.cellOneErrorMessage = String
							.valueOf(CensusFileUploadController.cellOneErrorMessage);
					CensusFileUploadController.cellTwoErrorMessage += "Salary increase condition is blank.";
					recordStatus = "found errors";
					// return null;
				}

				if ((String.valueOf(censusForm.getMinValue()).equalsIgnoreCase("null"))
						|| censusForm.getMinValue().trim().isEmpty()) {
					CensusFileUploadController.cellOneErrorMessage = String
							.valueOf(CensusFileUploadController.cellOneErrorMessage);
					CensusFileUploadController.cellTwoErrorMessage += "minimum salary is not numeric.";
					recordStatus = "found errors";
					// return null;

				}
				if ((String.valueOf(censusForm.getMidValue()).equalsIgnoreCase("null"))
						|| censusForm.getMidValue().trim().isEmpty()) {
					CensusFileUploadController.cellOneErrorMessage = String
							.valueOf(CensusFileUploadController.cellOneErrorMessage);
					CensusFileUploadController.cellTwoErrorMessage += "mid salary is not numeric.";
					recordStatus = "found errors";
					// return null;

				}
				if ((String.valueOf(censusForm.getMaxValue()).equalsIgnoreCase("null"))
						|| censusForm.getMaxValue().trim().isEmpty()) {
					CensusFileUploadController.cellOneErrorMessage = String
							.valueOf(CensusFileUploadController.cellOneErrorMessage);
					CensusFileUploadController.cellTwoErrorMessage += "max salary is not numeric.";
					recordStatus = "found errors";
					// return null;

				}
				if ((String.valueOf(censusForm.getPayGradeId()).equalsIgnoreCase("null"))
						|| censusForm.getPayGradeId().trim().isEmpty()) {
					CensusFileUploadController.cellOneErrorMessage = String
							.valueOf(CensusFileUploadController.cellOneErrorMessage);
					CensusFileUploadController.cellTwoErrorMessage += "payGrade is empty.";
					recordStatus = "found errors";
					// return null;

				}
				if ((String.valueOf(censusForm.getCurrentHrlyRate()).equalsIgnoreCase("null"))
						|| censusForm.getCurrentHrlyRate().trim().isEmpty()) {
					CensusFileUploadController.cellOneErrorMessage = String
							.valueOf(CensusFileUploadController.cellOneErrorMessage);
					CensusFileUploadController.cellTwoErrorMessage += "Currently hourly rate is empty.";
					recordStatus = "found errors";
					// return null;

				}
				if ((String.valueOf(censusForm.getAnnaulRate()).equalsIgnoreCase("null"))
						|| censusForm.getAnnaulRate().trim().isEmpty()) {
					CensusFileUploadController.cellOneErrorMessage = String
							.valueOf(CensusFileUploadController.cellOneErrorMessage);
					CensusFileUploadController.cellTwoErrorMessage += "Currently annual rate is empty.";
					recordStatus = "found errors";
					// return null;

				}
					
				
			if(!columnValue.contains("Executive") || !columnValue.contains("Office Hourly") || !columnValue.contains("Shop Hourly")
					|| ! columnValue.contains("Office and Shop")){
				
				CensusFileUploadController.cellTwoErrorMessage += "Job Attribute is not valid.";
				return null;
			
			}
				if ("found errors".equalsIgnoreCase(recordStatus)) {

					return null;
				}
				
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

			if ("found errors".equalsIgnoreCase(recordStatus)) {

				return null;
			}
			censusForm.setClassification2(columnValue);
			return censusForm;
		}

		else if (XlsxHeader.reasonForCompRecord.getValue().equalsIgnoreCase(columnName.trim())) {

			censusForm.setReasonForCompRecord(columnValue);
			return censusForm;
		} else if (XlsxHeader.startDate.getValue().equalsIgnoreCase(columnName.trim())) {

			try {

				/*
				 * if (columnValue.isEmpty()) {
				 * CensusFileUploadController.cellOneErrorMessage = String
				 * .valueOf(CensusFileUploadController.cellOneErrorMessage);
				 * CensusFileUploadController.cellTwoErrorMessage +=
				 * "Start date is empty;"; return null;
				 * 
				 * }
				 */
				censusForm.setCompStartDate(Converters.getParsedDate(columnValue));
				return censusForm;
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
		} else if (XlsxHeader.min.getValue().equalsIgnoreCase(columnName.trim())) {

			String minEncrypt = EncryptDecryptProcess.encryptTechnique(columnValue);
		
			censusForm.setMinValue(minEncrypt);
			return censusForm;
		}

		else if (XlsxHeader.max.getValue().equalsIgnoreCase(columnName.trim())) {
			String maxEncrypt = EncryptDecryptProcess.encryptTechnique(columnValue);
		
			censusForm.setMaxValue(maxEncrypt);
			return censusForm;
		}

		else if (XlsxHeader.mid.getValue().equalsIgnoreCase(columnName.trim())) {
			
			 String midEncrypt = EncryptDecryptProcess.encryptTechnique(columnValue);
			censusForm.setMidValue(midEncrypt);
			return censusForm;
		}

		else if (XlsxHeader.payGrade.getValue().equalsIgnoreCase(columnName.trim())) {

			censusForm.setPayGradeId(columnValue);
			return censusForm;
		}

		else if (XlsxHeader.currentHrlRate.getValue().equalsIgnoreCase(columnName.trim())) {
			String hrlyEncrypt = EncryptDecryptProcess.encryptTechnique(columnValue);
			censusForm.setCurrentHrlyRate(hrlyEncrypt);
			censusForm.setNextYearHourlyRate(hrlyEncrypt);

			return censusForm;
		} else if (XlsxHeader.currentAnnualRate.getValue().equalsIgnoreCase(columnName.trim())) {
			
			System.out.println("------------Annual Rate -----------------------------");
		
			System.out.println(columnValue.trim());
			
			String annualEncrypt = EncryptDecryptProcess.encryptTechnique(columnValue);
			
			censusForm.setAnnaulRate(annualEncrypt);
			censusForm.setNextYearAnnualRate(annualEncrypt);

			return censusForm;
		} else if (XlsxHeader.hrAdmin.getValue().equalsIgnoreCase(columnName.trim())) {

			String clockNumber = replaceDotZeros(columnValue.trim());

			censusForm.setHrAdmin(clockNumber);
			

			System.out.println(" hr admin else if ");

			System.out.println(censusForm.getEmpClockNumber());
			
		/*	if(String.valueOf(censusForm.getClassification2()).equalsIgnoreCase("null")||
					String.valueOf(censusForm.getClassification2()).isEmpty()){
				CensusFileUploadController.cellOneErrorMessage = String
						.valueOf(CensusFileUploadController.cellOneErrorMessage);
				CensusFileUploadController.cellTwoErrorMessage += "job Attribute is blank.";
				
				return null;
			}*/

			/*Set<String> hrAdminRole = CensusFileUploadController.hrAdmin;
			Set<String> hrManagerRole = CensusFileUploadController.hrManager;
			Set<String> hrGeneralistRole = CensusFileUploadController.hrGeneralist;*/

		/*	if (hrAdminRole.contains(String.valueOf(censusForm.getEmpClockNumber()))) {

				System.out.println("admin");
				censusForm.setRole("HRAdmin");
			} else if (hrManagerRole.contains(String.valueOf(censusForm.getEmpClockNumber()))) {

				System.out.println("manager");
				censusForm.setRole("HrManager");
			} else if (hrGeneralistRole.contains(String.valueOf(censusForm.getEmpClockNumber()))) {

				System.out.println("generalist");
				censusForm.setRole("HRGeneralist");
			}*/

			return censusForm;
		}

		else {

			return censusForm;
		}
		/*
		 * System.out.println("return null value");
		 * System.out.println(columnName + "  at the end...  " + columnValue);
		 * return null;
		 */
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
			//	clockNumber = "0";
			} catch (Exception e) {

				e.printStackTrace();
			}
		} else {

			clockNumber = columnValue;
		}

		return clockNumber;
	}

}
