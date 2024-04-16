package kr.co.jykjy.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 
 * @author kss
 * @ 상품 주문 필드
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Payment {
	private Long payNo;
	private String orderCode;
	private String proName;
	private String proPrice;
	private String proAmt;
	private String stmt;
	private String cupSize;
	private int cartcate;
	private Long cartNo;
}
