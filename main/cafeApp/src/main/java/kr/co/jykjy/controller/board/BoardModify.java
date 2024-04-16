package kr.co.jykjy.controller.board;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import kr.co.jykjy.domain.Attach;
import kr.co.jykjy.domain.Board;
import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.domain.Member;
import kr.co.jykjy.service.BoardService;
import lombok.extern.log4j.Log4j;
import util.UploadUtils;
import util.Webutils;

@Log4j
@WebServlet("/board/modify")
public class BoardModify extends HttpServlet {
	private BoardService boardService = BoardService.getBoardService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
					if (cate != null) {
						cb.category(Integer.parseInt(cate));
					}
					if (pageNum != null) {
						cb.pageNum(Integer.parseInt(pageNum));
					}
					if (amount != null) {
						cb.amount(Integer.parseInt(amount));
					}
					if (type != null) {
						cb.type(type);
					}
					if (keyword != null) {
						cb.keyword(keyword);
					}
					Criteria criteria = cb.build();
					
					req.setAttribute("cri", criteria);
					
					req.setAttribute("board", board);
					// 파라미터값으로 받아온 category번호에 따라 조건문으로 다른 jsp파일로 보내는 방법
					if (Integer.parseInt(cate) == 2) {
						// cno가 2일때
						req.getRequestDispatcher("/WEB-INF/views/board/event_modify.jsp").forward(req, resp);
					} else if (Integer.parseInt(cate) == 3) {
						// cno가 3일때
						req.getRequestDispatcher("/WEB-INF/views/board/FAQ_modify.jsp").forward(req, resp);
					} else {
						// cno가 1또는 4일때
						req.getRequestDispatcher("/WEB-INF/views/board/board_modify.jsp").forward(req, resp);
					}
				}
			}
		}
		Webutils.alert(resp, "비정상적 접근입니다.", req.getContextPath() + "/board/list");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		// 첨부파일 수정시 업로드가 포함되므로 BoardWrite의 post 작업과 동일해져야함
		ServletFileUpload fileUpload = UploadUtils.init();

		List<FileItem> items = fileUpload.parseRequest(new ServletRequestContext(req));
		Board.BoardBuilder boardBuilder = Board.builder();
		Criteria.CriteriaBuilder cb = Criteria.builder();
		List<Attach> attachs = new ArrayList<Attach>();
		List<String> uuids = new ArrayList<>();
		for (FileItem fi : items) {
			if (fi.isFormField()) {
				if (fi.getFieldName().equals("bno")) {
					boardBuilder.bno(Long.valueOf(fi.getString("utf-8")));
				} else if (fi.getFieldName().equals("title")) {
					boardBuilder.title(fi.getString("utf-8"));
				} else if (fi.getFieldName().equals("content")) {
					boardBuilder.content(fi.getString("utf-8"));
				} else if (fi.getFieldName().equals("type")) {
					cb.type(fi.getString("utf-8"));
				} else if (fi.getFieldName().equals("keyword")) {
					cb.keyword(fi.getString("utf-8"));
				} else if (fi.getFieldName().equals("category")) {
					cb.category(Integer.parseInt(fi.getString("utf-8")));
				} else if (fi.getFieldName().equals("pageNum")) {
					cb.pageNum(Integer.parseInt(fi.getString("utf-8")));
				} else if (fi.getFieldName().equals("amount")) {
					cb.amount(Integer.parseInt(fi.getString("utf-8")));
				} else if (fi.getFieldName().equals("uuid")) {
					uuids.add(fi.getString());
				}
			} else {
				if (fi.getSize() == 0)
					continue;
				System.out.printf("파라미터 명: %s, 파일명: %s, 파일 크기: %d \n", fi.getFieldName(), fi.getName(), fi.getSize());
				try {
					String origin = fi.getName();
					String ext = "";
					if (origin.lastIndexOf(".") != -1) {
						ext = origin.substring(origin.lastIndexOf("."));
					}
					String uuid = UUID.randomUUID() + ext;
					String todayPath = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
					File path = new File(UploadUtils.REPOSITORY, todayPath);
					if (!path.exists()) {
						path.mkdirs();
					}
					File f = new File(path, uuid);
					String ct = Files.probeContentType(f.toPath());
					System.out.println(f);
					System.out.println(ct);
					boolean image = false;
					if (ct != null) {
						image = ct.startsWith("image");
					}
					fi.write(f);
					// 파일을 쓰고 난 뒤, 어딘가에 추가해야함
					attachs.add(Attach.builder().uuid(uuid).origin(origin).filePath(todayPath).image(image).build());

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		Criteria criteria = cb.build();
		Board board = boardBuilder.category(criteria.getCategory()).attachs(attachs).build();

		boardService.modify(board, uuids);

		resp.sendRedirect("view?bno=" + board.getBno() + "&" + criteria.getQs());
	}

}
