package kr.co.jykjy.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.jykjy.domain.Order;
import kr.co.jykjy.mapper.OrderMapper;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;
import util.MybatisUtils;

/**
 * 
 * @author kss kjy
 * @ 상품 결제 서비스
 */

@Log4j
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class OrderService{
	@Getter
	private static OrderService orderService = new OrderService();
	private SqlSession sqlSession = MybatisUtils.sqlSessionFactory().openSession(true);
	private OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
	
	public int register(Order order) {
		return orderMapper.insert(order);
	}
	
	public List<Order> getList() {
		return orderMapper.getList();
	}
	
	public int update(Order order) {
		return orderMapper.update(order);
	}
}
