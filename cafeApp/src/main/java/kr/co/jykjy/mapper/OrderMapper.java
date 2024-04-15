package kr.co.jykjy.mapper;

import java.util.List;

import kr.co.jykjy.domain.Order;

/**
 * 
 * @author kss kjy
 * @ 상품 결제 라인
 */

public interface OrderMapper {
	public int insert(Order order); // 주문 추가
	
	public List<Order> getList(); // 주문 목록
	
	public int update(Order order); // 주문 상태 변경
}
