package news.controller.user;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/user/addUser")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AddUserServlet...");
		String id = request.getParameter("id");
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String username = request.getParameter("username");
		String auth = request.getParameter("auth");
		System.out.println(id+account+password+username+auth);//
//		String createDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
//		int userId = ((User)(request.getSession().getAttribute("USER_IN_SESSION"))).getId();
		UserService userService = new UserService();

		int count = userService.verifyId(Integer.parseInt(id));
		PrintWriter printWriter = response.getWriter();
		if (count==1) {
			printWriter.println(false);
		}else {
			int rows = userService.addUser(new User(Integer.parseInt(id), account, password, username, auth));
			if (rows!=1) {

				printWriter.println(0);
			}else {

				printWriter.println(1);
			}
		}
		printWriter.flush();
		printWriter.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
