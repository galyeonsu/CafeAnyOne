package kr.co.jykjy.service;
 
import org.junit.Test;

import kr.co.jykjy.domain.Order;
import kr.co.jykjy.service.OrderService;
import lombok.extern.log4j.Log4j;

@Log4j
public class OrderServiceTests {
	
	private OrderService orderService = OrderService.getOrderService();
	
	@Test
	public void testInsert() {
		Order order = new Order();
		order.setOrderCode("1");
		order.setId("galgal");
		
		orderService.register(order);
		log.info(order);
	} 
	
}
