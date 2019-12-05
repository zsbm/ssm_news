package news.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("LoginFilter in...");
		HttpServletRequest httpServletRequest = (HttpServletRequest)request;
		HttpServletResponse httpServletResponse = (HttpServletResponse)response;
		Object object = httpServletRequest.getSession().getAttribute("USER_IN_SESSION");
		if (object==null) {
			httpServletRequest.setAttribute("errorMsg", "登录后才能访问...");
			httpServletRequest.getRequestDispatcher("/login_permission.jsp").forward(httpServletRequest, httpServletResponse);
//			httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/login.jsp");
		}else {
			chain.doFilter(httpServletRequest, httpServletResponse);
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void destroy() {
	}
}
