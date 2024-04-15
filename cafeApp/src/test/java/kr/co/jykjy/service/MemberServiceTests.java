package kr.co.jykjy.service;

import org.junit.Test;

import kr.co.jykjy.domain.Member;
import lombok.extern.log4j.Log4j;

@Log4j
public class MemberServiceTests {
	MemberService memberService = MemberService.getMemberService();
	
	@Test
	public void testmyBoard() {
		memberService.findBoard("galgal5");
	}
	@Test
	public void testReply() {
		memberService.findReply("galgal5");
	}
	@Test
	public void testReview()  {
		memberService.findReview("galgal5");
	}
	 
	@Test
	public void testsignup() {
		Member member =
		Member.builder().id("pak").pw("1234")
				.name("제이후").phone("010-2234-5678").email("w222@naver.com").gradeNO("gold").addr("구룡포").build();
		memberService.signup(member);
	}
	@Test
	public void testRead() {
		memberService.getMember("galgal5");
	}
	
	@Test
	public void testimg() {
		Member member =
		Member.builder().id("galgal5").mUuid("2345").mOrigin("9999").mPath("a123").build();
		memberService.updateimg(member);
	}
	
	@Test
	public void testduplicateEmail() {
		memberService.duplicateEmail("galgal5");
	}
	@Test
	public void testduplicateId() {
		memberService.duplicateId("galgal5");
	}
	 
	 
	// 주문목록조회 성공
	@Test
	public void TestOrder() {
		memberService.myOrder("sm");
	}
	@Test
	public void Testupdate() {
		Member member =
				Member.builder().id("galgal5").phone("010-2345-8989").addr("삼보").email("www503@daum.net").build();
		memberService.updateMember(member);
	}
	@Test
	public void test() {
		memberService.getMember("galgal5");
	}
	@Test
	public void testChange() {
		Member member =
				Member.builder().id("galgal5").pw("12341234").build();
	}
}
