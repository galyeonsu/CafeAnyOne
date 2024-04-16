package kr.co.jykjy.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import kr.co.jykjy.service.ProCategoryService;

@WebFilter("/*")
public class ProCategoryFilter implements Filter {
	private ProCategoryService proCategoryService = ProCategoryService.getProCategoryService();
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setAttribute("proCategories", proCategoryService.getList());
		chain.doFilter(request, response);
	}
}
