package kr.co.jykjy.mapper;

import java.util.List;

import kr.co.jykjy.domain.Cafe;

public interface CafeMapper {
	
	int insert(Cafe cafe);
	
	List<Cafe> getList();
	
	Cafe findByCafeNo(Long cafeNo);

}
