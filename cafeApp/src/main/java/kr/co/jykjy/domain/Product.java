package kr.co.jykjy.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 
 * @author kss
 * @ 상품 필드
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	private Long proNo;
	private String proName;
	private String proDetail;
	private String proPrice;
	private String proSize;
	private String proStmt;
	private int prCategory;
	private String cupChoice;
	
	@Builder.Default
	private List<PrAttach> attachs = new ArrayList<>();
	private boolean attached;
	private int reviewCount;
	private Double reviewScore;
}
