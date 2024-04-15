package kr.co.jykjy.controller.member;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import kr.co.jykjy.domain.Member;
import kr.co.jykjy.domain.Order;
import kr.co.jykjy.domain.Product;
import kr.co.jykjy.domain.Member.MemberBuilder;
import kr.co.jykjy.domain.MemberMyOrder;
import kr.co.jykjy.mapper.MemberMapper;
import kr.co.jykjy.service.MemberService;
import kr.co.jykjy.service.OrderService;
import lombok.extern.log4j.Log4j;
import util.MybatisUtils;
import util.UploadUtils;
import util.Webutils;

@Log4j
@WebServlet("/member/myPage")
public class MyPageController extends HttpServlet{
	private MemberService memberService = MemberService.getMemberService();
	private OrderService orderService = OrderService.getOrderService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member member = Webutils.getMember(req);
		if(member == null) { //비로그인
			Webutils.alert(resp, "로그인해주세요", req.getContextPath() + "/member/login");
			return; 
		}
		
		Object mymember = req.getSession().getAttribute("member");
		Member resultMember = memberService.getMember(((Member) member).getId());
		String memberId = resultMember.getId();
		
		List<MemberMyOrder> orderList = memberService.myOrder(memberId);
		
		req.setAttribute("orderList", orderList);
		
		req.setAttribute("member", memberService.getMember(member.getId()));
		req.getRequestDispatcher("/WEB-INF/views/member/myPage.jsp").forward(req, resp);
	}
}

  