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

import kr.co.jykjy.domain.Order;
import kr.co.jykjy.domain.Payment;
import kr.co.jykjy.service.OrderService;
import lombok.extern.log4j.Log4j;

/**
 * 
 * @author kss
 * @ 결제라인 비동기
 */

@Log4j
@WebServlet("/payments/*")
public class ProductPayment extends HttpServlet {
	private OrderService orderService = OrderService.getOrderService();
	private Gson gson = new Gson();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String str = new BufferedReader(new InputStreamReader(req.getInputStream())).lines().collect(Collectors.joining());
		Order order = gson.fromJson(str, Order.class);
		
		if(orderService.register(order) > 0) {
			resp.setStatus(200);
			resp.getWriter().print(order);
		} else {
			resp.setStatus(500);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=utf-8");
		List<Order> orders = orderService.getList();		
		resp.getWriter().print(gson.toJson(orders));
	}
	
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String str = new BufferedReader(new InputStreamReader(req.getInputStream())).lines().collect(Collectors.joining());
		Order order = gson.fromJson(str, Order.class);
		
		if (orderService.update(order) > 0) {
			resp.setStatus(200);
			resp.getWriter().print("success");
		} else {
			resp.setStatus(500);
		}
	}
}
