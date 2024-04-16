package kr.co.jykjy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.domain.Reply;

public interface ReplyMapper {
	// 댓글 작성
	int insert(Reply reply);
	
	// 조회
	Reply read(Long rno);
	
	// 수정
	int update(Reply reply);
	
	// 삭제
	int delete(Long rno);
	// 댓글이 있는 글을 삭제할 때
	int deleteAll(Long bno);
	
	// 댓글목록 
	List<Reply> getList(@Param("bno") Long bno, @Param("lastRno") Long lastRno);
	
	// 게시글 당 댓글 수
	int getTotal(Long bno);
}
