package com.lisi.annaualAssessment.orm;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

//Hierarchy

@Entity
@Table(name = "Hierarchy")
public class Hierarchy {

	@Id
	@Column(name= "EmpClockNumber")
	private int empClockNumber;
	
	@Column(name= "SupervisorClockNumber")
	private int supervisorClockNumber;
	
	@Column(name= "HrManagerClockNumber")
	private int hrManagerClockNumber;
	
	@Column(name= "HrGaneralistClockNumber")
	private int hrGeneralistClockNumber;
	
	@Column(name= "ApprisalYear")
	private String apprisalYear;
	
	@Column(name="EmployeeADName")
	private String employeeADName;

	public int getEmpClockNumber() {
		return empClockNumber;
	}

	public void setEmpClockNumber(int empClockNumber) {
		this.empClockNumber = empClockNumber;
	}

	public int getSupervisorClockNumber() {
		return supervisorClockNumber;
	}

	public void setSupervisorClockNumber(int supervisorClockNumber) {
		this.supervisorClockNumber = supervisorClockNumber;
	}

	public int getHrManagerClockNumber() {
		return hrManagerClockNumber;
	}

	public void setHrManagerClockNumber(int hrManagerClockNumber) {
		this.hrManagerClockNumber = hrManagerClockNumber;
	}

	public int getHrGeneralistClockNumber() {
		return hrGeneralistClockNumber;
	}

	public void setHrGeneralistClockNumber(int hrGeneralistClockNumber) {
		this.hrGeneralistClockNumber = hrGeneralistClockNumber;
	}

	
	public String getApprisalYear() {
		return apprisalYear;
	}

	public void setApprisalYear(String apprisalYear) {
		this.apprisalYear = apprisalYear;
	}

	public String getEmployeeADName() {
		return employeeADName;
	}

	public void setEmployeeADName(String employeeADName) {
		this.employeeADName = employeeADName;
	}
	
	
	
	
}
