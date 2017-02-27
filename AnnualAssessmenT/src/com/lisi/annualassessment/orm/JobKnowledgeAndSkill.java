package com.lisi.annualassessment.orm;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

//Class for JOB KNOWLEDGE & SKILLS
@Entity

@Table(name = "NonExemptSection3")
public class JobKnowledgeAndSkill {

	@Id

	@Column(name = "Clockid")
	private int clockId;

	@Column(name = "SafetyScore")
	private String  safetyScore;

	@Column(name = "SafetySupervisorComments")
	private String safetySupervisorsComments;

	@Column(name = "QualityScore")
	private String qualityScore;

	@Column(name = "QualitySupervisorComments")
	private String qualitySupervisorsComments;

	@Column(name = "ProductivityScore")
	private String productivityScore;

	@Column(name = "ProductivitySupervisorComments")
	private String productivitySupervisorsComments;

	@Column(name = "JobKnowledgeandSkillsScore")
	private String jobKnowledgeAndSkillsScore;

	@Column(name = "JobKnowledgeSkillsSupervisorComments")
	private String jobKnowledgeAndSkillsSupervisorsComments;

	@Column(name = "Supervisorsoverallcomments")
	private String supervisorsOverallComments;

	@Column(name = "AnnualPerformance")
	private String annualYear;
	
	@Column(name="AverageScore")
	private String avgScore;
	
	@Column(name="SummaryPerformanceAvgScore")
	private String summaryAvgScore;
	
	@Column(name="supervisorstatus")
	private String supervisorstatus;

	public String getSummaryAvgScore() {
		return summaryAvgScore;
		
		
	}
	
	

	public void setSummaryAvgScore(String summaryAvgScore) {
		this.summaryAvgScore = summaryAvgScore;
	}

	public int getClockId() {
		return clockId;
	}

	public void setClockId(int clockId) {
		this.clockId = clockId;
	}

	public String getSafetyScore() {
		return safetyScore;
	}

	public void setSafetyScore(String safetyScore) {
		this.safetyScore = safetyScore;
	}

	public String getSafetySupervisorsComments() {
		return safetySupervisorsComments;
	}

	public void setSafetySupervisorsComments(String safetySupervisorsComments) {
		this.safetySupervisorsComments = safetySupervisorsComments;
	}

	public String getQualityScore() {
		return qualityScore;
	}

	public void setQualityScore(String qualityScore) {
		this.qualityScore = qualityScore;
	}

	public String getQualitySupervisorsComments() {
		return qualitySupervisorsComments;
	}

	public void setQualitySupervisorsComments(String qualitySupervisorsComments) {
		this.qualitySupervisorsComments = qualitySupervisorsComments;
	}

	public String getProductivityScore() {
		return productivityScore;
	}

	public void setProductivityScore(String productivityScore) {
		this.productivityScore = productivityScore;
	}

	public String getProductivitySupervisorsComments() {
		return productivitySupervisorsComments;
	}

	public void setProductivitySupervisorsComments(String productivitySupervisorsComments) {
		this.productivitySupervisorsComments = productivitySupervisorsComments;
	}

	public String getJobKnowledgeAndSkillsScore() {
		return jobKnowledgeAndSkillsScore;
	}

	public void setJobKnowledgeAndSkillsScore(String jobKnowledgeAndSkillsScore) {
		this.jobKnowledgeAndSkillsScore = jobKnowledgeAndSkillsScore;
	}

	public String getJobKnowledgeAndSkillsSupervisorsComments() {
		return jobKnowledgeAndSkillsSupervisorsComments;
	}

	public void setJobKnowledgeAndSkillsSupervisorsComments(String jobKnowledgeAndSkillsSupervisorsComments) {
		this.jobKnowledgeAndSkillsSupervisorsComments = jobKnowledgeAndSkillsSupervisorsComments;
	}

	public String getSupervisorsOverallComments() {
		return supervisorsOverallComments;
	}

	public void setSupervisorsOverallComments(String supervisorsOverallComments) {
		this.supervisorsOverallComments = supervisorsOverallComments;
	}

	public String getAnnualYear() {
		return annualYear;
	}

	public void setAnnualYear(String annualYear) {
		this.annualYear = annualYear;
	}

	public String getAvgScore() {
		return avgScore;
	}

	public void setAvgScore(String avgScore) {
		this.avgScore = avgScore;
	}



	public String getSupervisorstatus() {
		return supervisorstatus;
	}



	public void setSupervisorstatus(String supervisorstatus) {
		this.supervisorstatus = supervisorstatus;
	}

	

	
	
}
