package kr.co.jykjy.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 
 * @author kss kjy
 * @ 주문 필드
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Order {
	private Long orderNo;
	private String orderCode; // 주문번호
	private String payMethod; // 결제 방식
	private String cardBank; // 카드 은행
	private String cardNumber; // 카드 승인 번호
	private String orderPrice; // 결제 금액
	private String address; // 배송지
	private int complete; // 0 주문/취소 1 승인완료 
	private String id;
	private Date orderDate;
	private String name;
	private String email;
	private Long cartNo;
}
