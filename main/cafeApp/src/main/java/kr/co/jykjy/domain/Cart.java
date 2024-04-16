package kr.co.jykjy.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 
 * @author kss kjy
 * @ 장바구니 필드
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
	private Long cartNo;
	private String proName;
	private String proPrice;
	private String proAmt;
	private String stmt;
	private String cupSize;
	private String cupChoice;
	private int cartcate;
	private int cartStmt;
	private String id;
	private Long proNo;
	private Date regDate; 

	@Builder.Default
	private List<PrAttach> attachs = new ArrayList<>();
}
