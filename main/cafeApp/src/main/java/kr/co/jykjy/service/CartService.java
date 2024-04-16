package kr.co.jykjy.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.jykjy.domain.Cart;
import kr.co.jykjy.mapper.CartMapper;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;
import util.MybatisUtils;

/**
 * 
 * @author kss kjy
 * @ 장바구니 서비스
 */

@Log4j
@NoArgsConstructor(access=AccessLevel.PRIVATE)
public class CartService{
	@Getter
	private static CartService cartService = new CartService();
	private SqlSession sqlSession = MybatisUtils.sqlSessionFactory().openSession(true);
	private CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);

	public int register(Cart cart) {
		return cartMapper.insert(cart);
	}

	public List<Cart> getCart(String id) {
		Cart cart = new Cart();
		log.info(cart);
		return cartMapper.getCart(id);
	}
	
	public List<Cart> CartByParams(String id, Long proNo) {
		return cartMapper.CartByParams(id, proNo);
	}
	
	public List<Cart> getOrderMenu(String id) {
		return cartMapper.getOrderMenu(id);
	}
	
	public List<Cart> getList(String id) {
		return cartMapper.getList(id);
	}
	
	public List<Cart> getOrderList(String id) {
		return cartMapper.getOrderList(id);
	}
	
	public Cart findByCartNo(String id) {
		return cartMapper.findByCartNo(id);
	}
	
	public int modify(Cart cart) {
		return cartMapper.modify(cart);
	}
	
	public int delete(Cart cart) {
		return cartMapper.remove(cart);
	}
	
	public List<Cart> get(String id, Long proNo) {
		return cartMapper.get(id, proNo);
	}
}
