package kr.co.jykjy.controller.cafe.api;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.jykjy.domain.Cafe;
import kr.co.jykjy.service.CafeService;

@WebServlet("/cafe/map/api/list")
public class CafeList extends HttpServlet{
	CafeService cafeService = CafeService.getCafeService();
	Gson gson = new Gson(); 
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=utf-8");
		List<Cafe> cafe = cafeService.returnCafe();
		resp.getWriter().print(gson.toJson(cafe));
		
	}
	
}
