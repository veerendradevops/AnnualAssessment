package com.lisi.annaulAssessment.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class Converters {

	public static Date getParsedDate(String dateStr) throws ParseException {

		DateFormat formatter = new SimpleDateFormat("E MMM dd HH:mm:ss Z yyyy");
		Date date = (Date) formatter.parse(dateStr);
		// System.out.println(date);
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		String formatedDate = cal.get(Calendar.DATE) + "/" + (cal.get(Calendar.MONTH) + 1) + "/"
				+ cal.get(Calendar.YEAR);
		// System.out.println("formatedDate : " + formatedDate);
		return date;

	}
	//Mon Sep 12 22:41:35 IST 2016

	public static String getCurrentYear() {

		int currentYear = Calendar.getInstance().get(Calendar.YEAR);
		String current_Year = String.valueOf(currentYear);

		return current_Year;

	}

	public static Date getNonExemptDate(String dateStr) throws ParseException {

		DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		
		System.out.println("enter into parse()..");
		Date date = (Date) formatter.parse(dateStr);
		System.out.println("ending parse()...");
		System.out.println(date);
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		String formatedDate = cal.get(Calendar.DATE) + "/" + (cal.get(Calendar.MONTH) + 1) + "/"
				+ cal.get(Calendar.YEAR);
		System.out.println("formatedDate : " + formatedDate);
		return date;

	}

	public static String differenceDays(String statusDate) throws ParseException {
				
	//	Date today=new Date();
		int diffDays=0;
		String diffDay="";
		
		 DateFormat formatter = new SimpleDateFormat("E MMM dd HH:mm:ss Z yyyy");
		 Date date = (Date)formatter.parse(statusDate);
//		 System.out.println(date);        

		 Calendar cal = Calendar.getInstance();
		 cal.setTime(date);
		 String formatedDate = (cal.get(Calendar.MONTH) + 1) + "/" + (cal.get(Calendar.DATE) ) + "/" +  cal.get(Calendar.YEAR);
//		 System.out.println("formatedDate : " + formatedDate); 
		/*                  */
		 Date today; // your date
		    Calendar calendar = Calendar.getInstance();
		    calendar.setTime(date);
		    int year = calendar.get(Calendar.YEAR);
		    int month = calendar.get(Calendar.MONTH);
		    int day = calendar.get(Calendar.DAY_OF_MONTH);
		
		    String todayDateee = (month ) + "/" + (day ) + "/" +  (year);
		
		try {
//			System.out.println(statusDate + " con"); //Mon Sep 12 22:41:35 IST 2016
			String date1 = formatedDate;
		//	String time1 = "11:00 AM";
			String date2 = todayDateee;
		//	String time2 = "12:15 AM";

			String format1 = "MM/dd/yyyy hh:mm a";
			String format = "MM/dd/yyyy";

			SimpleDateFormat sdf = new SimpleDateFormat(format);
			SimpleDateFormat sdf1 = new SimpleDateFormat(format1);

			Date dateObj1 = sdf.parse(date1);
			Date dateObj2 = sdf.parse(date2);
	//		System.out.println(dateObj1);
	//		System.out.println(dateObj2 + "\n");

			long diff = dateObj1.getTime() - dateObj2.getTime();

			 diffDays = (int) (diff / (24 * 60 * 60 * 1000));
			 
			  diffDay=String.valueOf(diffDays);
	//		System.out.println("difference between days: " + diffDays);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return diffDay;
	}

	// encript decript
	
	public static String encrypt(String clockId) {

		String data = "" + clockId;
		String hashingValue = "";

		for (int i = 0; i < data.length(); i++) {
			char c = data.charAt(i);
			if (c==('1')) {
				hashingValue = hashingValue + "^";
			} else if (c == '2') {
				hashingValue = hashingValue + "c";
			} else if (c == '3') {
				hashingValue = hashingValue + "$";
			} else if (c == '4') {
				hashingValue = hashingValue + "a";
			} else if (c == '5') {
				hashingValue = hashingValue + "z";
			} else if (c == '6') {
				hashingValue = hashingValue + "e";
			} else if (c == '7') {
				hashingValue = hashingValue + "@";
			} else if (c == '8') {
				hashingValue = hashingValue + "j";
			} else if (c == '9') {
				hashingValue = hashingValue + "*";
			} else if (c == '0') {
				hashingValue = hashingValue + "g";
			} else if (c == '.') {
				hashingValue = hashingValue + "d";
			}
		}
		

		return hashingValue;
	}

	public static String decrypt(String originl) {
		
		String originalValue = "";
		String encrypt = originl;
		for (int i = 0; i < encrypt.length(); i++) {
			char c = encrypt.charAt(i);
			if (c == '^') {
				originalValue = originalValue + "1";
			} else if (c == 'c') {
				originalValue = originalValue + "2";
			} else if (c == '$') {
				originalValue = originalValue + "3";
			} else if (c == 'a') {
				originalValue = originalValue + "4";
			} else if (c == 'z') {
				originalValue = originalValue + "5";
			} else if (c == 'e') {
				originalValue = originalValue + "6";
			} else if (c == '@') {
				originalValue = originalValue + "7";
			} else if (c == 'j') {
				originalValue = originalValue + "8";
			} else if (c == '*') {
				originalValue = originalValue + "9";
			} else if (c == 'g') {
				originalValue = originalValue + "0";
			} else if (c == 'd') {
				originalValue = originalValue + ".";
			}
		}
		

		return originalValue;
	}
	
	
	
}
