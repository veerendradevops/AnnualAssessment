package com.lisi.annualassessment.util;

import java.util.Properties;
import java.util.ResourceBundle;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.jfree.util.Log;
import org.springframework.mail.SimpleMailMessage;

import com.lisi.annualassessment.controller.CensusFileUploadController;

public class EmailConfig {

	
	private static final Logger log = Logger.getLogger(EmailConfig.class);
	private static EmailConfig emailConfig;
	private static Session emailSession;
	private String userName;
	
	/*<meta http-equiv="content-type" content="text/html; charset=UTF-8">*/
	
	private static String mailHeader = "";
	private static String mailFooter = ""
			+ "/n Note: This email has been automatically generated. Please do not reply to this email address as all responses are directed to an unattended mailbox."
			+ "";

	private EmailConfig() {
		Properties emailProperties = new Properties();

		try {
			ResourceBundle rb = ResourceBundle.getBundle("com.lisi.annualassessment.util.smtp");
			emailProperties.setProperty("mail.smtp.host", rb.getString("mail.smtp.host"));
			emailProperties.setProperty("mail.smtp.socketFactory.port", rb.getString("mail.smtp.socketFactory.port"));
			emailProperties.setProperty("mail.smtp.socketFactory.class", rb.getString("mail.smtp.socketFactory.class"));
			emailProperties.setProperty("mail.smtp.auth", rb.getString("mail.smtp.auth"));
			emailProperties.setProperty("mail.smtp.port", rb.getString("mail.smtp.port"));
			emailProperties.setProperty("mail.smtp.starttls.enable", rb.getString("mail.smtp.starttls.enable"));
			setEmailSession(emailProperties, rb);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void setEmailSession(Properties emailProperties, ResourceBundle rb) {
		userName = rb.getString("user.email");
		System.out.println("USERNAME :" + userName);
		final String password = rb.getString("user.password");
		emailSession = Session.getInstance(emailProperties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(userName, password);
			}
		});

	}

	public void sendMail(String mailSubject, String mailBody, String toAddresses, String ccAddress, String fromAddress)
			throws AddressException, MessagingException {/*

		System.out.println("send mail");
		log.info(mailSubject + " " + mailBody + " to " + toAddresses+ " cc "+ccAddress + "from " + fromAddress);
		
		System.out.println(mailSubject + " " + mailBody + " to " + toAddresses+ " cc "+ccAddress + "from " + fromAddress);
		
		
		Log.info("send mail");
		log.info(mailSubject + " " + mailBody + " to " + toAddresses+ " cc "+ccAddress + "from " + fromAddress);
		
		SimpleMailMessage message = new SimpleMailMessage();
		MailSender mailsender = new MailSender();
		// Session session=emailSession;
		// Create a default MimeMessage object.
		// Message message = new MimeMessage(session);
		// Set From: header field of the header.
		message.setFrom(fromAddress);
		// Set To: header field of the header.
		message.setTo((toAddresses));

		if ((String.valueOf(ccAddress).equalsIgnoreCase("null")) || ccAddress.isEmpty()) {

		} else {

			message.setCc((ccAddress));
		}
		// Set Subject: header field
		message.setSubject(mailSubject);
		// Send the actual HTML message, as big as you like
		mailBody = mailHeader + mailBody+" " + mailFooter;
		// message.setContent(mailBody,"text/html");

	//	message.setText(mailSubject);
		message.setText(mailBody);
		// Send message
		mailsender.send(message);
		
		Log.info("mail sent...");
	*/}

	public static EmailConfig getInstance() {
		if (emailConfig == null)
			emailConfig = new EmailConfig();
		return emailConfig;
	}

}
