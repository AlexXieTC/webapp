package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter{

	public void init(FilterConfig config) throws ServletException{
		System.out.println("EncogingFilterの生成完了");
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain)throws IOException,ServletException{
		System.out.println("doFilterの実行");
		request.setCharacterEncoding("Shift-JIS");
		chain.doFilter(request, response);
	}

	public void destroy() {
		System.out.println("EncodingFilterの破棄を実行");
	}
}