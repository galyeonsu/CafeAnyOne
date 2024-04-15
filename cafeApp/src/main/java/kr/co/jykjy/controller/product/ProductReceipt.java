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
import kr.co.jykjy.domain.Payment;
import kr.co.jykjy.service.PaymentService;
import util.Webutils;

/**
 * 
 * @author kss
 * @ 결제 주문 내역
 */

@WebServlet("/receipt/*")
public class ProductReceipt extends HttpServlet {
	private PaymentService paymentService = PaymentService.getPaymentService();
	private Gson gson = new Gson();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String str = new BufferedReader(new InputStreamReader(req.getInputStream())).lines().collect(Collectors.joining());
		Payment payment = gson.fromJson(str, Payment.class);
		
		if(paymentService.register(payment) > 0) {
			resp.setStatus(200);
			resp.getWriter().print(payment);
		} else {
			resp.setStatus(500);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String[] arr = uri.substring(1).split("/");
		Object o = null;
		resp.setContentType("application/json; charset=utf-8");
		
		if (arr.length == 2) {
			String orderCode = arr[1];
			o = paymentService.get(orderCode);
			resp.getWriter().print(gson.toJson(o));
		}
	}
}
