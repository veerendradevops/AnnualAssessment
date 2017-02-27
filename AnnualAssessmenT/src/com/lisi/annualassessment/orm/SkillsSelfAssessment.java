package com.lisi.annualassessment.orm;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ExemptSelfAssessment")
public class SkillsSelfAssessment implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="EmpClockNumber")
	private int empClockNumber;
	
	@Column(name="Section1G1")
	private String section1G1;
	
	@Column(name="Section1G2")
	private String section1G2;
	
	@Column(name="Section1G3")
	private String section1G3;
	
	@Column(name="Section1G4")
	private String section1G4;
	
	@Column(name="Section1G5")
	private String section1G5;
	
	@Column(name="AppraisalYear")
	private String appraisalYear;

	

		
		
	

	/**
	 * @return the empClockNumber
	 */
	public int getEmpClockNumber() {
		return empClockNumber;
	}

	/**
	 * @param empClockNumber the empClockNumber to set
	 */
	public void setEmpClockNumber(int empClockNumber) {
		this.empClockNumber = empClockNumber;
	}

	/**
	 * @return the section1G1
	 */
	public String getSection1G1() {
		return section1G1;
	}

	/**
	 * @param section1g1 the section1G1 to set
	 */
	public void setSection1G1(String section1g1) {
		section1G1 = section1g1;
	}

	/**
	 * @return the section1G2
	 */
	public String getSection1G2() {
		return section1G2;
	}

	/**
	 * @param section1g2 the section1G2 to set
	 */
	public void setSection1G2(String section1g2) {
		section1G2 = section1g2;
	}

	/**
	 * @return the section1G3
	 */
	public String getSection1G3() {
		return section1G3;
	}

	/**
	 * @param section1g3 the section1G3 to set
	 */
	public void setSection1G3(String section1g3) {
		section1G3 = section1g3;
	}

	/**
	 * @return the section1G4
	 */
	public String getSection1G4() {
		return section1G4;
	}

	/**
	 * @param section1g4 the section1G4 to set
	 */
	public void setSection1G4(String section1g4) {
		section1G4 = section1g4;
	}

	/**
	 * @return the section1G5
	 */
	public String getSection1G5() {
		return section1G5;
	}

	/**
	 * @param section1g5 the section1G5 to set
	 */
	public void setSection1G5(String section1g5) {
		section1G5 = section1g5;
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
