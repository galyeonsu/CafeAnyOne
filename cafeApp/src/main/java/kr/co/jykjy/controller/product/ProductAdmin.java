package kr.co.jykjy.controller.product;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Webutils;

/**
 * 
 * @author kss
 * @ 상품 관리자 
 */

@WebServlet("/product/admin")
public class ProductAdmin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		
		
		if (Webutils.getMember(req) == null) {
			Webutils.alert(resp, "로그인 후 사용할 수 있습니다.", req.getContextPath() + "/member/login?href="
					+ URLEncoder.encode("/", "utf-8"));
			return;
		}
		req.getRequestDispatcher("/WEB-INF/views/product/productAdmin.jsp").forward(req, resp);
	}
}
