package kr.co.jykjy.controller.product;

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
import kr.co.jykjy.service.ProductService;
import util.Webutils;

/**
 * 
 * @author kss
 * @ 결제라인
 */

@WebServlet("/product/statement")
public class ProductOrder extends HttpServlet {
	private ProductService productService = ProductService.getProductService();
	private CartService cartService = CartService.getCartService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member member = Webutils.getMember(req);
		
		req.setCharacterEncoding("UTF-8");
		if (member != null) {
			List<Cart> list = cartService.getOrderList(member.getId());
			for(Cart o : list) {
				o.setAttachs(productService.findByNo(o.getProNo()));
			}

			req.setAttribute("list", list);
			req.getRequestDispatcher("/WEB-INF/views/product/productStatement.jsp").forward(req, resp);
			
		} else {
			Webutils.alert(resp, "로그인 후 이용할 수 있습니다.", req.getContextPath() + "/member/login?href=" 
					+ URLEncoder.encode("/product/list?category=1", "utf-8"));
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.sendRedirect("list?category=1");
	}
}
