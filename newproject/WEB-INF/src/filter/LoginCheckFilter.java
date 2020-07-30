package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;

@WebFilter(urlPatterns={"/showinfo", "/status","/news","/showresult","/renewconfirmation","/buysellaction"})
public class LoginCheckFilter implements Filter{
	public void init(FilterConfig config) throws ServletException{
		System.out.println("LoginCheckFilterの生成完了");
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain)throws IOException,ServletException{
		 HttpServletRequest httpReq = (HttpServletRequest) request;
		 HttpServletResponse httpRes = (HttpServletResponse) response;

		 HttpSession session = httpReq.getSession();
		 User user =(User)session.getAttribute("user");
		 if(user == null) {
			 httpRes.sendRedirect(httpReq.getContextPath());
				System.out.println("ログインチェック失敗");
			 return;
		 }

		chain.doFilter(request, response);
	}

	public void destroy() {
		System.out.println("EncodingFilterの破棄を実行");
	}
}
