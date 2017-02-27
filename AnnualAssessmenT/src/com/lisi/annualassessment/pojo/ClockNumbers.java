package com.lisi.annualassessment.pojo;

public class ClockNumbers {

	
	public int clockNumbers;

	public int getClockNumbers() {
		return clockNumbers;
	}

	public void setClockNumbers(int clockNumbers) {
		this.clockNumbers = clockNumbers;
	}

	@Override
	public int hashCode() {
		
		return 12*clockNumbers;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ClockNumbers other = (ClockNumbers) obj;
		if (clockNumbers != other.clockNumbers)
			return false;
		return true;
	}

	
	
}
