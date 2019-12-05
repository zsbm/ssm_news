package news.controller.news;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.model.news.News;
import news.model.news.NewsDTO;
import news.service.news.NewsService;

@WebServlet("/news/newsDetail")
public class NewsDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("NewsDetailServlet in...");
		String id = request.getParameter("id");
		System.out.println(id);//
		NewsDTO newsDTO = new NewsService().queryNewsById(id);
		request.setAttribute("newsDTO", newsDTO);
		request.getRequestDispatcher("/news/newsDetail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
