package kr.co.jykjy.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 
 * @author kss
 * @ 상품 메뉴 필드
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProCategory {
	private Long pcNo;
	private String pcName;
}
