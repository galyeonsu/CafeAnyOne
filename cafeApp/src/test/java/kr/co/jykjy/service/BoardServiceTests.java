package kr.co.jykjy.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import kr.co.jykjy.domain.Board;
import kr.co.jykjy.domain.Criteria;
import lombok.extern.log4j.Log4j;

@Log4j
public class BoardServiceTests {
	private BoardService boardService = BoardService.getBoardService();
	
	@Test
	public void testGetList() {
		boardService.getList();
	}
	
	@Test
	public void testGet() {
		boardService.get(19L);
	}
	
	@Test
	public void testRegister() {
		Board board = new Board();
		board.setTitle("service test 게시글");
		board.setContent("service test content");
		
		boardService.register(board);
		log.info(board);
	}
	
	@Test
	public void testModify() {
		Board board = boardService.get(22L);
		board.setTitle("service test 수정 제목");
		board.setContent("service test 수정 내용");
		
		List<String> list = new ArrayList<String>();
		boardService.modify(board, list);
		
		board = boardService.get(19L);
	}
	
	@Test
	public void testRemove() {
		boardService.remove(23L);
	}
	
	@Test
	public void testGetCount() {
		Criteria criteria = Criteria.builder().category(1).build();
		boardService.getCount(criteria);
	}
}