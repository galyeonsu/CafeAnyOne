package kr.co.jykjy.controller.product;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.domain.Review;
import kr.co.jykjy.service.ReviewService;

/**
 * 
 * @author kss
 * @ 상품리뷰
 */

@WebServlet("/review/*")
public class ProductReview extends HttpServlet {
	private ReviewService reviewService = ReviewService.getReviewService();
	private Gson gson = new Gson();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String[] arr = uri.substring(1).split("/");
		Object o = null;
		Map<String, Object> map = new HashMap<>();
		resp.setContentType("application/json; charset=utf-8");
		
		if (arr.length == 2) {
			Long rvNo = Long.parseLong(arr[1]);
			o = reviewService.get(rvNo);
			resp.getWriter().print(gson.toJson(o));
		} else if (arr.length >= 3) {
			String str = arr[3];
			String pageNum = str.replaceAll("[^0-9]", "");
			Criteria.CriteriaBuilder cb = Criteria.builder();
			if (pageNum != null) {
				cb.pageNum(Integer.parseInt(pageNum));
			}
			
			Criteria criteria = cb.build();	
			
			Long proNo = Long.parseLong(arr[2]);
			map.put("reviewCnt", reviewService.totalCount(proNo));
//			map.put("list", reviewService.getList(proNo));
			map.put("list", reviewService.getListReviewWithPaging(proNo, criteria));
			resp.getWriter().print(gson.toJson(map));
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String str = new BufferedReader(new InputStreamReader(req.getInputStream())).lines().collect(Collectors.joining());
		Review review = gson.fromJson(str, Review.class);
		
		if(reviewService.register(review) > 0) {
			resp.setStatus(200);
			resp.getWriter().print(review.getProNo());
		} else {
			resp.setStatus(500);
		}
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String[] arr = uri.substring(1).split("/");
		
		if(arr.length == 2) { // 단일삭제
			Long rvNo = Long.valueOf(arr[1]);
			if(reviewService.delete(rvNo) > 0) {
				resp.setStatus(200);
				resp.getWriter().print("success");
			} else {
				resp.setStatus(500);
			}
		}
	}
}
