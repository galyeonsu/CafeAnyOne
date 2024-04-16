package kr.co.jykjy.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jykjy.domain.Board;
import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.service.BoardService;
import util.Webutils;

@WebServlet("/board/view")
public class BoardView extends HttpServlet {
	private BoardService boardService = BoardService.getBoardService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cate = req.getParameter("category");
		String pageNum = req.getParameter("pageNum");
		String amount = req.getParameter("amount");
		
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
		Criteria criteria = cb.build();
		
		Long bno = Long.valueOf(req.getParameter("bno"));
		Board board = boardService.get(bno);
		
		req.setAttribute("cri", criteria);
		req.setAttribute("board", board);
		// 파라미터값으로 받아온 category번호에 따라 조건문으로 다른 jsp파일로 보내기
		if(Integer.parseInt(cate) == 2) {
			// cno가 2일때
			req.getRequestDispatcher("/WEB-INF/views/board/event_view.jsp").forward(req, resp);
		} else if(Integer.parseInt(cate) == 3) {
			// cno가 3일때
			req.getRequestDispatcher("/WEB-INF/views/board/FAQ_view.jsp").forward(req, resp);
		} else {
			// cno가 1또는 4일때
			req.getRequestDispatcher("/WEB-INF/views/board/board_view.jsp").forward(req, resp);
		}
	}
	
}
