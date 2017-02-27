package com.lisi.annualassessment.orm;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

			   	
@Entity
@Table(name = "Disciplinary")
public class Disciplinary {

	@Id
	@Column(name= "EmpClockNumber")
	private int empClockNumber;
	
	@Column(name= "Disciplinary")
	private Date disciplinary;
	
	@Column(name= "DisciplinaryDescription")
	private String disciplinaryDescription;

	public int getEmpClockNumber() {
		return empClockNumber;
	}

	public void setEmpClockNumber(int empClockNumber) {
		this.empClockNumber = empClockNumber;
	}

	public Date getDisciplinary() {
		return disciplinary;
	}

	public void setDisciplinary(Date disciplinary) {
		this.disciplinary = disciplinary;
	}

	public String getDisciplinaryDescription() {
		return disciplinaryDescription;
	}

	public void setDisciplinaryDescription(String disciplinaryDescription) {
		this.disciplinaryDescription = disciplinaryDescription;
	}
	
	
	
}
