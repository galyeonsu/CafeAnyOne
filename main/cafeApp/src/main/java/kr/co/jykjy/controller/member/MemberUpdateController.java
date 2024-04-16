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

@Log4j
@WebServlet("/member/myUpdate")
public class MemberUpdateController extends HttpServlet{
	private MemberService memberService = MemberService.getMemberService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/myUpdate.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String newPhone = req.getParameter("newPhone"); 
		String newAddr = req.getParameter("newAddr");
		String newEmail = req.getParameter("newEmail"); 
		 
		Object member = req.getSession().getAttribute("member");
		    if (member == null) {
		        Webutils.alert(resp, "잘못된 접근입니다", true);
		        resp.sendRedirect(Webutils.CONTEXT_PATH);
		        return;
		    }
		    Member resultMember = memberService.getMember(((Member)member).getId());

		    Member newMember = Member.builder().id(resultMember.getId()).phone(newPhone).addr(newAddr).email(newEmail).build();
		   
		    memberService.updateMember(newMember);

		    Webutils.alert(resp, "개인정보 변경에 성공했습니다", Webutils.CONTEXT_PATH);
		}
}