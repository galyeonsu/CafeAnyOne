package kr.co.jykjy.controller.member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jykjy.domain.Board;
import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.domain.Member;
import kr.co.jykjy.domain.PageDTO;
import kr.co.jykjy.domain.Reply;
import kr.co.jykjy.domain.Review;
import kr.co.jykjy.service.BoardService;
import kr.co.jykjy.service.MemberService;
import lombok.extern.log4j.Log4j;

@Log4j
@WebServlet("/member/myplay") 
public class MyPlayController extends HttpServlet {
	private MemberService memberService = MemberService.getMemberService();
	private BoardService boardService = BoardService.getBoardService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 세션에서 멤버 정보를 가져옵니다.
		Object member = req.getSession().getAttribute("member");
		Member resultMember = memberService.getMember(((Member) member).getId());

		String memberId = resultMember.getId();
		List<Board> boardList = memberService.findBoard(memberId);
		List<Review> reviewList = memberService.findReview(memberId);
		List<Reply>	replyList = memberService.findReply(memberId);
		Criteria.CriteriaBuilder cb = Criteria.builder();
		Criteria criteria = cb.build();
		req.setAttribute("boardList", boardList);
		req.setAttribute("reviewList", reviewList);
		req.setAttribute("replyList", replyList);
		req.setAttribute("pageDto", new PageDTO(criteria, boardService.getCount(criteria)));
		
		
		req.getRequestDispatcher("/WEB-INF/views/member/myplay.jsp").forward(req, resp);
	}
}  
