package kr.co.jykjy.mapper;

import java.util.List;

import kr.co.jykjy.domain.Payment;

/**
 * 
 * @author kss
 * @ 상품 주문
 */

public interface PaymentMapper {
	public int insert(Payment payment); // 상품 주문 결제 등록
	
	public List<Payment> getList(String orderCode); // 상품 주문번호별 조회
}
