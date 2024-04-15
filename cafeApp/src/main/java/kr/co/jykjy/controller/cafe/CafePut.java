package kr.co.jykjy.controller.cafe;

import java.io.File;
import java.io.IOException;
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

import kr.co.jykjy.domain.Cafe;
import kr.co.jykjy.domain.CfAttach;
import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.service.CafeService;
import lombok.extern.log4j.Log4j;
import util.AmazonWebServiceS3;
import util.UploadUtils;

@Log4j
@WebServlet("/cafe/put")
public class CafePut extends HttpServlet {
	private CafeService cafeService = CafeService.getCafeService();
	public AmazonWebServiceS3 awsS3 = AmazonWebServiceS3.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/order/cafePut.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletFileUpload fileUpload = UploadUtils.init();
		log.info(req.getParameter("cafeAddr"));
		
		List<FileItem> items = fileUpload.parseRequest(new ServletRequestContext(req));
		Cafe.CafeBuilder cafeBuilder = Cafe.builder();
		Criteria.CriteriaBuilder cb = Criteria.builder();
		List<CfAttach> attachs = new ArrayList<CfAttach>();
		
		for (FileItem fi : items) {
			if (fi.isFormField()) {
				if(fi.getFieldName().equals("cafeNo")) {
					cafeBuilder.cafeNo(Long.parseLong(fi.getString("utf-8")));
				} else if (fi.getFieldName().equals("cafeAddr")) {
					cafeBuilder.cafeAddr(fi.getString("utf-8"));
				} else if (fi.getFieldName().equals("cafeTell")) {
					cafeBuilder.cafeTell(fi.getString("utf-8"));
				} 
			} else {
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
//					File path = new File(UploadUtils.REPOSITORY, todayPath);
//					if (!path.exists()) {
//						path.mkdirs();
//					}
//					fi.write(new File(path, uuid));
//					File dir = new File(req.getServletContext().getRealPath("/upload"), todayPath);
//					if (!dir.exists()) {
//						dir.mkdirs();
//					}
//					fi.write(new File(dir, uuid));
					File path = new File(req.getServletContext().getRealPath("/upload/"));
					
					if (!path.exists()) {
						path.mkdirs();
					}
					fi.write(new File(path, uuid));
					attachs.add(CfAttach.builder().cfUuid(uuid).cfOrigin(origin).cfFilePath(todayPath).build());
					awsS3.upload(new File(path + "/" + uuid) , uuid);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		 
		Criteria criteria = cb.build();
		Cafe cafe = cafeBuilder.cfAttachs(attachs).build();
		log.info("cafe :: "+cafe);
		// 등록
		cafeService.register(cafe);
		log.info(cafe);
		resp.sendRedirect("choice?" + criteria.getQs());
	}
}
