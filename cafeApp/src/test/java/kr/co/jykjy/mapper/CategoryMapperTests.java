package kr.co.jykjy.mapper;

import org.junit.Test;

import lombok.extern.log4j.Log4j;
import util.MybatisUtils;

@Log4j
public class CategoryMapperTests {
	private CategoryMapper categoryMapper = MybatisUtils.sqlSessionFactory().openSession(true).getMapper(CategoryMapper.class);
	
	@Test
	public void testSelectList() {
		categoryMapper.selectList().forEach(log::info);
	}
}
