package kr.co.jykjy.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jykjy.domain.Member;
import kr.co.jykjy.service.MemberService;
import util.EmailUtil;
import util.Webutils;

@WebServlet("/member/PasswordReset")
public class PasswordResetController extends HttpServlet {
	
	private MemberService memberService = MemberService.getMemberService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/PasswordReset.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");

		Member member = memberService.getMemberByEmail(email); 
		 
		if(member == null) {
			Webutils.alert(resp, "해당되는 유저가 없습니다", true);
			return;
		} 
		
		// 이메일 보내기
		EmailUtil.mailSendPassword(email, member.getId());
		
		// 
		Webutils.alert(resp, "이메일로 비밀번호 재설정 링크를 보냈습니다. 이메일을 확인해주세요", "/");
	}
}
