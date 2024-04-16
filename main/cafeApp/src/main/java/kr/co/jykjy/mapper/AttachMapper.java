package kr.co.jykjy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.jykjy.domain.Attach;

public interface AttachMapper {
	void insert(Attach attach);
	
	void delete(String uuid);
	
	void deleteAll(Long bno);
	
	// find by bno
	List<Attach> selectList(Long bno);
	
	List<Attach> getOldFiles();

	// 첨부파일 수정용
	void deleteOption(@Param("bno") Long bno, @Param("uuids") List<String> uuids);
}
