package com.lisi.annualassessment.pojo;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

@Component
@Scope(value = "session",proxyMode=ScopedProxyMode.TARGET_CLASS)
public class LoginUser {
	
	
	public String username,password,roles,clockNumber,loginYear,employeeForm,classification;
	
	public String exemptEmployeeClock,exemptEmployeeYear,loginExemptRole,exemptEmployeeFormStatus;
	
	public String nonExemptEmployeeClock,nonExemptEmployeeYear;
	
	public String formSubmissionStatus;
	
	
	

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRoles() {
		return roles;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}

	public String getClockNumber() {
		return clockNumber;
	}

	public void setClockNumber(String clockNumber) {
		this.clockNumber = clockNumber;
	}

	public String getLoginYear() {
		return loginYear;
	}

	public void setLoginYear(String loginYear) {
		this.loginYear = loginYear;
	}

	public String getExemptEmployeeClock() {
		return exemptEmployeeClock;
	}

	public void setExemptEmployeeClock(String exemptEmployeeClock) {
		this.exemptEmployeeClock = exemptEmployeeClock;
	}

	public String getExemptEmployeeYear() {
		return exemptEmployeeYear;
	}

	public void setExemptEmployeeYear(String exemptEmployeeYear) {
		this.exemptEmployeeYear = exemptEmployeeYear;
	}

	public String getEmployeeForm() {
		return employeeForm;
	}

	public void setEmployeeForm(String employeeForm) {
		this.employeeForm = employeeForm;
	}

	public String getClassification() {
		return classification;
	}

	public void setClassification(String classification) {
		this.classification = classification;
	}

	public String getLoginExemptRole() {
		return loginExemptRole;
	}

	public void setLoginExemptRole(String loginExemptRole) {
		this.loginExemptRole = loginExemptRole;
	}

	public String getExemptEmployeeFormStatus() {
		return exemptEmployeeFormStatus;
	}

	public void setExemptEmployeeFormStatus(String exemptEmployeeFormStatus) {
		this.exemptEmployeeFormStatus = exemptEmployeeFormStatus;
	}

	public String getNonExemptEmployeeClock() {
		return nonExemptEmployeeClock;
	}

	public void setNonExemptEmployeeClock(String nonExemptEmployeeClock) {
		this.nonExemptEmployeeClock = nonExemptEmployeeClock;
	}

	public String getNonExemptEmployeeYear() {
		return nonExemptEmployeeYear;
	}

	public void setNonExemptEmployeeYear(String nonExemptEmployeeYear) {
		this.nonExemptEmployeeYear = nonExemptEmployeeYear;
	}

	public String getFormSubmissionStatus() {
		return formSubmissionStatus;
	}

	public void setFormSubmissionStatus(String formSubmissionStatus) {
		this.formSubmissionStatus = formSubmissionStatus;
	}

	
	
	
	
	
	
	

}
