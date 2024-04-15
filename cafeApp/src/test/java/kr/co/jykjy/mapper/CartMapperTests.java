package kr.co.jykjy.mapper;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;

import kr.co.jykjy.domain.Cart;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import util.MybatisUtils;

@Log4j
public class CartMapperTests {
	
	private CartMapper cartMapper = MybatisUtils.sqlSessionFactory().openSession(true).getMapper(CartMapper.class);
	
	@Test
	public void testInsert() {
		
		Cart cart = new Cart(); 
		cart.setProPrice("4500");
		cart.setProAmt("1");
		cart.setStmt("Hot");
		cart.setCupSize("Tall");
		cart.setCupChoice("개인");
		cart.setCartStmt(0);
		cart.setId("yyyy");
		cart.setProNo(34L);
		
		cartMapper.insert(cart);
		
	}
	
	@Test
	public void testGetCart() {
		Cart cart = new Cart();
		cartMapper.getCart("sm");
		log.info(cart);
	}
	
	@Test
	public void testUpdate() {
		List<Cart> cart = new ArrayList<Cart>();
		
//		cartMapper.update(cart);
		cart = cartMapper.getCart("yyyy");
		log.info(cart);
	}
	
}
