package com.lisi.annaulAssessment.pojo;

public class WebUserRole {

	
	private String employee;
	
	private String employeeSupervisor;

	public String getEmployee() {
		return employee;
	}

	public void setEmployee(String employee) {
		this.employee = employee;
	}

	public String getEmployeeSupervisor() {
		return employeeSupervisor;
	}

	public void setEmployeeSupervisor(String employeeSupervisor) {
		this.employeeSupervisor = employeeSupervisor;
	}

	public WebUserRole(String employee, String employeeSupervisor) {
		super();
		this.employee = employee;
		this.employeeSupervisor = employeeSupervisor;
	}

	public WebUserRole() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
