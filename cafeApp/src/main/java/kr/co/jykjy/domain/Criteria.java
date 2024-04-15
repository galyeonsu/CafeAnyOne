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
 * @serial category 카테고리 
 * @serial pageNum 페이지번호
 * @serial amount 목록 갯수
 * @serial type 검색 조건
 * @serial keyword 검색어
 */

@Data
@Builder
@AllArgsConstructor
public class Criteria {
	@Builder.Default
	private int category = 1;
	@Builder.Default
	private int pageNum = 1;
	@Builder.Default
	private int amount = 10;
	@Builder.Default
	private String type = "";
	@Builder.Default
	private String keyword = "";
	
	public int getOffset() {
		return (pageNum - 1) * amount;
	}
	
	public String getQs() {
		List<String> list = new ArrayList<String>();
		list.add("category=" + category);
		list.add("pageNum=" + pageNum);
		list.add("amount=" + amount);
		list.add("type=" + type);
		list.add("keyword=" + keyword);
		
		return String.join("&", list);
	}
	
	
	public String getQs3() {
		List<String> list = new ArrayList<String>();
		list.add("amount=" + amount);
		list.add("category=" + category);
		list.add("type=" + type);
		list.add("keyword=" + keyword);
		
		return String.join("&", list);
	}
	
	public String[] getTypeArr() {
		return type.split(",");
	}
}
