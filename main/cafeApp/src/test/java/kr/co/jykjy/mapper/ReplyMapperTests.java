package kr.co.jykjy.mapper;

import org.junit.Test;

import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.domain.Reply;
import lombok.extern.log4j.Log4j;
import util.MybatisUtils;

@Log4j
public class ReplyMapperTests {
	private ReplyMapper replyMapper = MybatisUtils.sqlSessionFactory().openSession(true).getMapper(ReplyMapper.class);
	
	@Test
	public void testInsert() {
		Reply reply = new Reply();
		reply.setBno(81L);
		reply.setContent("mapper test 댓글 내용");
		reply.setId("bhy");
		
		replyMapper.insert(reply);
	}
	
	@Test
	public void testRead() {
		replyMapper.read(2L);
	}
	
	@Test
	public void testUpdate() {
		Reply reply = replyMapper.read(2L);
		reply.setContent("mapper test 수정 댓글");
		replyMapper.update(reply);
		log.info(replyMapper.read(2L));
	}
	
	@Test
	public void testDelete() {
		replyMapper.delete(1L);
	}
	
	@Test
	public void testDeleteAll() {
		replyMapper.deleteAll(87L);
	}
	
	@Test
	public void testGetList() {
		Criteria criteria = Criteria.builder().pageNum(1).amount(10).build();
		replyMapper.getList(81L, 24L).forEach(log::info);
	}
	
	@Test
	public void testGetTotal() {
		log.info(replyMapper.getTotal(134L));
	}
}
