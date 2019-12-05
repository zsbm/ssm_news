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

import news.model.user.User;

public class AuthFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("AuthFilter in...");
		HttpServletRequest httpServletRequest = (HttpServletRequest)request;
		HttpServletResponse httpServletResponse = (HttpServletResponse)response;
		String auth = ((User)(httpServletRequest.getSession().getAttribute("USER_IN_SESSION"))).getAuth();
		System.out.println(auth);//
		String servletPath = httpServletRequest.getServletPath();
		System.out.println(servletPath);//
		if ("/*".equals(auth)) {
			chain.doFilter(httpServletRequest, httpServletResponse);
		}else {
			String[] split = auth.split(",");
			int count=0;
			for (String string : split) {
				if (servletPath.contains(string)) {
					count++;
					break;
				}
			}
			if (count==0) {
				httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/no_auth.jsp");
			}else {
				chain.doFilter(httpServletRequest, httpServletResponse);
			}
		}
	}
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}
	@Override
	public void destroy() {
	}
}
