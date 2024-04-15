package kr.co.jykjy.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import kr.co.jykjy.mapper.CategoryMapper;
import kr.co.jykjy.service.CategoryService;

@WebFilter("/*")
public class CategoryFilter implements Filter {
	private CategoryService categoryService = new CategoryService();

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setAttribute("categories", categoryService.getCateogoryList());
		chain.doFilter(request, response);
	}
}