package kr.co.jykjy.controller.member;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.jna.platform.win32.Winspool.PRINTER_INFO_4;

import kr.co.jykjy.domain.Member;
import kr.co.jykjy.mapper.MemberMapper;
import kr.co.jykjy.service.MemberService;
import lombok.extern.log4j.Log4j;
import util.MybatisUtils;
import util.Webutils;

@WebServlet("/member/login")
@Log4j
public class LoginController extends HttpServlet {
	
	private MemberService memberService = MemberService.getMemberService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String href = req.getParameter("href");

		Member member = memberService.getMember(id);
		log.info(req.getContextPath());

		if (member != null && member.getPw().equals(pw)) {
			req.getSession().setAttribute("member", member);

			if (href != null) {
				href = URLDecoder.decode(href, "utf-8");
			} else {
				href = "/";
			}
			log.info(href);
 
			resp.sendRedirect(req.getContextPath() + (href == null ? "/" : href));
		}else {
			Webutils.alert(resp, "잘못된 아이디,비밀번호 입니다", true);
		}
		
		
	}
}
