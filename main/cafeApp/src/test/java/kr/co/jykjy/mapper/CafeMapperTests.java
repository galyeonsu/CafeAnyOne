package kr.co.jykjy.mapper;

import org.junit.Test;

import kr.co.jykjy.domain.Cafe;
import lombok.extern.log4j.Log4j;
import util.MybatisUtils;

@Log4j
public class CafeMapperTests {
	
	private CafeMapper cafeMapper = MybatisUtils.sqlSessionFactory().openSession(true).getMapper(CafeMapper.class);

	@Test
	public void testInsert() {
		Cafe cafe = new Cafe();
		cafe.setCafeAddr("구디근처2");
		cafe.setCafeTell("0212345678");
		
		cafeMapper.insert(cafe);
		log.info(cafe);
	}
	
	@Test
	public void testGetList() {
		cafeMapper.getList().forEach(cafe -> log.info(cafe));
	}
	
	
}
