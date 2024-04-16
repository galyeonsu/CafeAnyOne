package kr.co.jykjy.mapper;

import java.util.List;

import kr.co.jykjy.domain.Board;
import kr.co.jykjy.domain.Cart;
import kr.co.jykjy.domain.Member;
import kr.co.jykjy.domain.MemberMyOrder;
import kr.co.jykjy.domain.Order;
import kr.co.jykjy.domain.Payment;
import kr.co.jykjy.domain.Reply;
import kr.co.jykjy.domain.Review;

public interface MemberMapper {
	List<Member>  getList();
	List<Review> getreview();
	
	
	// 상세조회
	public Member read(String id);
	
	// 회원가입
	public int insert(Member member);
	
	// 회원삭제
	public int delete(String id);
	
	// 개인정보 변경
	public int myUpdate(Member member);
	
	// 비밀번호 변경
	public int passwordUpdate(Member member);
	
	// 리뷰 조회
	public List<Review> myReview(String id);
	
	// 게시글 조회
	public List<Board> myBoard(String id);
	
	// 댓글조회
	public List<Reply> myReplay(String id);
	
	// 이메일 조회
	public Member readByEmail(String email);
	
	// 이메일 중복체크	
	public int selectOneByEmail(String email);
	
	// 아이디 중복 체크
	public int selectOneById(String id);
	
	// 이미지 추가
	public int imagUpdate(Member member);
	
	//주문 목록 조회
	public List<Order> OrderList(String id);
	
	//주문 목록 조회
	public List<MemberMyOrder> myOrder(String id);
	
//	// 회원 가입시 중복 체크
//	int selectOneById(String id); 
	
	
	
	
	
	
}
