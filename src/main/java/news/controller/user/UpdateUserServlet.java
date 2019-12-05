package news.controller.user;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.model.news.News;
import news.model.user.User;
import news.service.news.NewsService;
import news.service.user.UserService;

@WebServlet("/user/updateUser")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UpdateUserServlet in...");
		String id = request.getParameter("id");
		String account = request.getParameter("account");
		String username = request.getParameter("username");
		String auth = request.getParameter("auth");
		System.out.println(id+account+username+auth);//
//		String createDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
//		int userId = ((User)(request.getSession().getAttribute("USER_IN_SESSION"))).getId();
		int rows = new UserService().updateUser(new User(Integer.parseInt(id), account, username, auth));
		if (rows==1) {
			request.setAttribute("message", "修改成功...");
		}else {
			request.setAttribute("message", "修改失败...");
		}
		request.getRequestDispatcher("/user/userManager").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
