package kr.co.jykjy.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.jykjy.domain.Board;
import kr.co.jykjy.domain.Member;
import kr.co.jykjy.domain.MemberMyOrder;
import kr.co.jykjy.domain.Order;
import kr.co.jykjy.domain.Reply;
import kr.co.jykjy.domain.Review;
import kr.co.jykjy.mapper.MemberMapper;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import util.MybatisUtils;


@NoArgsConstructor(access=AccessLevel.PRIVATE)
public class  MemberService {
	@Getter
	private static MemberService memberService = new MemberService();
	private SqlSession sqlSession = MybatisUtils.sqlSessionFactory().openSession(true);
	
	private MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
	
	// 회원 가입
	public int signup(Member member) {
		return memberMapper.insert(member);
	}
	
	// 회원 찾기
	public Member getMember(String id) {
		return memberMapper.read(id);
	}
	
	// 이메일 찾기
	public Member getMemberByEmail(String email) {
		return memberMapper.readByEmail(email);
	}
	
	// 회원 삭제
	public int remove(String id) {
		return memberMapper.delete(id);
	}
	
	// 회원정보 수정
	public int updateMember(Member member) {
		return memberMapper.myUpdate(member);
	}
	
	// 비밀번호 변경 
	public int updatePw(Member member) {
		return memberMapper.passwordUpdate(member);
	}
	
	// 리뷰 조회
	public List<Review>findReview(String id) {
		return memberMapper.myReview(id);
	}
	// 게시글조회
	public List<Board>findBoard(String id) {
		return memberMapper.myBoard(id);
	}
	// 댓글조회
	public List<Reply>findReply(String id){
		return memberMapper.myReplay(id);
	}
	 
	// 이미지 추가
	public int updateimg(Member member) {
		return memberMapper.imagUpdate(member);
	}
	
	// 아이디 중복검사
    public boolean duplicateId(String Id) {
        return memberMapper.selectOneById(Id) > 0 ? true : false;
    }
    // 이메일 중복검사
    public boolean duplicateEmail(String email) {
        return memberMapper.selectOneByEmail(email) > 0 ? true : false;
    }
    
    //주문목록조회
    public List<MemberMyOrder> myOrder(String id) {
    	return memberMapper.myOrder(id);
    }
	 
	
	
	
	
	
//  아이디 중복 체크
//	public boolean isduplication(String id) {
//		return memberMapper.selectOneById(id) > 0 ? true : false;
//	}
	
	
	
	
	
	
	
	
		


}
