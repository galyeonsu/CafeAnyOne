package kr.co.jykjy.mapper;

import org.junit.Test;

import kr.co.jykjy.domain.Member;
import kr.co.jykjy.domain.Order;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import util.MybatisUtils;

@Log4j
public class OrderMapperTests {
	
	private OrderMapper orderMapper = MybatisUtils.sqlSessionFactory().openSession(true).getMapper(OrderMapper.class);
	
	@Test
	public void testInsert() { 
		// orderCode 구현 예정 
		
		Order order = new Order();
		order.setOrderCode("1L");
		order.setId("galgal");
		
		orderMapper.insert(order);
		log.info(order);
	}
	
}
