package kr.co.jykjy.controller.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.domain.PageDTO;
import kr.co.jykjy.domain.Product;
import kr.co.jykjy.service.ProductService;
import kr.co.jykjy.service.ReviewService;

/**
 * 
 * @author kss
 * @ 상품 리스트
 */

@WebServlet("/product/list")
public class ProductList extends HttpServlet {
	private ProductService productService = ProductService.getProductService();
	private ReviewService reviewService = ReviewService.getReviewService();
	
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
		List<Product> list = productService.getList(criteria);
		
		for (Product i : list) {
			i.setAttachs(productService.findByNo(i.getProNo()));
			i.setReviewCount(reviewService.totalCount(i.getProNo()));
			i.setReviewScore(reviewService.getScore(i.getProNo()));
		}
		
		req.setAttribute("pageDTO", new PageDTO(criteria, productService.getTotal(criteria)));
		req.setAttribute("list", list);
		req.getRequestDispatcher("/WEB-INF/views/product/product.jsp").forward(req, resp);
	}
}

