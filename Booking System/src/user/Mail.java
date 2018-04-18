package user;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

import java.util.Random;

public class Mail {
	/**
	 * @param args the command line arguments
	 */
	
	public void sendMail(String email) {
		//Random user ID
    		Random rand = new Random();
    		int userID = rand.nextInt(1000000);
    	
    		//Email to send to
        String to = "------------@gmail.com";
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
        try
        {
            //Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);
            //Set from address in email
            message.setFrom(new InternetAddress(from));
            //Set to address in email
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            //Set the subject of the email
            message.setSubject("Thanks for registering!");
            //Set the actual message text
            message.setText("Please enter your new user ID to confirm your registration. Your user ID is " + String.valueOf(userID) + ".");
            
            //Sending the message
            Transport.send(message);
            System.out.println("Message sent!");
        }
        catch(MessagingException e)
        {
            e.printStackTrace();
            System.out.println("Something went wrong!");
        }
	}// sendMail
}// Mail
