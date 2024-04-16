package kr.co.jykjy.service;

import org.junit.Test;

import kr.co.jykjy.domain.CfAttach;
import kr.co.jykjy.mapper.CfAttachMapper;
import kr.co.jykjy.mapper.OrderMapper;
import lombok.extern.log4j.Log4j;
import util.MybatisUtils;

@Log4j
public class CfAttachMapperTests {
	
	private CfAttachMapper attachMapper = MybatisUtils.sqlSessionFactory().openSession(true).getMapper(CfAttachMapper.class);
	
	@Test
	public void testAttachInsert() {
		CfAttach attach = CfAttach.builder().cfUuid("abcde").cfFilePath("qwer").cfOrigin("zxcv").cafeNo(2L).build();
		attachMapper.attachInsert(attach);
	}

}
