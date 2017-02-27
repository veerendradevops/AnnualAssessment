package com.lisi.annualassessment.orm;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Department")
public class Department {

	@Id
	@Column(name = "id")
	private int id;
	
	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	@Column(name = "CostCenter")
	private String costCenter;

	public String getCostCenter() {
		return costCenter;
	}



	public void setCostCenter(String costCenter) {
		this.costCenter = costCenter;
	}



	public String getDepartment() {
		return department;
	}



	public void setDepartment(String department) {
		this.department = department;
	}



	@Column(name = "Department")
	private String department;

	

	@Override
	public String toString() {
		return "CensusForm [costCenter=" + costCenter + ", department=" + department + "]";
	}

	
	
	
}
