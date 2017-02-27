package com.lisi.annualassessment.util;

import org.springframework.mail.MailException;

import org.springframework.mail.SimpleMailMessage;

public class MailTest {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub

		MailSender mailsender = new MailSender();
		System.out.println("mail start");
		notifyThruEmail(mailsender, "hi", "lisi_support@verinon.com", "pavan.kunasani@verinon.co.in", "pavan.kunasani@verinon.co.in",
				"pavan.kunasani@verinon.co.in", "testing..");
		
	}
	
	public static void notifyThruEmail(MailSender mailSender, String subject,
			String fromAddress, String toAddress, String ccAddress,
			String bccAddress, String messageBody) throws Exception {
		try {
			SimpleMailMessage message = new SimpleMailMessage();
			// Setting the From Address
			message.setFrom(fromAddress);
			
			// Setting the Subject
			message.setSubject(subject);
			// Setting the To Addresses
			if (toAddress != null) {
				message.setTo(splitEmailAddressesByComma(toAddress));
			}
			
			// Setting the CC Address
			if (ccAddress != null) {
				message.setCc(splitEmailAddressesByComma(ccAddress));
			}
			// Setting the BCC Address
			if (bccAddress != null) {
				message.setBcc(splitEmailAddressesByComma(bccAddress));
			}
			// Setting the Message Body
			message.setText(messageBody);
			// Sending Email
			mailSender.send(message);
			
			System.out.println("mail send..");
			
		} catch (MailException ex) {
			throw new Exception(ex);
		}

	}

	/**
	 * Method to split the comma separated Email addresses.
	 * 
	 * @param address
	 *            the address
	 * @return the string[]
	 */
	public static String[] splitEmailAddressesByComma(String address) {
		String recipients[] = null;
		if (address != null) {
			if (address.contains(",")) {
				recipients = address.split(",");
			} else {
				recipients = new String[] { address };
			}
		}
		return recipients;
	}

}
