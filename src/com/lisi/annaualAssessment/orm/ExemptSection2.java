/**
 * 
 */
package com.lisi.annaualAssessment.orm;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author manikanta.b
 *
 */
// SECTION II – TO BE COMPLETED BY MANAGER
@Entity
@Table(name = "ExemptSection2")
public class ExemptSection2 implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3424999351771836338L;
	@Id
	@Column(name = "Clockid")
	private int empClockNumber;
	// A. OBJECTIVE ACHIEVEMENT LEVEL FOR 2015
	@Column(name = "Section2A1Objective")
	private String section2A1Objective;
	@Column(name = "Section2A1Level")
	private int section2A1Level;
	@Column(name = "Section2A2Objective")
	private String section2A2Objective;
	@Column(name = "Section2A2Level")
	private int section2A2Level;
	@Column(name = "Section2A3Objective")
	private String section2A3Objective;
	@Column(name = "Section2A3Level")
	private int section2A3Level;
	@Column(name = "Section2A4Objective")
	private String section2A4Objective;
	@Column(name = "Section2A4Level")
	private int section2A4Level;
	@Column(name = "Section2A5Objective")
	private String section2A5Objective;
	@Column(name = "Section2A5Level")
	private int section2A5Level;
	@Column(name = "Section2AdditionalComments")
	private String section2AdditionalComments;
	
	
	@Column(name = "OverallScore")
	private String overallScore;
	
	
	// B. MANAGER’S SKILL COMPETENCY ASSESMENT
	@Column(name = "Section2B1")
	private String section2B1;
	
	@Column(name = "Section2B2")
	private String section2B2;
	
	@Column(name = "Section2B3")
	private String section2B3;
	// MANAGER’S ASSESMENT SUMMARY
	@Column(name = "Section2C1")
	private String section2CSummeryStrength;
	@Column(name = "Section2C2")
	private String section2CSummeryImprovement;
	// SUMMARY OF ACCOMPLISHMENT AND DEVELOPMENT AREAS FOR IMPROVEMENT
	@Column(name = "Section2D1")
	private String section2DSummeryOfAccomplishmentAndAreasImprovement;
	// OVERALL RATING PER MANAGER
	@Column(name = "Section2E1")
	private String section2EAssessmentSummary;
	@Column(name = "Section2E2")
	private String section2EAssessmentcompared;
	@Column(name = "AppraisalYear")
	private String appraisalYear;

	
	
	// pojo variables..
	
	private String skills1;
	private String skills2;
	private String skills3;
	private String skills4;
	private String skills5;
	private String skills6;
	private String skills7;
	private String skills8;
	private String skills9;
	private String skills10;
	
	//section2b2
	private String waysOfWorking1;
	private String waysOfWorking2;
	private String waysOfWorking3;
	private String waysOfWorking4;
	private String waysOfWorking5;
	private String waysOfWorking6;
	private String waysOfWorking7;
	
	//section2b3
	private String selfManagementandLeadership1;
	private String selfManagementandLeadership2;
	private String selfManagementandLeadership3;
	private String selfManagementandLeadership4;
	private String selfManagementandLeadership5;
	private String selfManagementandLeadership6;
	private String selfManagementandLeadership7;
	
	
	
	public String getSkills1() {
		return skills1;
	}

	public void setSkills1(String skills1) {
		this.skills1 = skills1;
	}

	public String getSkills2() {
		return skills2;
	}

	public void setSkills2(String skills2) {
		this.skills2 = skills2;
	}

	public String getSkills3() {
		return skills3;
	}

	public void setSkills3(String skills3) {
		this.skills3 = skills3;
	}

	public String getSkills4() {
		return skills4;
	}

	public void setSkills4(String skills4) {
		this.skills4 = skills4;
	}

	public String getSkills5() {
		return skills5;
	}

	public void setSkills5(String skills5) {
		this.skills5 = skills5;
	}

	public String getSkills6() {
		return skills6;
	}

	public void setSkills6(String skills6) {
		this.skills6 = skills6;
	}

	public String getSkills7() {
		return skills7;
	}

	public void setSkills7(String skills7) {
		this.skills7 = skills7;
	}

	public String getSkills8() {
		return skills8;
	}

	public void setSkills8(String skills8) {
		this.skills8 = skills8;
	}

	public String getSkills9() {
		return skills9;
	}

	public void setSkills9(String skills9) {
		this.skills9 = skills9;
	}

	public String getWaysOfWorking1() {
		return waysOfWorking1;
	}

	public void setWaysOfWorking1(String waysOfWorking1) {
		this.waysOfWorking1 = waysOfWorking1;
	}

	public String getWaysOfWorking2() {
		return waysOfWorking2;
	}

	public void setWaysOfWorking2(String waysOfWorking2) {
		this.waysOfWorking2 = waysOfWorking2;
	}

	public String getWaysOfWorking3() {
		return waysOfWorking3;
	}

	public void setWaysOfWorking3(String waysOfWorking3) {
		this.waysOfWorking3 = waysOfWorking3;
	}

	public String getWaysOfWorking4() {
		return waysOfWorking4;
	}

	public void setWaysOfWorking4(String waysOfWorking4) {
		this.waysOfWorking4 = waysOfWorking4;
	}

	public String getWaysOfWorking5() {
		return waysOfWorking5;
	}

	public void setWaysOfWorking5(String waysOfWorking5) {
		this.waysOfWorking5 = waysOfWorking5;
	}

	public String getWaysOfWorking6() {
		return waysOfWorking6;
	}

	public void setWaysOfWorking6(String waysOfWorking6) {
		this.waysOfWorking6 = waysOfWorking6;
	}

	public String getWaysOfWorking7() {
		return waysOfWorking7;
	}

	public void setWaysOfWorking7(String waysOfWorking7) {
		this.waysOfWorking7 = waysOfWorking7;
	}

	public String getSelfManagementandLeadership1() {
		return selfManagementandLeadership1;
	}

	public void setSelfManagementandLeadership1(String selfManagementandLeadership1) {
		this.selfManagementandLeadership1 = selfManagementandLeadership1;
	}

	public String getSelfManagementandLeadership2() {
		return selfManagementandLeadership2;
	}

	public void setSelfManagementandLeadership2(String selfManagementandLeadership2) {
		this.selfManagementandLeadership2 = selfManagementandLeadership2;
	}

	public String getSelfManagementandLeadership3() {
		return selfManagementandLeadership3;
	}

	public void setSelfManagementandLeadership3(String selfManagementandLeadership3) {
		this.selfManagementandLeadership3 = selfManagementandLeadership3;
	}

	public String getSelfManagementandLeadership4() {
		return selfManagementandLeadership4;
	}

	public void setSelfManagementandLeadership4(String selfManagementandLeadership4) {
		this.selfManagementandLeadership4 = selfManagementandLeadership4;
	}

	public String getSelfManagementandLeadership5() {
		return selfManagementandLeadership5;
	}

	public void setSelfManagementandLeadership5(String selfManagementandLeadership5) {
		this.selfManagementandLeadership5 = selfManagementandLeadership5;
	}

	public String getSelfManagementandLeadership6() {
		return selfManagementandLeadership6;
	}

	public void setSelfManagementandLeadership6(String selfManagementandLeadership6) {
		this.selfManagementandLeadership6 = selfManagementandLeadership6;
	}

	public String getSelfManagementandLeadership7() {
		return selfManagementandLeadership7;
	}

	public void setSelfManagementandLeadership7(String selfManagementandLeadership7) {
		this.selfManagementandLeadership7 = selfManagementandLeadership7;
	}

	public String getSkills10() {
		return skills10;
	}

	public void setSkills10(String skills10) {
		this.skills10 = skills10;
	}

	/**
	 * @return the empClockNumber
	 */
	public int getEmpClockNumber() {
		return empClockNumber;
	}

	/**
	 * @param empClockNumber
	 *            the empClockNumber to set
	 */
	public void setEmpClockNumber(int empClockNumber) {
		this.empClockNumber = empClockNumber;
	}

	/**
	 * @return the section2A1Objective
	 */
	public String getSection2A1Objective() {
		return section2A1Objective;
	}

	/**
	 * @param section2a1Objective
	 *            the section2A1Objective to set
	 */
	public void setSection2A1Objective(String section2a1Objective) {
		section2A1Objective = section2a1Objective;
	}

	/**
	 * @return the section2A1Level
	 */
	public int getSection2A1Level() {
		return section2A1Level;
	}

	/**
	 * @param section2a1Level
	 *            the section2A1Level to set
	 */
	public void setSection2A1Level(int section2a1Level) {
		section2A1Level = section2a1Level;
	}

	/**
	 * @return the section2A2Objective
	 */
	public String getSection2A2Objective() {
		return section2A2Objective;
	}

	/**
	 * @param section2a2Objective
	 *            the section2A2Objective to set
	 */
	public void setSection2A2Objective(String section2a2Objective) {
		section2A2Objective = section2a2Objective;
	}

	/**
	 * @return the section2A2Level
	 */
	public int getSection2A2Level() {
		return section2A2Level;
	}

	/**
	 * @param section2a2Level
	 *            the section2A2Level to set
	 */
	public void setSection2A2Level(int section2a2Level) {
		section2A2Level = section2a2Level;
	}

	/**
	 * @return the section2A3Objective
	 */
	public String getSection2A3Objective() {
		return section2A3Objective;
	}

	/**
	 * @param section2a3Objective
	 *            the section2A3Objective to set
	 */
	public void setSection2A3Objective(String section2a3Objective) {
		section2A3Objective = section2a3Objective;
	}

	/**
	 * @return the section2A3Level
	 */
	public int getSection2A3Level() {
		return section2A3Level;
	}

	/**
	 * @param section2a3Level
	 *            the section2A3Level to set
	 */
	public void setSection2A3Level(int section2a3Level) {
		section2A3Level = section2a3Level;
	}

	/**
	 * @return the section2A4Objective
	 */
	public String getSection2A4Objective() {
		return section2A4Objective;
	}

	/**
	 * @param section2a4Objective
	 *            the section2A4Objective to set
	 */
	public void setSection2A4Objective(String section2a4Objective) {
		section2A4Objective = section2a4Objective;
	}

	/**
	 * @return the section2A4Level
	 */
	public int getSection2A4Level() {
		return section2A4Level;
	}

	/**
	 * @param section2a4Level
	 *            the section2A4Level to set
	 */
	public void setSection2A4Level(int section2a4Level) {
		section2A4Level = section2a4Level;
	}

	/**
	 * @return the section2A5Objective
	 */
	public String getSection2A5Objective() {
		return section2A5Objective;
	}

	/**
	 * @param section2a5Objective
	 *            the section2A5Objective to set
	 */
	public void setSection2A5Objective(String section2a5Objective) {
		section2A5Objective = section2a5Objective;
	}

	/**
	 * @return the section2A5Level
	 */
	public int getSection2A5Level() {
		return section2A5Level;
	}

	/**
	 * @param section2a5Level
	 *            the section2A5Level to set
	 */
	public void setSection2A5Level(int section2a5Level) {
		section2A5Level = section2a5Level;
	}

	/**
	 * @return the section2AdditionalComments
	 */
	public String getSection2AdditionalComments() {
		return section2AdditionalComments;
	}

	/**
	 * @param section2AdditionalComments
	 *            the section2AdditionalComments to set
	 */
	public void setSection2AdditionalComments(String section2AdditionalComments) {
		this.section2AdditionalComments = section2AdditionalComments;
	}

	/**
	 * @return the overallScore
	 */
	public String getOverallScore() {
		return overallScore;
	}

	/**
	 * @param overallScore
	 *            the overallScore to set
	 */
	public void setOverallScore(String overallScore) {
		this.overallScore = overallScore;
	}

	

	/**
	 * @return the section2B1
	 */
	public String getSection2B1() {
		return section2B1;
	}

	/**
	 * @param section2b1 the section2B1 to set
	 */
	public void setSection2B1(String section2b1) {
		section2B1 = section2b1;
	}

	/**
	 * @return the section2B2
	 */
	public String getSection2B2() {
		return section2B2;
	}

	/**
	 * @param section2b2 the section2B2 to set
	 */
	public void setSection2B2(String section2b2) {
		section2B2 = section2b2;
	}

	/**
	 * @return the section2B3
	 */
	public String getSection2B3() {
		return section2B3;
	}

	/**
	 * @param section2b3 the section2B3 to set
	 */
	public void setSection2B3(String section2b3) {
		section2B3 = section2b3;
	}

	/**
	 * @return the section2CSummeryStrength
	 */
	public String getSection2CSummeryStrength() {
		return section2CSummeryStrength;
	}

	/**
	 * @param section2cSummeryStrength
	 *            the section2CSummeryStrength to set
	 */
	public void setSection2CSummeryStrength(String section2cSummeryStrength) {
		section2CSummeryStrength = section2cSummeryStrength;
	}

	/**
	 * @return the section2CSummeryImprovement
	 */
	public String getSection2CSummeryImprovement() {
		return section2CSummeryImprovement;
	}

	/**
	 * @param section2cSummeryImprovement
	 *            the section2CSummeryImprovement to set
	 */
	public void setSection2CSummeryImprovement(String section2cSummeryImprovement) {
		section2CSummeryImprovement = section2cSummeryImprovement;
	}

	/**
	 * @return the section2DSummeryOfAccomplishmentAndAreasImprovement
	 */
	public String getSection2DSummeryOfAccomplishmentAndAreasImprovement() {
		return section2DSummeryOfAccomplishmentAndAreasImprovement;
	}

	/**
	 * @param section2dSummeryOfAccomplishmentAndAreasImprovement
	 *            the section2DSummeryOfAccomplishmentAndAreasImprovement to set
	 */
	public void setSection2DSummeryOfAccomplishmentAndAreasImprovement(
			String section2dSummeryOfAccomplishmentAndAreasImprovement) {
		section2DSummeryOfAccomplishmentAndAreasImprovement = section2dSummeryOfAccomplishmentAndAreasImprovement;
	}

	/**
	 * @return the section2EAssessmentSummary
	 */
	public String getSection2EAssessmentSummary() {
		return section2EAssessmentSummary;
	}

	/**
	 * @param section2eAssessmentSummary
	 *            the section2EAssessmentSummary to set
	 */
	public void setSection2EAssessmentSummary(String section2eAssessmentSummary) {
		section2EAssessmentSummary = section2eAssessmentSummary;
	}

	/**
	 * @return the section2EAssessmentcompared
	 */
	public String getSection2EAssessmentcompared() {
		return section2EAssessmentcompared;
	}

	/**
	 * @param section2eAssessmentcompared
	 *            the section2EAssessmentcompared to set
	 */
	public void setSection2EAssessmentcompared(String section2eAssessmentcompared) {
		section2EAssessmentcompared = section2eAssessmentcompared;
	}

	

	/**
	 * @return the appraisalYear
	 */
	public String getAppraisalYear() {
		return appraisalYear;
	}

	/**
	 * @param appraisalYear the appraisalYear to set
	 */
	public void setAppraisalYear(String appraisalYear) {
		this.appraisalYear = appraisalYear;
	}

	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
