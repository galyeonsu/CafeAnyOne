package kr.co.jykjy.mapper;

import java.util.List;

import kr.co.jykjy.domain.PrAttach;

/**
 * 
 * @author kss
 * @ 상품 이미지  
 */

public interface PrAttachMapper {
	public List<PrAttach> getListAttatch(); // 상품 이미지 목록 
	
	public List<PrAttach> findByNo(Long proNo); // 상품 이미지 조회

	public int attachInsert(PrAttach prAttach); // 상품 이미지 등록
	
	public int attachDelete(Long proNo); // 상품 이미지 삭제
}
