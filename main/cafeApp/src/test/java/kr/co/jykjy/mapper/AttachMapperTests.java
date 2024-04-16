package kr.co.jykjy.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import kr.co.jykjy.domain.Attach;
import lombok.extern.log4j.Log4j;
import util.MybatisUtils;

@Log4j
public class AttachMapperTests {
	private AttachMapper attachMapper = MybatisUtils.sqlSessionFactory().openSession(true).getMapper(AttachMapper.class);

	@Test
	public void testInsert() {
		Attach attach = Attach.builder().uuid("uuidtest").origin("origin1").filePath("path1").bno(61L).build();
		log.info(attach);
		attachMapper.insert(attach);
		log.info(attach);
	}
	
	@Test
	public void testDelete() {
		attachMapper.delete("2");
	}
	
	@Test
	public void testDeleteAll() {
		attachMapper.deleteAll(61L);
	}
	
	@Test
	public void testSelectList() {
		attachMapper.selectList(62L).forEach(a->log.info(a));
	}
	
	@Test
	public void testDeleteOption() {
		SqlSession session = MybatisUtils.sqlSessionFactory().openSession(false);
		List<String> list = new ArrayList<String>();
//		list.add("2a6d36fd-7652-483b-92fc-f3da6d5dab86.jpg");
//		list.add("3772adfc-b023-4b67-870a-307493e43517.docx");
		
		attachMapper.deleteOption(88L, list);
		
		attachMapper.selectList(88L).forEach(log::info);
		session.rollback();
	}
	
}
