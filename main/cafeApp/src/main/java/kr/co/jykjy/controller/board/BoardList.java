package kr.co.jykjy.controller.board;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jykjy.domain.Attach;
import kr.co.jykjy.domain.Board;
import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.domain.Member;
import kr.co.jykjy.domain.PageDTO;
import kr.co.jykjy.domain.Reply;
import kr.co.jykjy.service.BoardService;

@WebServlet("/board/list")
public class BoardList extends HttpServlet {
	private BoardService boardService = BoardService.getBoardService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cate = req.getParameter("category");
		String pageNum = req.getParameter("pageNum");
		String amount = req.getParameter("amount");
		String[] type = req.getParameterValues("type");
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
			cb.type(String.join(",", type));
		}
		if(keyword != null) {
			cb.keyword(keyword);
		}
		
		Criteria criteria = cb.build();
		req.setAttribute("pageDto", new PageDTO(criteria, boardService.getCount(criteria)));
		req.setAttribute("list", boardService.list(criteria));
		
		req.getRequestDispatcher("/WEB-INF/views/board/board_list.jsp").forward(req, resp);
	}
	
}
