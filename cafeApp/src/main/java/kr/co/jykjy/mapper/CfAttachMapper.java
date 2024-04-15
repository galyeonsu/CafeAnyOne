package kr.co.jykjy.mapper;

import java.util.List;

import kr.co.jykjy.domain.CfAttach;

public interface CfAttachMapper {
	int attachInsert(CfAttach cfAttach);
	
	List<CfAttach> findByNo(Long cafeNo);
}
