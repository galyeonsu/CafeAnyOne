package kr.co.jykjy.controller.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.domain.PrAttach;
import kr.co.jykjy.domain.Product;
import kr.co.jykjy.service.ProductService;
import lombok.extern.log4j.Log4j;
import util.AmazonWebServiceS3;
import util.Webutils;

/**
 * 
 * @author kss
 * @ 상품삭제
 */

@WebServlet("/product/remove")
public class ProductRemove extends HttpServlet {
	private ProductService productService = ProductService.getProductService();
	public AmazonWebServiceS3 awsS3 = AmazonWebServiceS3.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String proNo = req.getParameter("proNo");
		String cate = req.getParameter("category");
		String pageNum = req.getParameter("pageNum");
		String amount = req.getParameter("amount");
		String type = req.getParameter("type");
		String keyword = req.getParameter("keyword");
		
		Criteria.CriteriaBuilder cb = Criteria.builder();
		if(cate != null) {
			cb.category(Integer.parseInt(cate));
		}
		if(pageNum != null) {
			cb.pageNum(Integer.parseInt(pageNum));
		}
		if(amount != null) {
			cb.amount(Integer.parseInt(amount));
		}
		if(type != null) {
			cb.type(type);
		}
		if(keyword != null) {
			cb.keyword(keyword);
		}
		
		Criteria criteria = cb.build();
		
		Product product = productService.findByProNo(Long.valueOf(proNo));
		List<PrAttach> prAttach = productService.findByNo(Long.valueOf(proNo));
		
		productService.remove(Long.valueOf(proNo));
		product.getAttachs().forEach(attach -> attach.toFile().delete());
		
		try {
			for(PrAttach p : prAttach) {
				awsS3.delete(p.getPrUuid());
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		Webutils.alert(resp, "삭제 되었습니다.", req.getContextPath() + "/product/list?" + criteria.getQs());
		//resp.sendRedirect("list?" + criteria.getQs());
	}
	
}
