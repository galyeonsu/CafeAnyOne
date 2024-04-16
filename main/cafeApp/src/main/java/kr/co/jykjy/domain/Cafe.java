package kr.co.jykjy.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 
 * @author kjy
 * @ 카페 필드
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Cafe {
	
	private Long cafeNo;
	private String cafeAddr;
	private String cafeTell;
	private String lat;
	private String lng;
	
	@Builder.Default
	private List<CfAttach> cfAttachs = new ArrayList<>();
	private boolean cfAttached;
}
