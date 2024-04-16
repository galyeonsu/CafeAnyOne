package kr.co.jykjy.controller.product;

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

import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.domain.PrAttach;
import kr.co.jykjy.domain.Product;
import kr.co.jykjy.service.ProductService;
import util.AmazonWebServiceS3;
import util.UploadUtils;

/**
 * 
 * @author kss
 * @ 상품등록
 */

@WebServlet("/product/write")
public class ProductWrite extends HttpServlet {
	private ProductService productService = ProductService.getProductService();
	public AmazonWebServiceS3 awsS3 = AmazonWebServiceS3.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/product/productWrite.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletFileUpload fileUpload = UploadUtils.init();
		
		List<FileItem> items = fileUpload.parseRequest(new ServletRequestContext(req));
		Product.ProductBuilder productBuilder = Product.builder();
		Criteria.CriteriaBuilder cb = Criteria.builder();
		List<PrAttach> attachs = new ArrayList<PrAttach>();
		
		for (FileItem fi : items) {
			if (fi.isFormField()) {
				if(fi.getFieldName().equals("proNo")) {
					productBuilder.proNo(Long.parseLong(fi.getString("utf-8")));
				} else if (fi.getFieldName().equals("proName")) {
					productBuilder.proName(fi.getString("utf-8"));
				} else if (fi.getFieldName().equals("proDetail")) {
					productBuilder.proDetail(fi.getString("utf-8"));
				} else if (fi.getFieldName().equals("proPrice")) {
					productBuilder.proPrice(fi.getString("utf-8"));
				} else if (fi.getFieldName().equals("proSize")) {
					productBuilder.proSize(fi.getString("utf-8"));
				} else if (fi.getFieldName().equals("proStmt")) {
					productBuilder.proStmt(fi.getString("utf-8"));
				} else if (fi.getFieldName().equals("prCategory")) {
					productBuilder.prCategory(Integer.parseInt(fi.getString("utf-8")));
				} else if (fi.getFieldName().equals("cupChoice")) {
					productBuilder.cupChoice(fi.getString("utf-8"));
				}
			} else {
				if (fi.getSize() == 0) continue;
//				System.out.printf("파라미터 명 : %s, 파일명 : %s, 파일 크기 : %d \n", fi.getFieldName(), fi.getName(), fi.getSize());
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
					fi.write(new File(path, uuid));
					attachs.add(PrAttach.builder().prUuid(uuid).origin(origin).filePath(todayPath).build());
					awsS3.upload(new File(path + "/" + uuid) , uuid);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		Criteria criteria = cb.build();
		Product product = productBuilder.attachs(attachs).build();
		productService.register(product);
		
		resp.sendRedirect("list?" + criteria.getQs());
	}
}
