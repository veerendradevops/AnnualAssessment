package com.lisi.annualassessment.orm;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Employeeclock")
public class EmployeeClock {

	
	
	
	@Id
	@Column(name = "EmployeeClock")
	private int EmployeeClock;

	public int getEmployeeClock() {
		return EmployeeClock;
	}

	public void setEmployeeClock(int employeeClock) {
		EmployeeClock = employeeClock;
	}
	
	
}
