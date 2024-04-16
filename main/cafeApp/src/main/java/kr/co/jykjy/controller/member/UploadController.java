package kr.co.jykjy.controller.member;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import com.google.gson.Gson;

import kr.co.jykjy.domain.Cart;
import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.domain.Member;
import kr.co.jykjy.domain.Member.MemberBuilder;
import kr.co.jykjy.domain.PrAttach;
import kr.co.jykjy.domain.Product;
import kr.co.jykjy.service.CartService;
import kr.co.jykjy.service.MemberService;
import lombok.extern.log4j.Log4j;
import util.UploadUtils;
import util.Webutils;

@Log4j
@WebServlet("/profile/")
public class UploadController extends HttpServlet {
	private MemberService memberService = MemberService.getMemberService();
	Gson gson = new Gson();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member member = Webutils.getMember(req);
		resp.setContentType("application/json; charset=utf-8");
		
		String o = null;
		o = member.getMUuid();
		log.info("uuiduuiduuiduuiduuiduuiduuiduuid"+ o);
		resp.getWriter().print(gson.toJson(o));
	}
	 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member member = Webutils.getMember(req);
		req.setCharacterEncoding("UTF-8");
		
		ServletFileUpload fileUpload = UploadUtils.init();
		List<FileItem> items = fileUpload.parseRequest(new ServletRequestContext(req));
		
		if (memberService.updateimg(member) > 0) {
			for (FileItem fi : items) {
				if (fi.getSize() == 0) continue;
					System.out.printf("파라미터 명 : %s, 파일명 : %s, 파일 크기 : %d \n", fi.getFieldName(), fi.getName(), fi.getSize());
				try {
					String origin = fi.getName();
					String ext = "";
					if (origin.lastIndexOf(".") != -1) {
						ext = origin.substring(origin.lastIndexOf("."));
					}
					String uuid = UUID.randomUUID() + ext;
					String todayPath = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
//					File path = new File(UploadUtils.REPOSITORY);
					File path = new File(req.getServletContext().getRealPath("/upload/"));
					if (!path.exists()) {
						path.mkdirs();
					}
					Member realMember = Member.builder().mUuid(uuid).mOrigin(origin).mPath(todayPath).id(member.getId()).build();
					fi.write(new File(path, uuid));
					memberService.updateimg(realMember);
					
					req.getSession().setAttribute("member", memberService.getMember(member.getId()));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} else {
			resp.setStatus(500);
		}
	}
}
