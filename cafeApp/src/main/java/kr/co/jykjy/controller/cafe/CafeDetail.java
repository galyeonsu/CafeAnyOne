package kr.co.jykjy.controller.cafe;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jykjy.domain.Cafe;
import kr.co.jykjy.service.CafeService;

@WebServlet("/cafe/detail")
public class CafeDetail extends HttpServlet{
	
	private CafeService cafeService = CafeService.getCafeService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		long cafeNo = Long.parseLong(req.getParameter("cafeNo"));
		Cafe cafe = cafeService.findByCafeNo(cafeNo);
		cafe.setCfAttachs(cafeService.findByCfAttachNo(cafe.getCafeNo()));
		
		req.setAttribute("cafe", cafe);
		req.getRequestDispatcher("/WEB-INF/views/order/cafeDetail.jsp").forward(req, resp);
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
