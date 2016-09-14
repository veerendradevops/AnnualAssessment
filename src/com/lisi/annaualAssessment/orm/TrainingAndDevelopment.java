package com.lisi.annaualAssessment.orm;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "NonExemptSection5 ")
public class TrainingAndDevelopment {
	@Id
	@Column(name = "Clockid")
	private int clockId;

	@Column(name = "firstAreaorFocus")
	private String firstAreaorFocus;

	@Column(name = "firstTrainingDescription")
	private String  firstTrainingDescription;

	@Column(name = " firstTrainingTopic")
	private String  firstTrainingTopic;


	@Column(name = "firstDateDue")
	private Date firstDateDue;

	@Column(name = "secondAreaorFocus")
	private String secondAreaorFocus;

	@Column(name = " secondTrainingTopic")
	private String  secondTrainingTopic;

	@Column(name = "secondTrainingDescription")
	private String secondTrainingDescription;

	@Column(name = "secondDateDue")
	private Date secondfDateDue;

	@Column(name = "thirdAreaorFocus")
	private String thirdAreaorFocus;

	@Column(name = " thirdTrainingTopic")
	private String  thirdTrainingTopic;

	@Column(name = "thirdTrainingDecscription")
	private String thirdTrainingDescription;

	@Column(name = "thirdDateDue")
	private Date thirdDateDue;

	@Column(name = "AnnualYear")
	private String annualYear;

	public int getClockId() {
		return clockId;
	}

	public void setClockId(int clockId) {
		this.clockId = clockId;
	}

	public String getFirstAreaorFocus() {
		return firstAreaorFocus;
	}

	public void setFirstAreaorFocus(String firstAreaorFocus) {
		this.firstAreaorFocus = firstAreaorFocus;
	}

	public String getfirstTrainingTopic()
	{
		return firstTrainingTopic;
	}
		public void setfirstTrainingTopic(String firstTrainingTopic) {
			this.firstTrainingTopic=firstTrainingTopic;
			
		}
	public String getfirstTrainingDescription()
	{
		return firstTrainingDescription;
	}
		public void setfirstTrainingDescription(String firstTrainingDescription) {
			this.firstTrainingDescription=firstTrainingDescription;
			
		}

public Date getFirstDateDue() {
		return firstDateDue;
	}

	public void setFirstDateDue(Date firstDateDue) {
		this.firstDateDue = firstDateDue;
	}

	public String getSecondAreaorFocus() {
		return secondAreaorFocus;
	}

	public void setSecondAreaorFocus(String secondAreaorFocus) {
		this.secondAreaorFocus = secondAreaorFocus;
	}


	public Date getSecondfDateDue() {
		return secondfDateDue;
	}

	public void setSecondDateDue(Date secondfDateDue) {
		
		this.secondfDateDue=secondfDateDue;
	}

	
	public String getSecondTrainingTopic()
	{
		return secondTrainingTopic;
	}
		public void setSecondTrainingTopic(String SecondTrainingTopic) {
			this.secondTrainingTopic=SecondTrainingTopic;
			
		}
	public String getSecondTrainingDescription()
	{
		return secondTrainingDescription;
	}
		public void setSecondTrainingDescription(String SecondTrainingDescription) {
			this.secondTrainingDescription=SecondTrainingDescription;
			
		}
	public String getThirdAreaorFocus() {
		return thirdAreaorFocus;
	}

	public void setThirdAreaorFocus(String thirdAreaorFocus) {
		this.thirdAreaorFocus = thirdAreaorFocus;
	}
	public String getThirdTrainingTopic()
	{
		return thirdTrainingTopic;
	}
		public void setThirdTrainingTopic(String ThirdTrainingTopic) {
			this.thirdTrainingTopic=ThirdTrainingTopic;
			
		}
	public String getThirdTrainingDescription()
	{
		return thirdTrainingDescription;
	}
		public void setThirdTrainingDescription(String ThirdTrainingDescription) {
			this.thirdTrainingDescription=ThirdTrainingDescription;
			
		}

public Date getThirdDateDue() {
		return thirdDateDue;
	}

	public void setThirdDateDue(Date thirdDateDue) {
		this.thirdDateDue = thirdDateDue;
	}

	public String getAnnualYear() {
		return annualYear;
	}

	public void setAnnualYear(String annualYear) {
		this.annualYear = annualYear;
	}
}
