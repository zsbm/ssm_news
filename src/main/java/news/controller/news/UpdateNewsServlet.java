package news.controller.news;

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

@WebServlet("/news/updateNews")
public class UpdateNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UpdateNewsServlet in...");
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String type = request.getParameter("type");
		String content = request.getParameter("content");
		System.out.println(id+title+type+content);//
		String createDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		int userId = ((User)(request.getSession().getAttribute("USER_IN_SESSION"))).getId();
		int rows = new NewsService().updateNews(new News(Integer.parseInt(id), title, content, createDate, userId , Integer.parseInt(type)));
		if (rows==1) {
			request.setAttribute("message", "修改成功...");
		}else {
			request.setAttribute("message", "修改失败...");
		}
		request.getRequestDispatcher("/news/newsManager").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
