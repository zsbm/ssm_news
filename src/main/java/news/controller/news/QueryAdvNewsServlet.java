package news.controller.news;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.model.news.News;
import news.model.news.NewsQueryObject;
import news.page.news.PageResult;
import news.service.news.NewPageQueryService;
import news.service.news.NewsService;
import news.service.user.UserPageQueryService;

@WebServlet("/news/queryAdvNews")
public class QueryAdvNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("QueryAdvNewsServlet in...");
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String type = request.getParameter("type");
		System.out.println(id+title+type);//12340
		NewsQueryObject newsQueryObject = new NewsQueryObject(id, title, type);

		String currentPageString = request.getParameter("currentPage");
		String pageSizeString = request.getParameter("pageSize");
		PageResult pageResult = new PageResult();
		int currentPage = 1;
		int pageSize = 2;
		if (!("".equals(currentPageString))&&currentPageString!=null) {
			currentPage= Integer.parseInt(currentPageString);
		}
		if (!("".equals(pageSizeString))&&pageSizeString!=null) {
			pageSize=Integer.parseInt(pageSizeString);
		}
		pageResult.setCurrentPage(currentPage);
		pageResult.setPageSize(pageSize);
		pageResult=new NewPageQueryService().queryNewsByConditionByPageQuery(newsQueryObject,pageResult);
		System.out.println(pageResult);//
		request.setAttribute("pageResult", pageResult);
		request.setAttribute("newsQueryObject", newsQueryObject);
//		List<News> newsList = new NewsService().queryNewsByCondition(newsQueryObject);
//		System.out.println(newsList);//
//		request.setAttribute("newsQueryObject", newsQueryObject);
//		request.setAttribute("newsList", newsList);
		request.getRequestDispatcher("/news/newsQuery.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
