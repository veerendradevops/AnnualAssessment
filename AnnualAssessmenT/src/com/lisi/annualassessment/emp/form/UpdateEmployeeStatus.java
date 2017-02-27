package com.lisi.annualassessment.emp.form;

import com.lisi.annualassessment.orm.CensusForm;

import sun.security.x509.CertificateSerialNumber;

public class UpdateEmployeeStatus {

	public static String validateUser(CensusForm censusForm, CensusForm censusDB) {

		if (!(censusForm.getEmpfirstName().equalsIgnoreCase(censusDB.getEmpfirstName()))) {

			return "new record";
		}

		if (!(censusForm.getEmplastName().equalsIgnoreCase(censusDB.getEmplastName()))) {

			return "new record";
		}
		if (!(censusForm.getCostCenter().equalsIgnoreCase(censusDB.getCostCenter()))) {

			return "new record";
		}
		if (!(censusForm.getCostCenter().equalsIgnoreCase(censusDB.getCostCenter()))) {

			return "new record";
		}

		if (!(censusForm.getCompanyPsid().equalsIgnoreCase(censusDB.getCompanyPsid()))) {

			return "new record";
		}

		/*if (censusForm.getDOH().compareTo(censusDB.getDOH()) > 0
				|| censusForm.getDOH().compareTo(censusDB.getDOH()) < 0) {

			return "new record";
		}*/

		if (censusForm.getShift() != censusForm.getShift()) {

			return "new record";
		}

		if (!(censusForm.geteStatus().equalsIgnoreCase(censusDB.geteStatus()))) {

			return "new record";
		}

		if (!(censusForm.getJobTitle().equalsIgnoreCase(censusDB.getJobTitle()))) {

			return "new record";
		}

		if (!(String.valueOf(censusForm.getEmpEmailAddress())
				.equalsIgnoreCase(String.valueOf(censusDB.getEmpEmailAddress())))) {

			return "new record";
		}

		if (!(String.valueOf(censusForm.getMor()).equalsIgnoreCase(String.valueOf(censusDB.getMor())))) {

			return "new record";
		}
		if (!(String.valueOf(censusForm.getDisciplinaryDescription())
				.equalsIgnoreCase(String.valueOf(censusDB.getDisciplinaryDescription())))) {

			return "new record";
		}
		if (!(censusForm.getClassification2().equalsIgnoreCase(censusDB.getClassification2()))) {

			return "new record";
		}

		/*if (censusForm.getCompStartDate().compareTo(censusDB.getCompStartDate()) > 0
				|| censusForm.getCompStartDate().compareTo(censusDB.getCompStartDate()) < 0) {

			return "new record";
		}*/

		String min = EncryptDecryptProcess.encryptTechnique(censusDB.getMinValue());

		if (!(String.valueOf(censusForm.getMinValue()).equalsIgnoreCase(min))) {

			return "new record";
		}
		String mid = EncryptDecryptProcess.encryptTechnique(censusDB.getMidValue());

		if (!(String.valueOf(censusForm.getMidValue()).equalsIgnoreCase(mid))) {

			return "new record";
		}
		String max = EncryptDecryptProcess.encryptTechnique(censusDB.getMaxValue());

		if (!(String.valueOf(censusForm.getMaxValue()).equalsIgnoreCase(max))) {

			return "new record";
		}

		String hrlyEncrypt = EncryptDecryptProcess.encryptTechnique(censusDB.getCurrentHrlyRate());
		if (!(String.valueOf(censusForm.getCurrentHrlyRate()).equalsIgnoreCase(hrlyEncrypt))) {

			return "new record";
		}
		String annualEncrypt = EncryptDecryptProcess.encryptTechnique(censusDB.getAnnaulRate());
		if (!(String.valueOf(censusForm.getAnnaulRate()).equalsIgnoreCase(annualEncrypt))) {

			return "new record";
		}

		/*if (censusForm.getDiscDate().compareTo(censusDB.getDiscDate()) > 0
				|| censusForm.getDiscDate().compareTo(censusDB.getDiscDate()) < 0) {

			return "new record";
		}*/

		if (!(censusForm.getFactoryLocation().equalsIgnoreCase(censusDB.getFactoryLocation()))) {

			return "new record";
		}

		if (!(censusForm.getHourlyOrSalary().equalsIgnoreCase(censusDB.getHourlyOrSalary()))) {

			return "new record";
		}

		if ((censusForm.getHrGeneralistClockNumber() != (censusDB.getHrGeneralistClockNumber()))) {

			return "new record";
		}

		if (!(censusForm.getHrGeneralistFirstName().equalsIgnoreCase(censusDB.getHrGeneralistFirstName()))) {

			return "new record";
		}

		if (!(censusForm.getHrGeneralistLastName().equalsIgnoreCase(censusDB.getHrGeneralistLastName()))) {

			return "new record";
		}

		if (!(censusForm.getHrGeneralistCostCenter().equalsIgnoreCase(censusDB.getHrGeneralistCostCenter()))) {

			return "new record";
		}

		if ((censusForm.getHrManagerClockNumber() != (censusDB.getHrManagerClockNumber()))) {

			return "new record";
		}

		if (!(censusForm.getHrManagerFirstName().equalsIgnoreCase(censusDB.getHrManagerFirstName()))) {

			return "new record";
		}

		if (!(censusForm.getHrManagerLastName().equalsIgnoreCase(censusDB.getHrManagerLastName()))) {

			return "new record";
		}

		if (!(censusForm.getHrManagerCostCenter().equalsIgnoreCase(censusDB.getHrManagerCostCenter()))) {

			return "new record";
		}

		if (censusForm.getSupervisorClockNumber() != censusDB.getSupervisorClockNumber()) {

			return "new record";
		}
		if (!censusForm.getSupervisorFirstName().equalsIgnoreCase(censusDB.getSupervisorFirstName())) {

			return "new record";
		}
		if (!censusForm.getSupervisorLasttName().equalsIgnoreCase(censusDB.getSupervisorLasttName())) {

			return "new record";
		}
		if (!censusForm.getSupervisorCostCenter().equalsIgnoreCase(censusDB.getSupervisorCostCenter())) {

			return "new record";
		}
		
		if(!censusForm.getSalaryIncreaseOrNot().equalsIgnoreCase(censusDB.getSalaryIncreaseOrNot())){
			
			return "new record";
		}
		
		if(!String.valueOf(censusForm.getReasonForCompRecord()).equalsIgnoreCase(censusDB.getReasonForCompRecord())){
			
			
			return "new record";
		}
		
		if(!String.valueOf(censusForm.getPayGradeId()).equalsIgnoreCase(censusDB.getPayGradeId())){
			
			
			return "new record";
		}
			
		if(!censusForm.getHrAdmin().equalsIgnoreCase(censusDB.getHrAdmin())){
			
			return "new record";
		}
		

		return "old record";
	}

}
