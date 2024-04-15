package kr.co.jykjy.controller.cafe;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jykjy.domain.Cafe;
import kr.co.jykjy.service.CafeService;

@WebServlet("/cafe/choice")
public class CafeChoice extends HttpServlet{
	
	private CafeService cafeService = CafeService.getCafeService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		List<Cafe> cafe = cafeService.returnCafe();
		
		for(Cafe cf : cafe) {
			cf.setCfAttachs(cafeService.findByCfAttachNo(cf.getCafeNo()));
		}
		
		req.setAttribute("cafe", cafe);
		req.getRequestDispatcher("/WEB-INF/views/order/cafeChoice.jsp").forward(req, resp);
	
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
