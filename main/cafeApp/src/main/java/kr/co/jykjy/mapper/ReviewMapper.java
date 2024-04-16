package kr.co.jykjy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.domain.Review;

/**
 * 
 * @author kss
 * @ 상품 리뷰
 */

public interface ReviewMapper {
	public List<Review> getListReview(Long proNo); // 리뷰 목록
	
	public Review findByRvNo(Long rvNo); // 상품별 리뷰 목록
	
	public int getListCount(Long proNo); // 상품별 리뷰 갯수
	
	public int reviewInsert(Review review); // 리뷰 등록
	
	public Double getListScore(Long proNo); // 리뷰 평점
	
	public List<Review> getListReviewWithPaging(@Param("proNo") Long proNo, @Param("cri") Criteria criteria); // 리뷰 페이징
	
	public int delete(Long rvNo); // 리뷰 삭제
	
	public int getListCount(Criteria criteria);
}
