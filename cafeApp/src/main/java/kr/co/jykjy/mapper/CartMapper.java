package kr.co.jykjy.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.jykjy.domain.Cart;

/**
 * 
 * @author kss kjy
 * @ 장바구니 라인
 */

public interface CartMapper {
	// 장바구니 목록 : 직접 수령, 배달 
	List<Cart> getCart(String id);
	
	// 장바구니에 존재하는 목록 조회
	List<Cart> CartByParams(@Param("id") String id, @Param("proNo") Long proNo);
	
	// 장바구니에 주문을 한 목록 조회 
	List<Cart> getOrderMenu(String id);
	
	// 장바구니 추가
	public int insert(Cart cart);
			
	// 장바구니 목록	
	public List<Cart> getList(String id);
	
	// 회원 장바구니 목록
	public Cart findByCartNo(String id);

	// 장바구니 수정
	public int modify(Cart cart);
	
	// 장바구니 삭제
	public int remove(Cart cart);
	
	public List<Cart> get(@Param("id") String id, @Param("proNo") Long proNo);
	
	public List<Cart> getOrderList(String id);
}
