package kr.co.jykjy.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.jykjy.domain.Attach;
import kr.co.jykjy.domain.Board;
import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.mapper.AttachMapper;
import kr.co.jykjy.mapper.BoardMapper;
import kr.co.jykjy.mapper.ReplyMapper;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;
import util.MybatisUtils;

@Log4j
@NoArgsConstructor(access=AccessLevel.PRIVATE)
public class BoardService {
	@Getter
	private static BoardService boardService = new BoardService();
	private SqlSession session = MybatisUtils.sqlSessionFactory().openSession(true);
	private BoardMapper boardMapper = session.getMapper(BoardMapper.class);
//	private BoardMapper boardMapper = MybatisUtils.sqlSessionFactory().openSession(true).getMapper(BoardMapper.class);
	private AttachMapper attachMapper = session.getMapper(AttachMapper.class);
	private ReplyMapper replyMapper = session.getMapper(ReplyMapper.class);
	
	public void getList() {
		boardMapper.getList().forEach(board -> log.info(board));
	}
	
	public void getList(Criteria criteria) {
		boardMapper.getListsWithPaging(criteria).forEach(board -> log.info(board));
	}
	
	// 첨부파일 작업
	public Board get(Long bno) {
//		return boardMapper.read(bno);
		Board board = boardMapper.read(bno);
		board.setAttachs(attachMapper.selectList(bno));
		return board;
	}
	
	public void register(Board board) {
		boardMapper.insertSelectKey(board);
		board.getAttachs().forEach(attach -> {
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}
	
	public boolean modify(Board board, List<String> uuids) {
		boolean b = boardMapper.update(board) > 0;
		// 게시글 수정 : 첨부파일의 삭제 및 등록
		if(b) {
			// 기존 첨부 파일 삭제
			// attachMapper.deleteAll(board.getBno());
			
			// 첨부파일 일부 삭제
			attachMapper.deleteOption(board.getBno(), uuids);
			
			// 첨부파일 추가등록
			board.getAttachs().forEach(attach -> {
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}
		return b;
//		log.info(board);
	}
	
	public int remove(Long bno) {
		attachMapper.deleteAll(bno);
		replyMapper.deleteAll(bno);
		return boardMapper.delete(bno);
	}
	
	public List<Board> list(Criteria criteria) {
		List<Board> list = boardMapper.getListsWithPaging(criteria);
		list.forEach(board -> 
			board.setAttachs(attachMapper.selectList(board.getBno()))
		);
		return list;
	}
	
	public void getTotal(Criteria criteria) {
		boardMapper.getTotal(criteria);
	}
	// 카테고리별 총 게시글 수
	public int getCount(Criteria criteria) {
		return boardMapper.getCount(criteria);
	}
	
	public List<Attach> getAttachs(Long bno) {
		return attachMapper.selectList(bno);
	}
}
