package com.app.helper;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	
	private static Session session;
    
    public static Session getSession() {
        String from = "gajodharsinghcoolx@gmail.com";
        String host = "smtp.gmail.com";
        Properties properties = System.getProperties();
        
//        properties.put("mail.smtp.host", host);
//        properties.put("mail.smtp.port", "587");
//        properties.put("mail.smtp.ssl.trust", "true");
//        properties.put("mail.smtp.auth", "true");
//        properties.put("mail.smtp.starttls.enable", "true");
//        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
        
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");
        
        if(session==null) {
	        session = Session.getInstance(properties, new javax.mail.Authenticator() {
	
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(from, "lhgovshaczcbhdmq");
	            }
	        });
        }
        return session;
    }
    
    public static void sendMail(String addressTo, String task) {
    	try {
            MimeMessage message = new MimeMessage(getSession());
            message.setFrom(new InternetAddress("gajodharsinghcoolx@gmail.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(addressTo));
            message.setSubject("Task "+task);
            message.setContent(
                    "<pre><h1>You are approaching your task - "+task+"<h1></pre><br><pre><h4>This is a system generated mail please do not respond</h4></pre>",
            		"text/html");

            System.out.println("sending...");
            Transport.send(message);
            System.out.println("Sent message successfully....");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }
}