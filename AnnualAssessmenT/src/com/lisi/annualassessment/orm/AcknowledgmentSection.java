package com.lisi.annualassessment.orm;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "NonExemptSection6 ")
public class AcknowledgmentSection {

	@Column(name = "TMComments")
	private String teamMembersComments;

	@Id
	@Column(name = "Clockid")
	private int clockId;

	@Column(name = "annualYear")
	private String annualYear;

	public String getTeamMembersComments() {
		return teamMembersComments;
	}

	public void setTeamMembersComments(String teamMembersComments) {
		this.teamMembersComments = teamMembersComments;
	}

	public int getClockId() {
		return clockId;
	}

	public void setClockId(int clockId) {
		this.clockId = clockId;
	}

	public String getAnnualYear() {
		return annualYear;
	}

	public void setAnnualYear(String annualYear) {
		this.annualYear = annualYear;
	}
	
	
}
