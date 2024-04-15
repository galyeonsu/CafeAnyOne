package memberTests;

import javax.servlet.annotation.WebServlet;

import org.junit.Test;

import kr.co.jykjy.domain.Member;
import kr.co.jykjy.mapper.MemberMapper;
import kr.co.jykjy.service.MemberService;
import lombok.Builder;
import lombok.extern.log4j.Log4j;
import util.MybatisUtils;

@Log4j

public class sinupTest {
	private MemberMapper memberMapper = MybatisUtils.sqlSessionFactory().openSession(true)
			.getMapper(MemberMapper.class);

	@Test
	public void testsinup() {
		Member member = Member.builder().id("galgal").pw("1234").name("갈갈").phone("010-1234-5678")
				.email("www503@naver.com").build();
		log.info(member);
		memberMapper.insert(member);
	}
}
