package kr.co.jykjy.domain;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Builder.Default;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Board {
	private Long bno;
	private String title;
	private String content;
	private Date regDate;
	private Date updateDate;
	
	private String id;
	private Integer category;
	private int replyCnt;
	@Default
	private List<Attach> attachs = new ArrayList<Attach>();
	
	public Attach getAttach() {
		Attach attach = null;
		for(Attach a : attachs ) {
			if(a.isImage()) {
				attach = a;
				break;
			}
		}
		return attach;
	}
}