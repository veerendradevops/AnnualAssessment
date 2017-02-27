/**
 * MailSender.java
 */
package com.lisi.annualassessment.util;

import java.io.File;
import java.io.FileInputStream;
import java.util.Properties;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

// Begin WO# 27639 - Moving Static links from Application to Database -
// Ambrish - Infosys - 27 June 2011

/**
 * @author pavan
 * 
 */
public class MailSender extends JavaMailSenderImpl {

	/**
	 * Constructor
	 */
	public MailSender() {

		Properties prop = new Properties();
		try {
	
				super.setHost("172.20.33.72");
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void send(SimpleMailMessage simpleMessage) {
		// TODO Auto-generated method stub
		super.send(simpleMessage);
	}
	// End WO# 27639 - Moving Static links from Application to Database -
	// Ambrish - Infosys - 27 June 2011
}
