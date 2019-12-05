package news.controller.news;

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

@WebServlet("/news/addNews")
public class AddNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AddNewsServlet...");
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String type = request.getParameter("type");
		String content = request.getParameter("content");
		System.out.println(id+title+type+content);//
		String createDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		int userId = ((User)(request.getSession().getAttribute("USER_IN_SESSION"))).getId();
		NewsService newsService = new NewsService();

		int count = newsService.verifyId(Integer.parseInt(id));
		PrintWriter printWriter = response.getWriter();
		if (count==1) {
			printWriter.println(false);
		}else {
			int rows = newsService.addNews(new News(Integer.parseInt(id), title, content, createDate, userId, Integer.parseInt(type)));
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
