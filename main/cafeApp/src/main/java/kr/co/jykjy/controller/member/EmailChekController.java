package kr.co.jykjy.controller.member;

import java.io.IOException;
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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jykjy.domain.Member;
import util.Webutils;
import util.EmailUtil;

@WebServlet("/member/emailCheck")
public class EmailChekController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 이메일 주소
		String email = req.getParameter("email");
		System.out.println(email);
		String code = EmailUtil.mailSend(req.getParameter("email"));
		resp.setContentType("text/plain");
		resp.getWriter().print(code);
	}
}
	  
    