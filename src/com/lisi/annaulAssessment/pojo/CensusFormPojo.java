package com.lisi.annaulAssessment.pojo;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import com.lisi.annaualAssessment.orm.Disciplinary;
import com.lisi.annaualAssessment.orm.Hierarchy;

public class CensusFormPojo {

	
	private int empClockNumber;

	
	private String emplastName;

	
	private String empfirstName;

	
	private String companyPsid; // PSID

	
	private String company; // location of the company...

	
	private String eStatus;

	
	private String factoryLocation;

	
	private String jobTitle;

	
	private int shift;

	
	private String hourlyOrSalary;

	
	private String costCenter;

	
	private Date DOH;

	// private String classification; // h or s

	
	private String empEmailAddress;

	// employee form is completed.

	
	private int supervisorClockNumber;

	
	private String supervisorFirstName;

	
	private String supervisorLasttName;

	
	private String supervisorCostCenter;

	// supervisor form is completed.

	
	private int hrManagerClockNumber;


	private String hrManagerFirstName;

	
	private String hrManagerLastName;

	
	private String hrManagerCostCenter;

	
	private int hrGeneralistClockNumber;


	private String hrGeneralistFirstName;

	
	private String hrGeneralistLastName;

	
	private String hrGeneralistCostCenter;

	// hr details completed

	
	private String mor;

	
	private Disciplinary disciplinary;

	// private String classification;

	
	private Date discDate;

	
	private String disciplinaryDescription;

	
	private String salaryIncreaseOrNot;

	
	private String classification2;


	private String reasonForCompRecord;

	
	private Date compStartDate;

	
	private String min;

	
	private String max;

	
	private String mid;

	
	private String payGradeId;

	
	private String annaulRate;

	
	private String currentHrlyRate;

	
	private String exemptOrNonExempt;

	
	private String annaulYear;

	
	private String status;

	
	private String completedDate;


	private Hierarchy hierarchy;

	private String yellohourlyRate;

	private String yelloAnnaulRate;

	private String percentageIncrease;

	private String greenhourlyRate;

	private String greenAnnaulRate;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCompletedDate() {
		return completedDate;
	}

	public void setCompletedDate(String completedDate) {
		this.completedDate = completedDate;
	}

	public String getAnnaulRate() {
		return annaulRate;
	}

	public void setAnnaulRate(String annaulRate) {
		this.annaulRate = annaulRate;
	}

	public String getAnnaulYear() {
		return annaulYear;
	}

	public void setAnnaulYear(String annaulYear) {
		this.annaulYear = annaulYear;
	}

	public String getExemptOrNonExempt() {
		return exemptOrNonExempt;
	}

	public void setExemptOrNonExempt(String exemptOrNonExempt) {
		this.exemptOrNonExempt = exemptOrNonExempt;
	}

	public Date getCompStartDate() {
		return compStartDate;
	}

	public void setCompStartDate(Date compStartDate) {
		this.compStartDate = compStartDate;
	}

	public String getSalaryIncreaseOrNot() {
		return salaryIncreaseOrNot;
	}

	public void setSalaryIncreaseOrNot(String salaryIncreaseOrNot) {
		this.salaryIncreaseOrNot = salaryIncreaseOrNot;
	}

	public String getClassification2() {
		return classification2;
	}

	public void setClassification2(String classification2) {
		this.classification2 = classification2;
	}

	public String getReasonForCompRecord() {
		return reasonForCompRecord;
	}

	public void setReasonForCompRecord(String reasonForCompRecord) {
		this.reasonForCompRecord = reasonForCompRecord;
	}

	public String getMin() {
		return min;
	}

	public void setMin(String min) {
		this.min = min;
	}

	public String getMax() {
		return max;
	}

	public void setMax(String max) {
		this.max = max;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getPayGradeId() {
		return payGradeId;
	}

	public void setPayGradeId(String payGradeId) {
		this.payGradeId = payGradeId;
	}

	public String getCurrentHrlyRate() {
		return currentHrlyRate;
	}

	public void setCurrentHrlyRate(String currentHrlyRate) {
		this.currentHrlyRate = currentHrlyRate;
	}

	public int getEmpClockNumber() {
		return empClockNumber;
	}

	public String getHrManagerLastName() {
		return hrManagerLastName;
	}

	public void setHrManagerLastName(String hrManagerLastName) {
		this.hrManagerLastName = hrManagerLastName;
	}

	public String getHrManagerCostCenter() {
		return hrManagerCostCenter;
	}

	public void setHrManagerCostCenter(String hrManagerCostCenter) {
		this.hrManagerCostCenter = hrManagerCostCenter;
	}

	public int getHrGeneralistClockNumber() {
		return hrGeneralistClockNumber;
	}

	public void setHrGeneralistClockNumber(int hrGeneralistClockNumber) {
		this.hrGeneralistClockNumber = hrGeneralistClockNumber;
	}

	public String getHrGeneralistFirstName() {
		return hrGeneralistFirstName;
	}

	public void setHrGeneralistFirstName(String hrGeneralistFirstName) {
		this.hrGeneralistFirstName = hrGeneralistFirstName;
	}

	public String getHrGeneralistLastName() {
		return hrGeneralistLastName;
	}

	public void setHrGeneralistLastName(String hrGeneralistLastName) {
		this.hrGeneralistLastName = hrGeneralistLastName;
	}

	public String getHrGeneralistCostCenter() {
		return hrGeneralistCostCenter;
	}

	public void setHrGeneralistCostCenter(String hrGeneralistCostCenter) {
		this.hrGeneralistCostCenter = hrGeneralistCostCenter;
	}

	public String getHrManagerFirstName() {
		return hrManagerFirstName;
	}

	public void setHrManagerFirstName(String hrManagerFirstName) {
		this.hrManagerFirstName = hrManagerFirstName;
	}

	public int getHrManagerClockNumber() {
		return hrManagerClockNumber;
	}

	public void setHrManagerClockNumber(int hrManagerClockNumber) {
		this.hrManagerClockNumber = hrManagerClockNumber;
	}

	public String getSupervisorCostCenter() {
		return supervisorCostCenter;
	}

	public void setSupervisorCostCenter(String supervisorCostCenter) {
		this.supervisorCostCenter = supervisorCostCenter;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	/*
	 * public String getClassification() { return classification; }
	 * 
	 * public void setClassification(String classification) {
	 * this.classification = classification; }
	 */

	public String getCostCenter() {
		return costCenter;
	}

	public void setCostCenter(String costCenter) {
		this.costCenter = costCenter;
	}

	public void setEmpClockNumber(int empClockNumber) {
		this.empClockNumber = empClockNumber;
	}

	public String getEmplastName() {
		return emplastName;
	}

	public void setEmplastName(String emplastName) {
		this.emplastName = emplastName;
	}

	public String getEmpfirstName() {
		return empfirstName;
	}

	public void setEmpfirstName(String empfirstName) {
		this.empfirstName = empfirstName;
	}

	public String getCompanyPsid() {
		return companyPsid;
	}

	public void setCompanyPsid(String companyPsid) {
		this.companyPsid = companyPsid;
	}

	public String geteStatus() {
		return eStatus;
	}

	public void seteStatus(String eStatus) {
		this.eStatus = eStatus;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public int getShift() {
		return shift;
	}

	public void setShift(int shift) {
		this.shift = shift;
	}

	public Date getDOH() {
		return DOH;
	}

	public void setDOH(Date dOH) {
		DOH = dOH;
	}

	/*
	 * public String getEmployeementStatus() { return employeementStatus; }
	 * 
	 * public void setEmployeementStatus(String employeementStatus) {
	 * this.employeementStatus = employeementStatus; }
	 */

	/*
	 * public String getHourlyORSalary() { return hourlyORSalary; }
	 * 
	 * public void setHourlyORSalary(String hourlyORSalary) {
	 * this.hourlyORSalary = hourlyORSalary; }
	 * 
	 * public String getPayGradeId() { return payGradeId; }
	 * 
	 * public void setPayGradeId(String payGradeId) { this.payGradeId =
	 * payGradeId; }
	 */

	public String getMor() {
		return mor;
	}

	public void setMor(String mor) {
		this.mor = mor;
	}

	public Hierarchy getHierarchy() {
		return hierarchy;
	}

	public void setHierarchy(Hierarchy hierarchy) {
		this.hierarchy = hierarchy;
	}

	public String getEmpEmailAddress() {
		return empEmailAddress;
	}

	public void setEmpEmailAddress(String empEmailAddress) {
		this.empEmailAddress = empEmailAddress;
	}

	public Date getDiscDate() {
		return discDate;
	}

	public void setDiscDate(Date discDate) {
		this.discDate = discDate;
	}

	public String getDisciplinaryDescription() {
		return disciplinaryDescription;
	}

	public void setDisciplinaryDescription(String disciplinaryDescription) {
		this.disciplinaryDescription = disciplinaryDescription;
	}

	public String getFactoryLocation() {
		return factoryLocation;
	}

	public void setFactoryLocation(String factoryLocation) {
		this.factoryLocation = factoryLocation;
	}

	public String getHourlyOrSalary() {
		return hourlyOrSalary;
	}

	public void setHourlyOrSalary(String hourlyOrSalary) {
		this.hourlyOrSalary = hourlyOrSalary;
	}

	public int getSupervisorClockNumber() {
		return supervisorClockNumber;
	}

	public void setSupervisorClockNumber(int supervisorClockNumber) {
		this.supervisorClockNumber = supervisorClockNumber;
	}

	public String getSupervisorFirstName() {
		return supervisorFirstName;
	}

	public void setSupervisorFirstName(String supervisorFirstName) {
		this.supervisorFirstName = supervisorFirstName;
	}

	public String getSupervisorLasttName() {
		return supervisorLasttName;
	}

	public void setSupervisorLasttName(String supervisorLasttName) {
		this.supervisorLasttName = supervisorLasttName;
	}

	public String getYellohourlyRate() {
		return yellohourlyRate;
	}

	public void setYellohourlyRate(String yellohourlyRate) {
		this.yellohourlyRate = yellohourlyRate;
	}

	public String getYelloAnnaulRate() {
		return yelloAnnaulRate;
	}

	public void setYelloAnnaulRate(String yelloAnnaulRate) {
		this.yelloAnnaulRate = yelloAnnaulRate;
	}

	public String getPercentageIncrease() {
		return percentageIncrease;
	}

	public void setPercentageIncrease(String percentageIncrease) {
		this.percentageIncrease = percentageIncrease;
	}

	public String getGreenhourlyRate() {
		return greenhourlyRate;
	}

	public void setGreenhourlyRate(String greenhourlyRate) {
		this.greenhourlyRate = greenhourlyRate;
	}

	public String getGreenAnnaulRate() {
		return greenAnnaulRate;
	}

	public void setGreenAnnaulRate(String greenAnnaulRate) {
		this.greenAnnaulRate = greenAnnaulRate;
	}

	
}
