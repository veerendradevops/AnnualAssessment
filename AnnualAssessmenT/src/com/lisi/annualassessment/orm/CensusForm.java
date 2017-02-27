package com.lisi.annualassessment.orm;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Employee")
public class CensusForm {

	@Id
	@Column(name = "recordNumber")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int recordNumber;
	
	@Column(name = "EmpClockNumber")
	private int empClockNumber;

	@Column(name = "EmpLastName")
	private String emplastName;

	@Column(name = "EmpFirstName")
	private String empfirstName;

	@Column(name = "EmpPSID")
	private String companyPsid; // PSID

	@Column(name = "EmpCompany")
	private String company; // location of the company...

	@Column(name = "EmpStatus")
	private String eStatus;

	@Column(name = "FactoryLocation")
	private String factoryLocation;

	@Column(name = "EmpJobTitle")
	private String jobTitle;

	@Column(name = "EmpShift")
	private int shift;

	@Column(name = "PayRole")
	private String hourlyOrSalary;

	@Column(name = "EmpCostCenterID")
	private String costCenter;

	@Column(name = "EmpDOH")
	private Date DOH;

	// private String classification; // h or s

	@Column(name = "EmpEmail")
	private String empEmailAddress;

	// employee form is completed.

	@Column(name = "SupervisorClock")
	private int supervisorClockNumber;

	@Column(name = "SupervisorFirstName")
	private String supervisorFirstName;

	@Column(name = "SupervisorLastName")
	private String supervisorLasttName;

	@Column(name = "SupervisorCostCenter")
	private String supervisorCostCenter;

	// supervisor form is completed.

	@Column(name = "HRManagerClock")
	private int hrManagerClockNumber;

	@Column(name = "HRManagerFirstName")
	private String hrManagerFirstName;

	@Column(name = "HRManagerLastName")
	private String hrManagerLastName;

	@Column(name = "HRManagerCostCenter")
	private String hrManagerCostCenter;

	@Column(name = "HRGeneralistClockNumber")
	private int hrGeneralistClockNumber;

	@Column(name = "HRGeneralistFirstName")
	private String hrGeneralistFirstName;

	@Column(name = "HRGeneralistLastName")
	private String hrGeneralistLastName;

	@Column(name = "HRGeneralistCostCenter")
	private String hrGeneralistCostCenter;

	// hr details completed

	@Column(name = "MOR")
	private String mor;

/*	@OneToOne(cascade = CascadeType.ALL)
	private Disciplinary disciplinary;
*/
	// private String classification;

	@Column(name = "DisciplinaryDate")
	private Date discDate;

	@Column(name = "DisciplinaryDescription")
	private String disciplinaryDescription;

	@Column(name = "SalaryIncrese")
	private String salaryIncreaseOrNot;

	@Column(name = "ClassificationTwo")
	private String classification2;

	@Column(name = "reasonForCompRecord")
	private String reasonForCompRecord;

	@Column(name = "CompStartDate")
	private Date compStartDate;

	@Column(name = "MinValue")
	private String minValue;
	
	

	@Column(name = "MaxValue")
	private String maxValue;

	@Column(name = "MidValue")
	private String midValue;

	@Column(name = "PayGrade")
	private String payGradeId;

	@Column(name = "CurrentAnnaulRate")
	private String annaulRate;

	@Column(name = "CurrentlyHourlyRate")
	private String currentHrlyRate;

	@Column(name = "exemptNonExempt")
	private String exemptOrNonExempt;

	@Column(name = "annaulAppraisalYear")
	private String annaulYear;

	@Column(name = "status")
	private String status;

	@Column(name = "completedDate")
	private String completedDate;

	@OneToOne(cascade = CascadeType.ALL)
	private Hierarchy hierarchy;
	
	@Column(name= "hrAdmin")
	private String hrAdmin;
	
	@Column(name= "salaryReview")
	private String role;

	@Column(name= "nextYearHourlyRate")
	private String nextYearHourlyRate;
	@Column(name= "nextYearAnnualRate")
	private String nextYearAnnualRate;
	@Column(name= "PercentageOfIncrease")
	private String percentageOfIncrease;
	
	@Column(name="PrintDate")
	private String printDate; 
	
	
	
	public String getPrintDate() {
		return printDate;
	}

	public void setPrintDate(String printDate) {
		this.printDate = printDate;
	}

	public String getNextYearHourlyRate() {
		return nextYearHourlyRate;
	}

	public void setNextYearHourlyRate(String nextYearHourlyRate) {
		this.nextYearHourlyRate = nextYearHourlyRate;
	}

	public String getNextYearAnnualRate() {
		return nextYearAnnualRate;
	}

	public void setNextYearAnnualRate(String nextYearAnnualRate) {
		this.nextYearAnnualRate = nextYearAnnualRate;
	}

	
	
	
	public String getPercentageOfIncrease() {
		return percentageOfIncrease;
	}

	public void setPercentageOfIncrease(String percentageOfIncrease) {
		this.percentageOfIncrease = percentageOfIncrease;
	}

	public String getStatus() {
		return status;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getHrAdmin() {
		return hrAdmin;
	}

	public void setHrAdmin(String hrAdmin) {
		this.hrAdmin = hrAdmin;
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
/*
	public String getMin() {
		return minValue;
	}

	public void setMin(String min) {
		this.minValue = min;
	}

	public String getMax() {
		return maxValue;
	}

	public void setMax(String max) {
		this.maxValue = max;
	}

	public String getMid() {
		return midValue;
	}

	public void setMid(String mid) {
		this.midValue = mid;
	}
*/
	
	
	public String getPayGradeId() {
		return payGradeId;
	}

	public String getMinValue() {
		return minValue;
	}

	public void setMinValue(String minValue) {
		this.minValue = minValue;
	}

	public String getMaxValue() {
		return maxValue;
	}

	public void setMaxValue(String maxValue) {
		this.maxValue = maxValue;
	}

	public String getMidValue() {
		return midValue;
	}

	public void setMidValue(String midValue) {
		this.midValue = midValue;
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

	public Date getDOH() {
		return DOH;
	}

	public void setDOH(Date dOH) {
		DOH = dOH;
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

	@Override
	public String toString() {
		return "CensusForm [empClockNumber=" + empClockNumber + ", emplastName=" + emplastName + ", empfirstName="
				+ empfirstName + ", companyPsid=" + companyPsid + ", company=" + company + ", eStatus=" + eStatus
				+ ", factoryLocation=" + factoryLocation + ", jobTitle=" + jobTitle + ", shift=" + shift
				+ ", hourlyOrSalary=" + hourlyOrSalary + ", costCenter=" + costCenter + ", DOH=" + DOH
				+ ", empEmailAddress=" + empEmailAddress + ", supervisorClockNumber=" + supervisorClockNumber
				+ ", supervisorFirstName=" + supervisorFirstName + ", supervisorLasttName=" + supervisorLasttName
				+ ", supervisorCostCenter=" + supervisorCostCenter + ", hrManagerClockNumber=" + hrManagerClockNumber
				+ ", hrManagerFirstName=" + hrManagerFirstName + ", hrManagerLastName=" + hrManagerLastName
				+ ", hrManagerCostCenter=" + hrManagerCostCenter + ", hrGeneralistClockNumber="
				+ hrGeneralistClockNumber + ", hrGeneralistFirstName=" + hrGeneralistFirstName
				+ ", hrGeneralistLastName=" + hrGeneralistLastName + ", hrGeneralistCostCenter="
				+ hrGeneralistCostCenter + ", mor=" + mor + ", disciplinary="  + ", discDate=" + discDate
				+ ", disciplinaryDescription=" + disciplinaryDescription + ", salaryIncreaseOrNot="
				+ salaryIncreaseOrNot + ", classification2=" + classification2 + ", reasonForCompRecord="
				+ reasonForCompRecord + ", compStartDate=" + compStartDate + ", min=" + minValue + ", max=" + maxValue + ", mid="
				+ midValue + ", payGradeId=" + payGradeId + ", annaulRate=" + annaulRate + ", currentHrlyRate="
				+ currentHrlyRate + ", exemptOrNonExempt=" + exemptOrNonExempt + ", annaulYear=" + annaulYear
				+ ", status=" + status + ", completedDate=" + completedDate + ", hierarchy=" + hierarchy + "]";
	}

	public int getRecordNumber() {
		return recordNumber;
	}

	public void setRecordNumber(int recordNumber) {
		this.recordNumber = recordNumber;
	}

	/*public String getYellohourlyRate() {
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
	}*/

	
	
	
}
