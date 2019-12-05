package news.controller.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.model.user.User;
import news.service.login.LoginService;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String checkCode = request.getParameter("checkCode");
		System.out.println(account+password+checkCode);//

		User user = new LoginService().checkUser(account,password);
		if (user==null) {
			request.setAttribute("errorMsg", "账号或密码有误!");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}else {

			if (!"1150".equals(checkCode)) {
				request.setAttribute("errorMsg", "验证码有误!");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}else {
				request.getSession().setAttribute("USER_IN_SESSION", user);
				response.sendRedirect(request.getContextPath()+"/index");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
