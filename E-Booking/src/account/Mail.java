package account;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Random;

public class Mail {
	/**
	 * @param args the command line arguments
	 */
	public Mail() {
		
	}
	
	public void sendMail(String email, String firstName, String lastName, String phone, String password) {
		//Random user ID
    		Random rand = new Random();
    		int userID = rand.nextInt(1000000);
    	
    		//Email to send to
        String to = email;
        //Email to be sent from
        String from = "uga.cinema.system@gmail.com";
        
        //Create properties object
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.socketFactory.port", "465");
        properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", "465");
        //Get Session
        Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator()
        {
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(from, "uga.cinem@");
            }
        });
        
        //Try/Catch to send message
        try {
            //Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);
            //Set from address in email
            message.setFrom(new InternetAddress(from));
            //Set to address in email
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            //Set the subject of the email
            message.setSubject("Thanks for registering!");
            //Set the actual message text
            message.setContent(
            		  "<div>" +
            			"<h1>Account Confirmation</h1>" +
            		    "<h4>Thank you for creating an account with us.<br>" +
            		      "Your username is "+ email +".</h4>" +
            		    "<br>" +
            		    "<h4>Account Details</h4>" +
            		    "Login Type: User <br>" +
            		    "First name: "+ firstName +"<br>" +
            		    "Last name: "+ lastName +"<br>" +
            		    "Phone Number: "+ phone +"<br>" +
            		    "Password: "+ password +"<br>" +
            		    "</div>" +
            		  "</div>"
            		, "text/html; charset=utf-8");
            
            //Sending the message
            Transport.send(message);
        }
        catch(MessagingException e) {
            e.printStackTrace();
        }
	}// sendMail

	public void sendPassword(String email, String password) {
		//Random user ID
    		Random rand = new Random();
    		int userID = rand.nextInt(1000000);
    	
    		//Email to send to
        String to = email;
        //Email to be sent from
        String from = "uga.cinema.system@gmail.com";
        
        //Create properties object
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.socketFactory.port", "465");
        properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", "465");
        //Get Session
        Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator()
        {
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(from, "uga.cinem@");
            }
        });
        
        //Try/Catch to send message
        try {
            //Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);
            //Set from address in email
            message.setFrom(new InternetAddress(from));
            //Set to address in email
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            //Set the subject of the email
            message.setSubject("Forgot Your Password?!?");
            //Set the actual message text
            message.setContent(
            		  "<div>" +
            			"<h1>Thank you for contacting us.</h1>" +
            		     "<h4>Your password is "+ password +".</h4>" +
            		  "</div>"
            		, "text/html; charset=utf-8");
            
            //Sending the message
            Transport.send(message);
        }
        catch(MessagingException e) {
            e.printStackTrace();
        }
	}// sendMail
	
	public void sendConfirmation(String email) {
		//Random user ID
    		Random rand = new Random();
    		int userID = rand.nextInt(1000000);
    	
    		//Email to send to
        String to = email;
        //Email to be sent from
        String from = "uga.cinema.system@gmail.com";
        
        //Create properties object
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.socketFactory.port", "465");
        properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", "465");
        //Get Session
        Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator()
        {
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(from, "uga.cinem@");
            }
        });
        
        //Try/Catch to send message
        try {
            //Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);
            //Set from address in email
            message.setFrom(new InternetAddress(from));
            //Set to address in email
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            //Set the subject of the email
            message.setSubject("Forgot Your Password?!?");
            //Set the actual message text
            message.setContent(
            		  "<div>" +
            			"<h1>Thank you for contacting us.</h1>" +
            		     "<h4>Your password is .</h4>" +
            		  "</div>"
            		, "text/html; charset=utf-8");
            
            //Sending the message
            Transport.send(message);
        }
        catch(MessagingException e) {
            e.printStackTrace();
        }
	}// sendMail
}// Mail