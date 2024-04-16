package kr.co.jykjy.controller.product;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.domain.Member;
import kr.co.jykjy.domain.PageDTO;
import kr.co.jykjy.service.ProductService;
import util.Webutils;

/**
 * 
 * @author kss
 * @ 장바구니
 */

@WebServlet("/product/basket")
public class ProductBasket extends HttpServlet{
	private ProductService productService = ProductService.getProductService();

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
		
		if (Webutils.getMember(req) == null) {
			Webutils.alert(resp, "로그인 후 사용할 수 있습니다.", req.getContextPath() + "/member/login?href="
					+ URLEncoder.encode("/product/basket", "utf-8"));
			return;
		}
		
		req.setAttribute("pageDTO", new PageDTO(criteria, productService.getTotal(criteria)));
		req.getRequestDispatcher("/WEB-INF/views/product/productBasket.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member member = Webutils.getMember(req);
		
		req.setCharacterEncoding("UTF-8");
		
		if (member != null) {
			resp.sendRedirect("statement");
		} else {
			Webutils.alert(resp, "로그인 후 이용할 수 있습니다.", req.getContextPath() + "/member/login?href=" 
					+ URLEncoder.encode("/product/list?category=1", "utf-8"));
		}
	}
}
