package kr.co.jykjy.controller.order;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jykjy.domain.Cart;
import kr.co.jykjy.domain.Member;
import kr.co.jykjy.service.CartService;
import kr.co.jykjy.service.OrderService;
import kr.co.jykjy.service.ProductService;
import lombok.extern.log4j.Log4j;
import util.Webutils;

@Log4j
@WebServlet("/order/payment")
public class Payment extends HttpServlet{
	
	private ProductService productService = ProductService.getProductService();
	private CartService cartService = CartService.getCartService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member member = Webutils.getMember(req);
		req.setCharacterEncoding("UTF-8");
		
		if (member != null) {
			List<Cart> cart = cartService.getOrderMenu(member.getId());
			for(Cart c : cart) {
				c.setAttachs(productService.findByNo(c.getProNo()));
			}
			req.setAttribute("cart", cart);
			req.getRequestDispatcher("/WEB-INF/views/order/payment.jsp").forward(req, resp);
		}else {
			Webutils.alert(resp, "로그인 후 이용할 수 있습니다.", req.getContextPath() + "/member/login?href=" 
					+ URLEncoder.encode("/order/payment", "utf-8"));
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("main?category=5");
	}

}
