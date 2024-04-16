package kr.co.jykjy.controller.product;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.jykjy.domain.Cart;
import kr.co.jykjy.domain.Member;
import kr.co.jykjy.service.CartService;
import kr.co.jykjy.service.ProductService;
import util.Webutils;

/**
 * 
 * @author kss
 * @ 장바구니 비동기
 */

@WebServlet("/cart/*")
public class ProductCart extends HttpServlet {
	private ProductService productService = ProductService.getProductService();
	private CartService cartService = CartService.getCartService();
	private Gson gson = new Gson();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member member = Webutils.getMember(req);
		resp.setContentType("application/json; charset=utf-8");
		List<Cart> cart = cartService.getList(member.getId());
		for (Cart i : cart) {
			i.setAttachs(productService.findByNo(i.getProNo()));
		}
		resp.getWriter().print(gson.toJson(cart));
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String str = new BufferedReader(new InputStreamReader(req.getInputStream())).lines().collect(Collectors.joining());
		Cart cart = gson.fromJson(str, Cart.class);
		
		if (cartService.modify(cart) > 0) {
			resp.setStatus(200);
			resp.getWriter().print("success");
		} else {
			resp.setStatus(500);
		}
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String str = new BufferedReader(new InputStreamReader(req.getInputStream())).lines().collect(Collectors.joining());
		Cart cart = gson.fromJson(str, Cart.class);
		
		if (cartService.delete(cart) > 0) {
			resp.setStatus(200);
			resp.getWriter().print("success");
		} else {
			resp.setStatus(500);
		}
	}
}
