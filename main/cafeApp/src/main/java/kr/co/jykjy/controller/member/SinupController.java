package kr.co.jykjy.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jykjy.domain.Member;
import kr.co.jykjy.mapper.MemberMapper;
import kr.co.jykjy.service.MemberService;
import lombok.Builder;
import util.MybatisUtils;
import util.Webutils;

@WebServlet("/member/signup")
public class SinupController extends HttpServlet {
	private MemberService memberService = MemberService.getMemberService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/signup.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		// Retrieve form parameters
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String addr = req.getParameter("addr");
 
		 boolean duplicateId = memberService.duplicateId(id);

		    // Validate the input
		    if (id == null || id.isEmpty() ||
		        pw == null || pw.isEmpty() ||
		        name == null || name.isEmpty() ||
		        phone == null || phone.isEmpty() ||
		        email == null || email.isEmpty() ||
		        addr == null || addr.isEmpty()) {
		        // Invalid input, show an alert message on the current page
		        Webutils.alert(resp, "입력란에 공백이 있는지 확인해주세요.","/member/signup");
		    } else if (duplicateId) {
		        // Duplicate id, show an alert message on the current page
		        Webutils.alert(resp, "이미 가입된 아이디입니다.","/member/signup");
		    } else {
		        // The input is valid, proceed with registration
		        Member member = Member.builder().id(id).pw(pw).name(name).phone(phone).email(email).addr(addr).build();

		        memberService.signup(member);

		        Webutils.alert(resp, "회원가입이 완료되었습니다.","/");
		    }
		}
} 