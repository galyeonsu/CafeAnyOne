package util;

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

import lombok.extern.log4j.Log4j;

@Log4j
public class EmailUtil {

	public String Codever = null;
 
	public static String mailSend(String email) {

		final String user = "www5034567@gmail.com";
		final String password = "udkf qsuh dzeg teoh";

		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "465");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.debug", "true");
		prop.put("mail.smtp.starttls.required", "true");
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
		prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

		Session session = Session.getDefaultInstance(prop, new Authenticator() {

			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		String generateCode = null;
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			// 수신자메일주소
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

			generateCode = generateRandomCode();

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
		return generateCode;
	}

	public static String mailSendPassword(String email, String id) {

		final String user = "www5034567@gmail.com";
		final String password = "udkf qsuh dzeg teoh";

		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "465");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.debug", "true");
		prop.put("mail.smtp.starttls.required", "true");
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
		prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		String generateCode = null;
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			// 수신자메일주소
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

			// subject
			message.setSubject("비밀번호 재설정용 메일입니다"); // 메일 제목을 입력

			// text
			String link = "http://localhost:8080/member/findChangePw?token=" + TokenManager.generateToken(id);
			String emailContent = "<html><body><p>링크: <a href='" + link + "'>" + link + "</a></p></body></html>";
			message.setText(emailContent, "UTF-8", "html");
			Transport.send(message); // 전송
			System.out.println("messge sent successfully...");
		} catch (AddressException e) {
			// TODO: handle exception
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return generateCode;
	}

	public static String generateRandomCode() {
		return String.format("%06d", new Random().nextInt(100001));
	}

}
