package com.lisi.annualassessment.orm;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ExemptSection3")
public class PresentYearObjectives {

	@Id
	@Column(name = "Clockid")
	private int empClockNumber;

	@Column(name = "Section3A1")
	private String objectivesOne;

	@Column(name = "Section3A1Weight")
	private String objectivesOneWeight;

	@Column(name = "Section3A2")
	private String objectivesTwo;

	@Column(name = "Section3A2Weight")
	private String objectivesTwoWeight;

	@Column(name = "Section3A3")
	private String objectivesThree;

	@Column(name = "Section3A3Weight")
	private String objectivesThreeWeight;

	@Column(name = "Section3A4")
	private String objectivesFour;

	@Column(name = "Section3A4Weight")
	private String objectivesFourWeight;

	@Column(name = "Section3A5")
	private String objectivesFive;

	@Column(name = "Section3A5Weight")
	private String objectivesFiveWeight;
	
	@Column(name = "OverallScore")
	private String overallScore;

	@Column(name = "AppraisalYear")
	private String annaulYear;

	/*development Goals*/
	
	@Column(name="Section3B1")
	private String developmentGoalsOne;
	
	@Column(name="Section3B2")
	private String developmentGoalsTwo;
	
	@Column(name="Section3B3")
	private String developmentGoalsThree;
	
	@Column(name="Section3B4")
	private String developmentGoalsFour;
	
	@Column(name="Section3B5")
	private String developmentGoalsFive;
	
	
	// meeting summary
	
	@Column(name="Section3C1")
	private String meetingSummaryManager;
	
	@Column(name="Section3C2")
	private String meetingSummaryTeamMember;
	
	
	public String getObjectivesOne() {
		return objectivesOne;
	}

	public void setObjectivesOne(String objectivesOne) {
		this.objectivesOne = objectivesOne;
	}

	public String getObjectivesOneWeight() {
		return objectivesOneWeight;
	}

	public void setObjectivesOneWeight(String objectivesOneWeight) {
		this.objectivesOneWeight = objectivesOneWeight;
	}

	public String getObjectivesTwo() {
		return objectivesTwo;
	}

	public void setObjectivesTwo(String objectivesTwo) {
		this.objectivesTwo = objectivesTwo;
	}

	public String getObjectivesTwoWeight() {
		return objectivesTwoWeight;
	}

	public void setObjectivesTwoWeight(String objectivesTwoWeight) {
		this.objectivesTwoWeight = objectivesTwoWeight;
	}

	public String getObjectivesThree() {
		return objectivesThree;
	}

	public void setObjectivesThree(String objectivesThree) {
		this.objectivesThree = objectivesThree;
	}

	public String getObjectivesThreeWeight() {
		return objectivesThreeWeight;
	}

	public void setObjectivesThreeWeight(String objectivesThreeWeight) {
		this.objectivesThreeWeight = objectivesThreeWeight;
	}

	public String getObjectivesFour() {
		return objectivesFour;
	}

	public void setObjectivesFour(String objectivesFour) {
		this.objectivesFour = objectivesFour;
	}

	public String getObjectivesFourWeight() {
		return objectivesFourWeight;
	}

	public void setObjectivesFourWeight(String objectivesFourWeight) {
		this.objectivesFourWeight = objectivesFourWeight;
	}

	public String getObjectivesFive() {
		return objectivesFive;
	}

	public void setObjectivesFive(String objectivesFive) {
		this.objectivesFive = objectivesFive;
	}

	public String getObjectivesFiveWeight() {
		return objectivesFiveWeight;
	}

	public void setObjectivesFiveWeight(String objectivesFiveWeight) {
		this.objectivesFiveWeight = objectivesFiveWeight;
	}

	public int getEmpClockNumber() {
		return empClockNumber;
	}

	public void setEmpClockNumber(int empClockNumber) {
		this.empClockNumber = empClockNumber;
	}

	public String getOverallScore() {
		return overallScore;
	}

	public void setOverallScore(String overallScore) {
		this.overallScore = overallScore;
	}

	public String getAnnaulYear() {
		return annaulYear;
	}

	public void setAnnaulYear(String annaulYear) {
		this.annaulYear = annaulYear;
	}

	public String getDevelopmentGoalsOne() {
		return developmentGoalsOne;
	}

	public void setDevelopmentGoalsOne(String developmentGoalsOne) {
		this.developmentGoalsOne = developmentGoalsOne;
	}

	public String getDevelopmentGoalsTwo() {
		return developmentGoalsTwo;
	}

	public void setDevelopmentGoalsTwo(String developmentGoalsTwo) {
		this.developmentGoalsTwo = developmentGoalsTwo;
	}

	public String getDevelopmentGoalsThree() {
		return developmentGoalsThree;
	}

	public void setDevelopmentGoalsThree(String developmentGoalsThree) {
		this.developmentGoalsThree = developmentGoalsThree;
	}

	public String getDevelopmentGoalsFour() {
		return developmentGoalsFour;
	}

	public void setDevelopmentGoalsFour(String developmentGoalsFour) {
		this.developmentGoalsFour = developmentGoalsFour;
	}

	public String getDevelopmentGoalsFive() {
		return developmentGoalsFive;
	}

	public void setDevelopmentGoalsFive(String developmentGoalsFive) {
		this.developmentGoalsFive = developmentGoalsFive;
	}

	public String getMeetingSummaryManager() {
		return meetingSummaryManager;
	}

	public void setMeetingSummaryManager(String meetingSummaryManager) {
		this.meetingSummaryManager = meetingSummaryManager;
	}

	public String getMeetingSummaryTeamMember() {
		return meetingSummaryTeamMember;
	}

	public void setMeetingSummaryTeamMember(String meetingSummaryTeamMember) {
		this.meetingSummaryTeamMember = meetingSummaryTeamMember;
	}

	
	
	
	
}
