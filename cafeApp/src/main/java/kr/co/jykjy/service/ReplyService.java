package kr.co.jykjy.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.domain.Reply;
import kr.co.jykjy.mapper.BoardMapper;
import kr.co.jykjy.mapper.ReplyMapper;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;
import util.MybatisUtils;

@Log4j
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class ReplyService {
	@Getter
	private static ReplyService replyService = new ReplyService();
	private SqlSession session = MybatisUtils.sqlSessionFactory().openSession(true);
	private ReplyMapper replyMapper = session.getMapper(ReplyMapper.class);
	private BoardMapper boardMapper = session.getMapper(BoardMapper.class);
	
	public int register(Reply reply) {
		boardMapper.updateReplyCnt(reply.getBno(), 1);
		return replyMapper.insert(reply);
	}
	public Reply get(Long rno) {
		return replyMapper.read(rno);
	}
	public int modify(Reply reply) {
		return replyMapper.update(reply);
	}
	public int remove(Long rno) {
		boardMapper.updateReplyCnt(get(rno).getBno(), -1);
		return replyMapper.delete(rno);
	}
	public List<Reply> getList(Long bno, Long lastRno) {
		return replyMapper.getList(bno, lastRno);
	}
	public int getCount(Long bno) {
		return replyMapper.getTotal(bno);
	}
}
