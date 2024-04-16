package kr.co.jykjy.mapper;

import java.util.List;

import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.domain.Product;

/**
 * 
 * @author kss
 * @ 상품 
 */

public interface ProductMapper {
	public List<Product> getList(Criteria cri); // 상품 목록

	public int insert(Product product); // 상품 등록
	
	public Product findByProNo(Long proNo); // 상품 조회 
	
	public int getTotalCount(Criteria cri); // 상품 갯수
	
	public int delete(Long proNo); // 상품 삭제
	
	public int update(Product product); // 상품 수정
}
