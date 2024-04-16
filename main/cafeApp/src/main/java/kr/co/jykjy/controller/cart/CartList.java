package kr.co.jykjy.controller.cart;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jykjy.domain.Member;
import lombok.extern.log4j.Log4j;
import util.Webutils;

@Log4j
@WebServlet("/cart/list")
public class CartList extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if (Webutils.getMember(req) == null) {
			Webutils.alert(resp, "로그인 후 사용할 수 있습니다.", req.getContextPath() + "/member/login?href="
					+ URLEncoder.encode("/cart/list", "utf-8"));
			return;
		}

		req.getRequestDispatcher("/WEB-INF/views/order/cart.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member member = Webutils.getMember(req);
		
		req.setCharacterEncoding("utf-8");
		if(member != null) {
			resp.sendRedirect("/order/payment");
		}else {
			Webutils.alert(resp, "로그인 후 이용할 수 있습니다.", req.getContextPath() + "/member/login?href=" 
					+ URLEncoder.encode("/cart/list", "utf-8"));
		}
		
	}

}
