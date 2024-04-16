package kr.co.jykjy.controller.order;

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

@WebServlet("/order/main")
public class OrderMain extends HttpServlet{
	private ProductService productService = ProductService.getProductService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cate = req.getParameter("category");
		Criteria.CriteriaBuilder cb = Criteria.builder();
		if(cate != null) { 
			cb.category(Integer.parseInt(cate));
		}
		Criteria crietira = cb.build();
		List<Product> product = productService.getList(crietira);
		
		for(Product p : product) {
			p.setAttachs(productService.findByNo(p.getProNo()));
		}
		
		
		req.setAttribute("pageDTO", new PageDTO(crietira, productService.getTotal(crietira)));
		req.setAttribute("product", product);
		req.getRequestDispatcher("/WEB-INF/views/order/orderMain.jsp").forward(req, resp);
	}
	
}
