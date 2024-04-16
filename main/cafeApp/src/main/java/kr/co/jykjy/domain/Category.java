package kr.co.jykjy.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Category {
	private final int cno;
	private final String cname;
	
	public List<Category> selectList() {
		List<Category> list = new ArrayList<>();
		
		return list;
	}
}
