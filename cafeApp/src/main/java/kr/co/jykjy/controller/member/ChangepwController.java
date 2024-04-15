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
import util.Webutils;

@WebServlet("/member/changePw")
@Log4j
public class ChangepwController extends HttpServlet {
	private MemberService memberService = MemberService.getMemberService();
	
	 @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        req.getRequestDispatcher("/WEB-INF/views/member/changePw.jsp").forward(req, resp);
	    }

	    @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        req.setCharacterEncoding("utf-8");
	        String oldpassword = req.getParameter("oldpassword");
	        String password = req.getParameter("password");
	        String passwordchk = req.getParameter("passwordchk"); // 추가된 파라미터

	        Object member = req.getSession().getAttribute("member");
	        if (member == null) {
	            Webutils.alert(resp, "잘못된 접근입니다", true);
	            resp.sendRedirect("/");
	            return;
	        }

	        Member resultMember = memberService.getMember(((Member) member).getId());
	        if (!resultMember.getPw().equals(oldpassword) || !password.equals(passwordchk)) {
	            Webutils.alert(resp, "비밀번호를 확인해주세요", true);
	            return;
	        }

	        Member newMember = Member.builder().id(resultMember.getId()).pw(password).build();

	        log.info(newMember);

	        memberService.updatePw(newMember);

	        Webutils.alert(resp, "비밀번호 변경에 성공했습니다", Webutils.CONTEXT_PATH);
	    }
	}
