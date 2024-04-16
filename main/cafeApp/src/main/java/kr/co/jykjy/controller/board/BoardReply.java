package kr.co.jykjy.controller.board;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.domain.Reply;
import kr.co.jykjy.service.ReplyService;

@WebServlet("/reply/*")
public class BoardReply extends HttpServlet {
	private ReplyService replyService = ReplyService.getReplyService();
	private Gson gson = new Gson();

	// 삭제 (delete)
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String[] arr = uri.substring(1).split("/");
		
		if(arr.length == 2) {
			Long rno = Long.valueOf(arr[1]);
			System.out.println("단일 삭제 rno : " + rno);
			if(replyService.remove(rno) > 0) { // 성공
				resp.setStatus(200);
				resp.getWriter().print("success");
			} else { // 실패
				resp.setStatus(500);
			}
		}
	}

	// 조회 (get)
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String[] arr = uri.substring(1).split("/");
		
		Object o = null;
		if(arr.length == 2) { // 단일 조회
			Long rno = Long.valueOf(arr[1]);
			o = replyService.get(rno);
		}
		// /reply/list/{bno}
		// /reply/list/{bno}/{lastRno}
		// /reply/cnt/{bno}
		else if(arr.length >= 3) { // 목록 조회
			Long bno = Long.valueOf(arr[2]);
			if(arr[1].equals("list")) {
				Long lastRno = Long.MAX_VALUE;
				if(arr.length > 3) {
					lastRno = Long.valueOf(arr[3]);
				}
				o = replyService.getList(bno, lastRno);
			} else if(arr[1].equals("cnt")) {
				o = replyService.getCount(bno);
			}
		}
		resp.setContentType("application/json; charset=utf-8");
		resp.getWriter().print(gson.toJson(o));
	}

	
	// 등록 (post)
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String str = new BufferedReader(new InputStreamReader(req.getInputStream())).lines().collect(Collectors.joining());
		Reply reply = gson.fromJson(str, Reply.class);
		if(replyService.register(reply) > 0) { // 성공
			resp.setStatus(200);
			resp.getWriter().print(reply.getRno());
		} else { // 실패
			resp.setStatus(500);
		}
	}

	// 수정 (modify)
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String str = new BufferedReader(new InputStreamReader(req.getInputStream())).lines().collect(Collectors.joining());
		Reply reply = gson.fromJson(str, Reply.class);
		if(replyService.modify(reply) > 0) { // 성공
			resp.setStatus(200);
			resp.getWriter().print("success");
		} else { // 실패
			resp.setStatus(500);
		}
	}
}
