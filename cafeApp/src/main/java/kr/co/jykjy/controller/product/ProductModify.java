package kr.co.jykjy.controller.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.domain.PageDTO;
import kr.co.jykjy.domain.Product;
import kr.co.jykjy.service.ProductService;
import lombok.extern.log4j.Log4j;

/**
 * 
 * @author kss
 * @ 상품 수
 */

@WebServlet("/product/modify")
public class ProductModify extends HttpServlet {
	private ProductService productService = ProductService.getProductService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String proNo = req.getParameter("proNo");
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
		
		Product product = productService.findByProNo(Long.valueOf(proNo));
		
		req.setAttribute("pageDTO", new PageDTO(criteria, productService.getTotal(criteria)));
		req.setAttribute("list", product);
		
		req.getRequestDispatcher("/WEB-INF/views/product/productModify.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String proNo = req.getParameter("proNo");
		String proName = req.getParameter("proName");
		String proDetail = req.getParameter("proDetail");
		String proPrice = req.getParameter("proPrice");
		String proSize = req.getParameter("proSize");
		String proStmt = req.getParameter("proStmt");
		String prCategory = req.getParameter("prCategory");
		String cupChoice = req.getParameter("cupChoice");
		
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
		
		Product product = Product.builder().proName(proName).proDetail(proDetail).proPrice(proPrice).proSize(proSize)
				.proStmt(proStmt).prCategory(Integer.parseInt(prCategory)).cupChoice(cupChoice).proNo(Long.parseLong(proNo)).build();
		productService.modify(product);
		resp.sendRedirect("view?proNo=" + proNo + "&" + criteria.getQs()); 
	}
}
