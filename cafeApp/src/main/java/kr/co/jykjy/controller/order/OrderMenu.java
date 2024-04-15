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
import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.domain.Member;
import kr.co.jykjy.domain.PageDTO;
import kr.co.jykjy.domain.Product;
import kr.co.jykjy.service.CartService;
import kr.co.jykjy.service.ProductService;
import lombok.extern.log4j.Log4j;
import util.Webutils;

@Log4j
@WebServlet("/order/menu")
public class OrderMenu extends HttpServlet{
	
	private ProductService productService = ProductService.getProductService();
	private CartService cartService = CartService.getCartService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cate = req.getParameter("category");
		Criteria.CriteriaBuilder cb = Criteria.builder();
		if(cate != null) { 
			cb.category(Integer.parseInt(cate));
		}
		Criteria crietira = cb.build();
		
		long proNo = Long.parseLong(req.getParameter("proNo"));
		Product product = productService.findByProNo(proNo);
		product.setAttachs(productService.findByNo(product.getProNo()));
		
		req.setAttribute("pageDTO", new PageDTO(crietira, productService.getTotal(crietira)));
		req.setAttribute("product", product);
		req.getRequestDispatcher("/WEB-INF/views/order/orderStmt.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member member = Webutils.getMember(req);
		req.setCharacterEncoding("UTF-8");
		Long proNo = Long.parseLong(req.getParameter("proNo"));
		
		if(member != null) {
			String proName = req.getParameter("proName");
			String proPrice = req.getParameter("proPrice");
			String stmt = req.getParameter("stmt"); // hot / ice
			String cupSize = req.getParameter("cupSize"); // Tall / Grande / Venti 
			String cupChoice = req.getParameter("cupChoice"); // 카페 컵 / 개인 컵 / 일회용 컵
			int cartcate = Integer.parseInt(req.getParameter("cartcate"));
			
			List<Cart> cart = cartService.CartByParams(member.getId(), proNo);
			if(cart.size() > 0) {
				for(Cart c : cart) {
					Cart ct = Cart.builder().cartNo(c.getCartNo()).proAmt(String.valueOf(Integer.parseInt(c.getProAmt())+1)).cartStmt(c.getCartStmt()).proNo(proNo).build();
					log.info(ct);
					cartService.modify(ct);
				}
			}
			else {
				Cart list = Cart.builder().proName(proName).proPrice(proPrice).proAmt("1")
						.stmt(stmt).cupSize(cupSize).cupChoice(cupChoice).cartcate(cartcate)
						.id(member.getId()).proNo(proNo).build();
				cartService.register(list);
				log.info(list);
			}
			resp.sendRedirect("/cafe/choice?");
		}
		else {
			Webutils.alert(resp, "로그인 후 사용할 수 있습니다.", req.getContextPath() + "/member/login?href=" 
					+ URLEncoder.encode("/order/main?category=5", "utf-8"));
		}

	}
	
}
