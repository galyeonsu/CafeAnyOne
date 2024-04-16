package kr.co.jykjy.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.domain.Review;
import kr.co.jykjy.mapper.ReviewMapper;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import util.MybatisUtils;

/**
 * 
 * @author kss
 * @ 리뷰 서비스
 */

@NoArgsConstructor(access=AccessLevel.PRIVATE)
public class ReviewService {
	@Getter
	private static ReviewService reviewService = new ReviewService();
	private SqlSession sqlSession = MybatisUtils.sqlSessionFactory().openSession(true);
	private ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
	
	public List<Review> getList(Long proNo) {
		return reviewMapper.getListReview(proNo);
	}
	
	public Review get(Long rvNo) {
		return reviewMapper.findByRvNo(rvNo);
	}
	
	public int totalCount(Long proNo) {
		return reviewMapper.getListCount(proNo);
	}
	
	public int register(Review review) {
		return reviewMapper.reviewInsert(review);
	}
	
	public Double getScore(Long proNo) {
		return reviewMapper.getListScore(proNo);
	}
	
	public List<Review> getListReviewWithPaging(Long proNo, Criteria cri) {
		return reviewMapper.getListReviewWithPaging(proNo, cri);
	}
	
	public int delete(Long rvNo) {
		return reviewMapper.delete(rvNo);
	}
	
	public int getCount(Criteria criteria) {
		return reviewMapper.getListCount(criteria);
	}
}
