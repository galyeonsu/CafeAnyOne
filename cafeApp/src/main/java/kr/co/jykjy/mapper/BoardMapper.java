package kr.co.jykjy.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.jykjy.domain.Board;
import kr.co.jykjy.domain.Criteria;

public interface BoardMapper {
	// 게시글 목록 조회
	List<Board> getList();
	
	// 게시글 단일 조회
	Board read(Long bno);
	
	// 게시글 등록
	void insert(Board board);
	
	void insertSelectKey(Board board);
	
	// 게시글 수정
	int update(Board board);
	
	// 게시글 삭제
	int delete(Long bno);
	
	// 총 게시글 수
	int getTotal(Criteria criteria);

	// 카테고리별 총 게시글 수
	int getCount(Criteria criteria);
	
	List<Board> getListsWithPaging(Criteria criteria);
	
	// 검색
	List<Board> testSearch(@Param("map") Map<String, String> map);
	
	// 게시글 별 댓글 수
	void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
}
