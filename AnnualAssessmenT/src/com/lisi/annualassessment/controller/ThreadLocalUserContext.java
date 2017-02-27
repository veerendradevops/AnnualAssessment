package com.lisi.annualassessment.controller;

import com.lisi.annualassessment.pojo.WebUserRole;

public class ThreadLocalUserContext implements UserContext {

	private static final ThreadLocal webContext = new ThreadLocal();

	public ThreadLocalUserContext() {
		WebUserRole context = new WebUserRole();
		webContext.set(context);
	}

	@Override
	public String employeeRole() {
		// TODO Auto-generated method stub
		return ((WebUserRole) webContext.get()).getEmployee();
	}

	@Override
	public String employeeSupervisorRole() {
		// TODO Auto-generated method stub
		return ((WebUserRole) webContext.get()).getEmployeeSupervisor();
	}

	public void setWebUserContext(UserContext sessionContext) {
		webContext.set(sessionContext);

	}

}
