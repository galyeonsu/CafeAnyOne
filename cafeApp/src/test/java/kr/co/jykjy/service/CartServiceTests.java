package kr.co.jykjy.service;
 
import java.util.List;

import org.junit.Test;

import kr.co.jykjy.domain.Cart;
import kr.co.jykjy.service.CartService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CartServiceTests {
	
	private CartService cartService = CartService.getCartService();
	
	@Test
	public void testInsert() {

		Cart cart = new Cart();
		cart.setProPrice("4500");
		cart.setProAmt("1");
		cart.setId("galgal2");
		cart.setProNo(21L);
		
		cartService.register(cart);
		log.info(cart);
		
	}
	 
	@Test
	public void testGetCart() {
		cartService.getCart("yyyy");
	}
	
	
	@Test
	public List<Cart> TestCartByParams(String id, Long proNo){
			String testid = "kal";
			Long testProNo = 14L;
			return cartService.CartByParams(testid, testProNo);
	}
}
