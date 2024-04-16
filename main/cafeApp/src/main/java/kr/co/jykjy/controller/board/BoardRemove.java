package kr.co.jykjy.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jykjy.domain.Board;
import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.domain.Member;
import kr.co.jykjy.domain.PageDTO;
import kr.co.jykjy.service.BoardService;
import util.Webutils;

// 1031 첨부파일 삭제 반영
@WebServlet("/board/remove")
public class BoardRemove extends HttpServlet {
	private BoardService boardService = BoardService.getBoardService();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member member = Webutils.getMember(req);
		if (member != null) {
			String bno = req.getParameter("bno");
			if(bno != null) {
				Board board = boardService.get(Long.valueOf(bno));
				
				// 본인글 여부 확인 (글.id와 member.id 일치 확인), 관리자에도 접근 권한 부여
				if(board.getId().equals(member.getId()) || member.isAdmin()) {
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
					
					boardService.remove(Long.valueOf(bno));
					// 삭제되어야 할 첨부파일 정보 조회
					board.getAttachs().forEach(attach -> attach.toFile().delete());
					Webutils.alert(resp, "삭제되었습니다.", req.getContextPath() + "/board/list?" + criteria.getQs());
				}
			}
		}
		Webutils.alert(resp, "비정상적 접근입니다.", req.getContextPath() + "/board/list");
	}
}
