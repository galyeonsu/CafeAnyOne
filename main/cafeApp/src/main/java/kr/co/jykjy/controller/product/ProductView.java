package kr.co.jykjy.controller.product;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jykjy.domain.Member;
import kr.co.jykjy.domain.Cart;
import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.domain.PageDTO;
import kr.co.jykjy.domain.Product;
import kr.co.jykjy.service.CartService;
import kr.co.jykjy.service.ProductService;
import util.Webutils;

/**
 * 
 * @author kss
 * @ 상품상세페이지
 */

@WebServlet("/product/view")
public class ProductView extends HttpServlet {
	private ProductService productService = ProductService.getProductService();
	private CartService cartService = CartService.getCartService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cate = req.getParameter("category");
		String pageNum = req.getParameter("pageNum");
		String amount = req.getParameter("amount");
		String type = req.getParameter("type");
		String keyword = req.getParameter("keyword");
		
		Criteria.CriteriaBuilder cb = Criteria.builder();
		
		if (cate != null) {
			cb.category(Integer.parseInt(cate));
		}
		if (pageNum != null) {
			cb.pageNum(Integer.parseInt(pageNum));
		}
		if (amount != null) {
			cb.amount(Integer.parseInt(amount));
		}
		if (type != null) {
			cb.type(type);
		}
		if (keyword != null) {
			cb.keyword(keyword);
		}
		
		Criteria criteria = cb.build();
		
		if(req.getParameter("proNo") == null) {
			Webutils.alert(resp, "없는 게시글 번호입니다.", "list?" + criteria.getQs());
			return;
		}
		
		long proNo = Long.parseLong(req.getParameter("proNo")); 
		Product product = productService.findByProNo(proNo);
		product.setAttachs(productService.findByNo(product.getProNo()));

		req.setAttribute("pageDTO", new PageDTO(criteria, productService.getTotal(criteria)));
		req.setAttribute("list", product);
		req.getRequestDispatcher("/WEB-INF/views/product/productDetail.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member member = Webutils.getMember(req);
		
		req.setCharacterEncoding("UTF-8");
		Long proNo = Long.parseLong(req.getParameter("proNo"));
		String type = req.getParameter("type");
		String keyword = req.getParameter("keyword");
		String cate = req.getParameter("category");
		String pageNum = req.getParameter("pageNum");
		String amount = req.getParameter("amount");
		
		Criteria.CriteriaBuilder cb = Criteria.builder();
		if (cate != null) {
			cb.category(Integer.parseInt(cate));
		}
		if (pageNum != null) {
			cb.pageNum(Integer.parseInt(pageNum));
		}
		if (amount != null) {
			cb.amount(Integer.parseInt(amount));
		}
		if (type != null) {
			cb.type(type);
		}
		if (keyword != null) {
			cb.keyword(keyword);
		}
		
		Criteria criteria = cb.build();	
		
		if (member != null) {
			String proName = req.getParameter("proName");
			String proPrice = req.getParameter("proPrice");
			String proSize = req.getParameter("proSize");
			
			List<Cart> list = cartService.get(member.getId(), proNo);
			
			if(list.size() > 0) {
				for (Cart l : list) {
					Cart cart = Cart.builder().cartNo(l.getCartNo()).proAmt(String.valueOf(Integer.parseInt(l.getProAmt())+1)).cartStmt(l.getCartStmt()).proNo(proNo).build();
					cartService.modify(cart);
				}
			} else {
				Cart cart = Cart.builder().proName(proName).proPrice(proPrice).proAmt("1")
						.cupSize(proSize).proNo(proNo).cartcate(3).id(member.getId()).proNo(proNo).build();
				cartService.register(cart);
			}
			resp.sendRedirect("basket");
		} else {
			Webutils.alert(resp, "로그인 후 사용할 수 있습니다.", req.getContextPath() + "/member/login?href=" 
					+ URLEncoder.encode("/product/view?proNo=" + proNo + "&" + criteria.getQs(), "utf-8"));
		}
	}
}
