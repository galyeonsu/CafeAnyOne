package kr.co.jykjy.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jykjy.domain.Member;
import kr.co.jykjy.service.MemberService;
import lombok.extern.log4j.Log4j;
import util.TokenManager;
import util.Webutils;

@WebServlet("/member/findChangePw")
@Log4j
public class FIndChangepwController extends HttpServlet {
	private MemberService memberService = MemberService.getMemberService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String token = req.getParameter("token");
		
		if(token == null) {
			Webutils.alert(resp, "잘못된 접근입니다", true);
			return;
		} 
		 
		if(!TokenManager.isTokenValid(token)) {
			Webutils.alert(resp, "잘못된 토큰이거나 만료된 토큰입니다", Webutils.CONTEXT_PATH);
			return;
		}

		String userId = TokenManager.getTokenUserId(token);
		
		req.setAttribute("token", token);
		
		Member member = memberService.getMember(userId);
		
		if(member == null) {
			Webutils.alert(resp, "잘못된 접근입니다", true);
		}
		
		req.setAttribute("member", member);
		
		req.getRequestDispatcher("/WEB-INF/views/member/findChangePw.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String token = req.getParameter("token");
		
		if(token == null) {
			Webutils.alert(resp, "잘못된 접근입니다", true);
			return;
		}
		
		if(!TokenManager.isTokenValid(token)) {
			Webutils.alert(resp, "잘못된 토큰이거나 만료된 토큰입니다", Webutils.CONTEXT_PATH);
			return;
		}
		
		req.setCharacterEncoding("utf-8");
		
		String password = req.getParameter("password");
		String passwordchk = req.getParameter("passwordchk");
		
		String memberId = TokenManager.getTokenUserId(token);
		Member member = memberService.getMember(memberId);
		
		if(member==null) {
			Webutils.alert(resp, "잘못된 접근입니다", true);
			return;
		}
		
		Member resultMember = memberService.getMember(((Member)member).getId());
		
		Member newMember = Member.builder().id(resultMember.getId()).pw(password).build();
		if(!password.equals(passwordchk)) {
	         Webutils.alert(resp, "비밀번호를 확인해주세요", true);
	         return;
	      }
		
		memberService.updatePw(newMember); 
		
		TokenManager.deleteToken(token);
		
		Webutils.alert(resp, "비밀번호 변경에 성공했습니다", Webutils.CONTEXT_PATH);
		
	}

}
