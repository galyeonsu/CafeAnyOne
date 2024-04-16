package kr.co.jykjy.mapper;

import org.junit.Test;

import kr.co.jykjy.domain.Board;
import kr.co.jykjy.domain.Criteria;
import lombok.extern.log4j.Log4j;
import util.MybatisUtils;

@Log4j
public class BoardMapperTests {
	
	private BoardMapper boardMapper = MybatisUtils.sqlSessionFactory().openSession(true).getMapper(BoardMapper.class);
	
	@Test
	public void testGetList() {
		boardMapper.getList().forEach(log::info);
	}
	
	@Test
	public void testRead() {
		Board board = boardMapper.read(2L);
		log.info(board);
	}
	
	@Test
	public void testInsert() {
		Board board = new Board();
		board.setTitle("mapper test title");
		board.setContent("mapper test content");
		
		log.info(board);
		boardMapper.insert(board);
		log.info(board);
	}
	
	@Test
	public void testDelete() {
		boardMapper.delete(87L);
	}
	
	@Test
	public void testUpdate() {
		Board board = boardMapper.read(46L);
		log.info(board);
		board.setTitle("mapper test 수정된 제목");
		board.setContent("mapper test 수정된 내용");
		
		boardMapper.update(board);
		
		board = boardMapper.read(46L);
		log.info(board);
	}
	
//	@Test
//	public void testGetTotal() {
//		Criteria criteria = new Criteria();
//		criteria.setType("T");
//		criteria.setKeyword("서비스");
//		log.info(boardMapper.getTotal(criteria));
//	}
	
	@Test
	public void testGetCount() {
		Criteria criteria = Criteria.builder().category(3).build();
		boardMapper.getCount(criteria);
	}
	
	@Test
	public void testGetListWithPaging() {
		Criteria criteria = Criteria.builder().amount(10).type("T,C").keyword("이브닝").build();
		//log.info(criteria);
		boardMapper.getListsWithPaging(criteria).forEach(log::info);
	}
	
	@Test
	public void testUpdateReplyCnt() {
		boardMapper.updateReplyCnt(134L, +1);
	}
}
