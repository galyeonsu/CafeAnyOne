package kr.co.jykjy.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jykjy.service.MemberService;

@WebServlet("/member/checkIdDuplicate")
public class CheckIdDuplicateController extends HttpServlet {
	private MemberService memberService = MemberService.getMemberService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
        String id = req.getParameter("id"); 

        boolean isDuplicate = memberService.duplicateId(id);

        if (isDuplicate) {
            resp.getWriter().write("duplicate");
        } else {
            resp.getWriter().write("unique");
        }
	      
	    }
	}

