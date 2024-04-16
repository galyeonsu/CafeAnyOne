package MemberMapperTests;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class emailSTMTTests {
	public static void main(String[] args) {
		gmailSend();
	}
	
	
	
	public static void gmailSend() {
		final String user = "www5034567@gmail.com";
		final String password = "udkf qsuh dzeg teoh";
		
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "465");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable","true");
		prop.put("mail.smtp.ssl.trust","smtp.gmail.com");
		prop.put("mail.smtp.starttls.enable","true");
		prop.put("mail.debug", "true");
		prop.put("mail.smtp.starttls.required", "true");
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
		prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		
		Session session = Session.getDefaultInstance(prop, new Authenticator() {
		 
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			// 수신자메일주소
			message.addRecipient(Message.RecipientType.TO, new InternetAddress("www503@naver.com"));

			String generateCode = generateRandomCode();
			
			log.info(generateCode);
			// subject
			message.setSubject("인증번호"); // 메일 제목을 입력
			
			// text
			message.setText("인증번호: " + generateCode); // 매일 내용을 입력
			
			Transport.send(message); // 전송
			System.out.println("messge sent successfully...");
		} catch (AddressException e) {
			// TODO: handle exception
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	private static String generateRandomCode() {
		return String.format("%06d", new Random().nextInt(100001));
    }
}
