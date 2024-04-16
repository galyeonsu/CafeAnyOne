package kr.co.jykjy.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.jykjy.domain.Payment;
import kr.co.jykjy.mapper.PaymentMapper;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;
import util.MybatisUtils;

/**
 * 
 * @author kss
 * @ 상품 주문 서비스
 */

@Log4j
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class PaymentService {
	@Getter
	private static PaymentService paymentService = new PaymentService();
	private SqlSession sqlSession = MybatisUtils.sqlSessionFactory().openSession(true);
	private PaymentMapper paymentMapper = sqlSession.getMapper(PaymentMapper.class);
	
	public int register(Payment payment) {
		return paymentMapper.insert(payment);
	}
	
	public List<Payment> get(String orderCode) {
		return paymentMapper.getList(orderCode);
	}
}
