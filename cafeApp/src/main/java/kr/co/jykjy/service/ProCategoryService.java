package kr.co.jykjy.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.jykjy.domain.ProCategory;
import kr.co.jykjy.mapper.ProCategoryMapper;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import util.MybatisUtils;

/**
 * 
 * @author kss
 * @ 상품 메뉴 서비스
 */

@NoArgsConstructor(access=AccessLevel.PRIVATE)
public class ProCategoryService {
	@Getter
	private static ProCategoryService proCategoryService = new ProCategoryService();
	private SqlSession sqlSession = MybatisUtils.sqlSessionFactory().openSession();
	private ProCategoryMapper categoryMapper = sqlSession.getMapper(ProCategoryMapper.class);
	
	public List<ProCategory> getList() {
		return categoryMapper.getListCategory();
	}
}
