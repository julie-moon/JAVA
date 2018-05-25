package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class TestFilter implements Filter{

	@Override
	public void destroy() {
		System.out.println("필터 죽음");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		/*
			필터는 여러 페이지에 대해서 전처리, 후처리 가능
			로그인 확인, 포스트 방식의 한글 처리 등에 사용할 수 있음
		*/
		
		// 전처리
		request.setCharacterEncoding("UTF-8"); // 모든 페이지에 포스트 방식의 한글 처리
		// out.println("previous");
		chain.doFilter(request, response);
		// out.println("next");
		
		// 후처리
		
	} // doFilter() end

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("초기화-!");
	}
	
}
