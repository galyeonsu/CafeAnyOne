package kr.co.jykjy.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.domain.PrAttach;
import kr.co.jykjy.domain.Product;
import kr.co.jykjy.mapper.PrAttachMapper;
import kr.co.jykjy.mapper.ProductMapper;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import util.MybatisUtils;

/**
 * 
 * @author kss
 * @ 상품 서비스
 */

@NoArgsConstructor(access=AccessLevel.PRIVATE)
public class ProductService {
	@Getter
	private static ProductService productService = new ProductService();
	private SqlSession sqlSession = MybatisUtils.sqlSessionFactory().openSession(true);
	private ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
	private PrAttachMapper prAttachMapper = sqlSession.getMapper(PrAttachMapper.class);

	public List<Product> getList(Criteria cri) {
		return productMapper.getList(cri);
	}
	
	public Product findByProNo(Long proNo) {
		return productMapper.findByProNo(proNo);
	}
	
	public List<PrAttach> findByNo(Long proNo) {
		return prAttachMapper.findByNo(proNo);
	}
	
	// transaction
	public void register(Product product) {
		List<PrAttach> attachList = product.getAttachs();
		
		int res = productMapper.insert(product);
		
		for(PrAttach prAttach : attachList) {
			prAttach.setProNo(product.getProNo());
			// file DB input
			prAttachMapper.attachInsert(prAttach);
		}
				
		if(res > 0) {
			sqlSession.commit();
		}
	}
	
	public int getTotal(Criteria cri) {
		return productMapper.getTotalCount(cri);
	}
	
	public int remove(Long proNo) {
		prAttachMapper.attachDelete(proNo);
		return productMapper.delete(proNo);
	}
	
	public int modify(Product product) {
		return productMapper.update(product);
	}
}
