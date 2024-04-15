package MemberMapperTests;

import java.util.List;

import javax.servlet.annotation.WebServlet;

import org.junit.Test;

import kr.co.jykjy.domain.Board;
import kr.co.jykjy.domain.Member;
import kr.co.jykjy.domain.Reply;
import kr.co.jykjy.domain.Review;
import kr.co.jykjy.mapper.MemberMapper;
import kr.co.jykjy.service.MemberService;
import lombok.Builder;
import lombok.extern.log4j.Log4j;
import util.MybatisUtils;

@Log4j
@WebServlet("")
public class MemberMapperTest {
	private MemberMapper memberMapper = MybatisUtils.sqlSessionFactory().openSession(true)
			.getMapper(MemberMapper.class);
	
	//상세조회 성공
	@Test
	public void testread() {
		memberMapper.read("galgal5");
	}
	 
	// 회원 가입 테스트 성공
	@Test
	public void testsinup() {
		Member member = Member.builder().id("ibbb").pw("1234").name("박수홍").phone("010-2234-5678")
				.email("test@trst").addr("대륭포").build();
		log.info(member);
		memberMapper.insert(member);
		
	}
	// 삭제 테스트 성공
	@Test 
	public void testsdelet() {
		memberMapper.delete("hong");
	}
	
	
	// 개인정보 수정 테스트 성공
	@Test
	public void testmyUpdate() {
		Member findMember = memberMapper.read("galgal5");
 
		findMember.setPhone("010-76888-3736");
		findMember.setAddr("지브롤터");
		findMember.setEmail("www503@naver.com");
		
		 memberMapper.myUpdate(findMember);
	}
	// 비밀번호 변경 테스트 성공
	@Test
	public void testpasswordupdate() {
		Member findMember = memberMapper.read("kal");
//		update tbl_member set
//		pw = #{pw} where id = #{id}
		
		findMember.setPw("dustn");
		
		memberMapper.passwordUpdate(findMember);
	}
	
	// 리뷰 조회 성공 
	@Test
	public void testReview() {
	    List<Review> reviews = memberMapper.myReview("hong");
	}
	 
	// 게시글 조회 성공
	@Test
	public void testBoard() {
		List<Board> boards = memberMapper.myBoard("galgal5");
	}
	
	// 댓글 조회 성공
	@Test
	public void testReply() {
		List<Reply> replys = memberMapper.myReplay("galgal5");
	}
	
	
	@Test
	public void testimg() {
		Member findMember = memberMapper.read("galgal5");

		findMember.setMUuid("asdf");
		findMember.setMOrigin("jjjjjj");
		findMember.setMPath("Asdf");
		
		memberMapper.imagUpdate(findMember);
	}
	// 아이디 갯수조회
	@Test
	public void testselectOneById() {
		memberMapper.selectOneById("galgal5");
	}
	
	// email 갯수 조회
	@Test
	public void testselectOneByEmail() {
		memberMapper.selectOneByEmail("www503@naver.com");
	}
	
	 
	// 주문목록 조회
	@Test
	public void TestOrderList() {
		memberMapper.myOrder("sm");
	}
	  
	
//	@Test
//	public void duplication() {
//		Member member = Member.builder().id("galgal").build();
//		log.info(isduplication(member.getId()));
//	}
	
}
