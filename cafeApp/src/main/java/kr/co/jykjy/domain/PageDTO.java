package kr.co.jykjy.domain;

import lombok.Data;

@Data
public class PageDTO {
	public int SHOW_PAGE_COUNT = 5;
	
	private Criteria cri;
	private int total;
	
	private int startPage;
	private int endPage;
	
	private boolean next;
	private boolean prev;
	
	private boolean nexts;
	private boolean prevs;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		// 마지막 페이지 번호
		endPage = (cri.getPageNum() + SHOW_PAGE_COUNT - 1) / SHOW_PAGE_COUNT * SHOW_PAGE_COUNT;
		
		// 시작 페이지 번호
		startPage = endPage - SHOW_PAGE_COUNT + 1;
		
		int realEnd = (total + (cri.getAmount() - 1)) / cri.getAmount();
		if(endPage > realEnd) {
			endPage = realEnd;
		}
		
		prev = cri.getPageNum() > 1 && cri.getPageNum() <= realEnd;
		next = cri.getPageNum() < realEnd;
		
		prevs = startPage > 1;
		nexts = endPage < realEnd;
 	}
}
