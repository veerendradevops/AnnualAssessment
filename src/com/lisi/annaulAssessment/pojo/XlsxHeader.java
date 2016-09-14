package com.lisi.annaulAssessment.pojo;

public enum XlsxHeader {
	
	EmpClockNumber("Clock Number"),emplastName("Last Name"),empfirstName("First Name"),
	companyPSID("Company PSID"),EStatus("E Status"),factoryLocation("Factory / Location"),
	JobTitle("Job Title"),company("Company"),shift("Shift"),costCenter("Cost Center"),dateOfHire("DOH"),
	classification("Classification"),emailAddress("Email Address"),supervisorLName("Supervisor L Name"),
	supervisorFName("Supervisor F Name"),supervisorClockNumber("Supervisor Clock"),
	supervisorCostCenter("Supervisor Cost Center"),
	HRManagerLname("HR Manager L name"),HRManagerFname("HR Manager F Name"),
	HRManagerClock("HR Manager Clock"),HrManagerCostCenter("HR Manager Cost Center"),
	HRGeneralistLname("HR Generalist L Name"),HRGeneralistFName("HR Generalist F Name"),
	HRGeneralistClock("HR Gen Clock"),
	HrGenerlistCostCenter("HR Gen Cost Center"),mor("MoR"),discDate("Disc Date"),
	disciplinaryDescription("Disciplinary Description"),
	increaseYN("Increase (Y/N)"),JobAttribute("Job Attribute 2"),reasonForCompRecord("Reason For Comp Record"),
	startDate("Start Date"),
	min("Min"),max("Max"),mid("Mid"),payGrade("Paygrade"),currentHrlRate("Hrly Rate"),
	currentAnnualRate("Annual Rate");
	
	
	
	
	

	

	private final String value;



	public String getValue() {
		return value;
	}



	private XlsxHeader(String value) {
		this.value = value;
	}



	
	
	
	
	
	
}
