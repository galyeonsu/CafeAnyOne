package kr.co.jykjy.service;

import java.util.List;

import kr.co.jykjy.domain.Category;
import kr.co.jykjy.mapper.BoardMapper;
import kr.co.jykjy.mapper.CategoryMapper;
import lombok.extern.log4j.Log4j;
import util.MybatisUtils;

@Log4j
public class CategoryService {
	private CategoryMapper categoryMapper = MybatisUtils.sqlSessionFactory().openSession(true).getMapper(CategoryMapper.class);
	
	public List<Category> getCateogoryList() {
		return categoryMapper.selectList();
	}
}
