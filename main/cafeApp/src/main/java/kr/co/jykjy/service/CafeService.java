package kr.co.jykjy.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.jykjy.domain.Cafe;
import kr.co.jykjy.domain.CfAttach;
import kr.co.jykjy.mapper.CafeMapper;
import kr.co.jykjy.mapper.CartMapper;
import kr.co.jykjy.mapper.CfAttachMapper;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;
import util.MybatisUtils;

@Log4j
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class CafeService {
	
	@Getter
	private static CafeService cafeService = new CafeService();
	private SqlSession sqlSession = MybatisUtils.sqlSessionFactory().openSession(true);
	private CafeMapper cafeMapper = sqlSession.getMapper(CafeMapper.class);
	private CfAttachMapper cfAttachMapper = sqlSession.getMapper(CfAttachMapper.class);
	
	// transaction
	public void register(Cafe cafe) {
		List<CfAttach> attachList = cafe.getCfAttachs();
		
		int res = cafeMapper.insert(cafe);
		
		for(CfAttach cfAttach : attachList) {
			cfAttach.setCafeNo(cafe.getCafeNo());
			// file DB input
			cfAttachMapper.attachInsert(cfAttach);
		}
				
		if(res > 0) {
			sqlSession.commit();
		}
	}
	
	public void getList() {
		cafeMapper.getList().forEach(cafe -> log.info(cafe));
	}
	
	public List<Cafe> returnCafe() {
		
		return cafeMapper.getList();
	}
	
	public List<CfAttach> findByCfAttachNo(Long cafeNo){
		return cfAttachMapper.findByNo(cafeNo);
	}
	
	public Cafe findByCafeNo(Long cafeNo) {
		
		return cafeMapper.findByCafeNo(cafeNo);
	}
	
}
