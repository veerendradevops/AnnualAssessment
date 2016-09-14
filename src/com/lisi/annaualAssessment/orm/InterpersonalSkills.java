package com.lisi.annaualAssessment.orm;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

//INTERPERSONAL SKILLS class
@Entity

@Table(name = "NonExemptSection2")
public class InterpersonalSkills {

	// InterpersonalSkills all variables
	@Id
	@Column(name = "Clockid")
	private int clockId;

	@Column(name = "ResponsibilityScore")
	private String responsibilityScore;

	@Column(name = "ResponsibilitySupervisorComment")
	private String responsibilitySupervisorsComments;

	@Column(name = "AdaptabilityScore")
	private String adaptabilityScore;

	@Column(name = "AdaptabilitySupervisorComments")
	private String adaptabilitySupervisorsComments;

	@Column(name = "InitiativeScore")
	private String initiativeScore;

	@Column(name = "InitiativeSupervisorComments")
	private String initiativeSupervisorsComments;

	@Column(name = "JudgementScore")
	private String judgementScore;

	@Column(name = "JudgementSupervisorComents")
	private String judgementSupervisorsComments;

	@Column(name = "WrittenandOralCommunicationScore")
	private String writtenAndOralCommunicationScore;

	@Column(name = "WrittenandOralCommunicationSupervisorComments")
	private String writtenAndOralCommunicationSupervisorsComments;

	@Column(name = "AttendancePunctualityandCommitmentScore")
	private String punctualityAndCommitmentScore;

	@Column(name = "AttendancePunctualityandCommitmentSupervisorComment")
	private String punctualityAndCommitmentSupervisorsComments;

	@Column(name = "AnnualYear")
	private String annualYear;
	
	@Column(name="averageScore")
	private String avgScore;

	// All variables setters and getters methods
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


	public String getResponsibilitySupervisorsComments() {
		return responsibilitySupervisorsComments;
	}

	public void setResponsibilitySupervisorsComments(String responsibilitySupervisorsComments) {
		this.responsibilitySupervisorsComments = responsibilitySupervisorsComments;
	}

	

	public String getAdaptabilitySupervisorsComments() {
		return adaptabilitySupervisorsComments;
	}

	public void setAdaptabilitySupervisorsComments(String adaptabilitySupervisorsComments) {
		this.adaptabilitySupervisorsComments = adaptabilitySupervisorsComments;
	}

	public String getInitiativeSupervisorsComments() {
		return initiativeSupervisorsComments;
	}

	public void setInitiativeSupervisorsComments(String initiativeSupervisorsComments) {
		this.initiativeSupervisorsComments = initiativeSupervisorsComments;
	}

	

	public String getJudgementSupervisorsComments() {
		return judgementSupervisorsComments;
	}

	public void setJudgementSupervisorsComments(String judgementSupervisorsComments) {
		this.judgementSupervisorsComments = judgementSupervisorsComments;
	}

	

	public String getWrittenAndOralCommunicationSupervisorsComments() {
		return writtenAndOralCommunicationSupervisorsComments;
	}

	public void setWrittenAndOralCommunicationSupervisorsComments(
			String writtenAndOralCommunicationSupervisorsComments) {
		this.writtenAndOralCommunicationSupervisorsComments = writtenAndOralCommunicationSupervisorsComments;
	}

	

	public String getPunctualityAndCommitmentSupervisorsComments() {
		return punctualityAndCommitmentSupervisorsComments;
	}

	public void setPunctualityAndCommitmentSupervisorsComments(String punctualityAndCommitmentSupervisorsComments) {
		this.punctualityAndCommitmentSupervisorsComments = punctualityAndCommitmentSupervisorsComments;
	}

	public String getAvgScore() {
		return avgScore;
	}

	public void setAvgScore(String avgScore) {
		this.avgScore = avgScore;
	}

	public String getResponsibilityScore() {
		return responsibilityScore;
	}

	public void setResponsibilityScore(String responsibilityScore) {
		this.responsibilityScore = responsibilityScore;
	}

	public String getAdaptabilityScore() {
		return adaptabilityScore;
	}

	public void setAdaptabilityScore(String adaptabilityScore) {
		this.adaptabilityScore = adaptabilityScore;
	}

	public String getInitiativeScore() {
		return initiativeScore;
	}

	public void setInitiativeScore(String initiativeScore) {
		this.initiativeScore = initiativeScore;
	}

	public String getJudgementScore() {
		return judgementScore;
	}

	public void setJudgementScore(String judgementScore) {
		this.judgementScore = judgementScore;
	}

	public String getWrittenAndOralCommunicationScore() {
		return writtenAndOralCommunicationScore;
	}

	public void setWrittenAndOralCommunicationScore(String writtenAndOralCommunicationScore) {
		this.writtenAndOralCommunicationScore = writtenAndOralCommunicationScore;
	}

	public String getPunctualityAndCommitmentScore() {
		return punctualityAndCommitmentScore;
	}

	public void setPunctualityAndCommitmentScore(String punctualityAndCommitmentScore) {
		this.punctualityAndCommitmentScore = punctualityAndCommitmentScore;
	}

	
	
	

}
